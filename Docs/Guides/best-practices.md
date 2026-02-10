# SwiftGUI Best Practices

A guide to writing clean, maintainable, and performant SwiftGUI code.

## Table of Contents

- [Code Organization](#code-organization)
- [State Management](#state-management)
- [View Composition](#view-composition)
- [Performance](#performance)
- [Naming Conventions](#naming-conventions)
- [Testing](#testing)

## Code Organization

### File Structure

Organize your SwiftGUI project logically:

```
MyApp/
├── Sources/
│   └── MyApp/
│       ├── main.swift
│       ├── App/
│       │   └── MyApp.swift
│       ├── Views/
│       │   ├── MainView.swift
│       │   ├── SettingsView.swift
│       │   └── Components/
│       │       ├── UserCard.swift
│       │       └── StatusBar.swift
│       ├── Models/
│       │   ├── User.swift
│       │   └── AppState.swift
│       └── Utilities/
│           └── Extensions.swift
└── Tests/
    └── MyAppTests/
```

### Separate Concerns

**✅ Good:**
```swift
// Views/LoginView.swift
struct LoginView: GuiView { /* ... */ }

// Models/User.swift
struct User {
    let username: String
    let email: String
}

// ViewModels/LoginViewModel.swift
class LoginViewModel {
    func login(username: String, password: String) { /* ... */ }
}
```

**❌ Bad:**
```swift
// Everything in one file
struct LoginView: GuiView {
    struct User { /* ... */ }
    class ViewModel { /* ... */ }
    // 500 lines of code...
}
```

## State Management

### Keep State Local

Only lift state when necessary:

**✅ Good:**
```swift
struct CounterView: GuiView {
    @State var count = 0  // Local to this view

    func render() {
        Text("Count: \(count)")
        Button("+") { count += 1 }
    }
}
```

**❌ Bad:**
```swift
class GlobalState {
    @State var everyPossibleValue = 0  // Overused global state
}
```

### Use Bindings for Two-Way Communication

**✅ Good:**
```swift
struct Parent: GuiView {
    @State var text = ""

    func render() {
        Editor(text: $text)  // Pass binding
    }
}

struct Editor: GuiView {
    @Binding var text: String  // Receive binding

    func render() {
        TextField(text: $text)
    }
}
```

**❌ Bad:**
```swift
struct Parent: GuiView {
    @State var text = ""

    func render() {
        Editor(
            text: text,  // Pass value
            onChange: { newText in  // Callback hell
                text = newText
            }
        )
    }
}
```

### Don't Duplicate State

**✅ Good:**
```swift
struct ListView: GuiView {
    @State var items: [String] = []

    var itemCount: Int {  // Computed property
        items.count
    }

    func render() {
        Text("Items: \(itemCount)")
    }
}
```

**❌ Bad:**
```swift
struct ListView: GuiView {
    @State var items: [String] = []
    @State var itemCount = 0  // ❌ Duplicates items.count

    func render() {
        Text("Items: \(itemCount)")
    }
}
```

## View Composition

### Create Small, Focused Components

**✅ Good:**
```swift
struct UserAvatar: GuiView {
    let texture: GuiTexture?
    let size: Float

    func render() {
        // 10 lines of focused code
    }
}

struct UserInfo: GuiView {
    let name: String
    let email: String

    func render() {
        // 10 lines of focused code
    }
}

struct UserCard: GuiView {
    func render() {
        HStack {
            UserAvatar(texture: avatar, size: 50)
            UserInfo(name: name, email: email)
        }
    }
}
```

**❌ Bad:**
```swift
struct UserCard: GuiView {
    func render() {
        // 200 lines of everything mixed together
        // Avatar + Info + Actions + Modal + ...
    }
}
```

### Use Clear Component APIs

**✅ Good:**
```swift
struct Badge: GuiView {
    let text: String
    let color: GuiColor

    init(
        text: String,
        color: GuiColor = .blue  // Sensible default
    ) {
        self.text = text
        self.color = color
    }

    func render() {
        Text(text)
            .textColor(.white)
            .backgroundColor(color)
    }
}

// Usage is clear
Badge(text: "New")
Badge(text: "Sale", color: .red)
```

**❌ Bad:**
```swift
struct Badge: GuiView {
    let t: String  // Unclear names
    let c: GuiColor
    let x: Bool  // What is this?

    // No default values, hard to use
}
```

### Extract Reusable Components

**✅ Good:**
```swift
// Extract common pattern
struct FormField: GuiView {
    let label: String
    @Binding var value: String

    func render() {
        Text(label)
        TextField(text: $value)
        NewLine()
    }
}

// Reuse everywhere
FormField(label: "Name", value: $name)
FormField(label: "Email", value: $email)
FormField(label: "Phone", value: $phone)
```

**❌ Bad:**
```swift
// Repeated code
Text("Name")
TextField(text: $name)
NewLine()

Text("Email")
TextField(text: $email)
NewLine()

Text("Phone")
TextField(text: $phone)
NewLine()
```

## Performance

### Minimize Work in render()

Remember: `render()` is called every frame (~60 FPS).

**✅ Good:**
```swift
struct DataView: GuiView {
    let processedData: [Item]  // Pre-processed

    func render() {
        ForEach(processedData) { item in
            Text(item.displayName)
        }
    }
}
```

**❌ Bad:**
```swift
struct DataView: GuiView {
    let rawData: [RawData]

    func render() {
        // ❌ Heavy processing every frame!
        let processed = rawData.map { heavy_transform($0) }
        ForEach(processed) { item in
            Text(item.displayName)
        }
    }
}
```

### Cache Expensive Computations

**✅ Good:**
```swift
struct ChartView: GuiView {
    let data: [Float]
    @State var cachedChartImage: GuiTexture?

    func render() {
        if cachedChartImage == nil {
            cachedChartImage = generateChartImage(data)
        }

        if let texture = cachedChartImage {
            Image(texture: texture)
        }
    }

    func updateData(_ newData: [Float]) {
        data = newData
        cachedChartImage = nil  // Invalidate cache
    }
}
```

### Avoid Large ForEach Loops

**✅ Good:**
```swift
// Paginate large datasets
struct ListView: GuiView {
    let items: [Item]
    @State var page = 0
    let pageSize = 50

    var visibleItems: [Item] {
        let start = page * pageSize
        let end = min(start + pageSize, items.count)
        return Array(items[start..<end])
    }

    func render() {
        ForEach(visibleItems) { item in
            ItemRow(item: item)
        }

        Pagination(page: $page, total: items.count, size: pageSize)
    }
}
```

**❌ Bad:**
```swift
// Rendering 10,000 items every frame
ForEach(allItems) { item in  // ❌ Too many!
    ItemRow(item: item)
}
```

## Naming Conventions

### Views

Use noun phrases for view names:

**✅ Good:**
```swift
struct UserCard: GuiView { }
struct SettingsPanel: GuiView { }
struct StatusBar: GuiView { }
```

**❌ Bad:**
```swift
struct ShowUser: GuiView { }  // Verb
struct Settings: GuiView { }  // Too generic
struct Bar: GuiView { }  // Unclear
```

### State Variables

Use descriptive names:

**✅ Good:**
```swift
@State var isLoginFormVisible = false
@State var selectedUserIndex = 0
@State var searchQuery = ""
@State var validationErrors: [String] = []
```

**❌ Bad:**
```swift
@State var flag = false  // What flag?
@State var index = 0  // Index of what?
@State var str = ""  // What string?
@State var arr: [String] = []  // What array?
```

### Functions

Use verb phrases for functions:

**✅ Good:**
```swift
func submitForm() { }
func validateInput() -> Bool { }
func loadUserData() { }
func handleButtonClick() { }
```

**❌ Bad:**
```swift
func form() { }  // Not a verb
func validation() -> Bool { }  // Noun
func user() { }  // Unclear
```

## Testing

### Write Testable Views

**✅ Good:**
```swift
struct UserView: GuiView {
    let user: User  // Inject dependency

    func render() {
        Text(user.name)
        Text(user.email)
    }
}

// Easy to test
let testUser = User(name: "Test", email: "test@example.com")
let view = UserView(user: testUser)
```

**❌ Bad:**
```swift
struct UserView: GuiView {
    func render() {
        let user = loadUserFromDisk()  // Hard-coded dependency
        Text(user.name)
    }
}
```

### Extract Logic from Views

**✅ Good:**
```swift
class LoginValidator {
    func validate(username: String, password: String) -> [String] {
        var errors: [String] = []
        if username.isEmpty { errors.append("Username required") }
        if password.count < 8 { errors.append("Password too short") }
        return errors
    }
}

struct LoginView: GuiView {
    let validator = LoginValidator()  // Testable separately

    @State var username = ""
    @State var password = ""

    func render() {
        // UI code
        let errors = validator.validate(username: username, password: password)
        // Display errors
    }
}

// Test the validator independently
func testValidator() {
    let validator = LoginValidator()
    let errors = validator.validate(username: "", password: "")
    assert(errors.count == 2)
}
```

## Code Style

### Consistent Formatting

**✅ Good:**
```swift
Window("Settings") {
    Text("Welcome")
        .font(1)
        .textColor(.cyan)

    TextField(text: $name)
        .size(width: 200, height: 25)

    Button("Save") {
        save()
    }
    .backgroundColor(.green)
}
```

### Use Extensions for Modifiers

**✅ Good:**
```swift
extension GuiView {
    func primaryButtonStyle() -> some GuiView {
        self
            .backgroundColor(.blue)
            .activeColor(.darkBlue)
            .size(width: 120, height: 35)
    }
}

// Usage
Button("Submit") { }
    .primaryButtonStyle()
```

### Document Complex Logic

**✅ Good:**
```swift
struct ComplexView: GuiView {
    /// Validates the form and returns true if all fields are valid.
    ///
    /// Checks:
    /// - Username is not empty
    /// - Email is valid format
    /// - Password is at least 8 characters
    func validateForm() -> Bool {
        // Implementation
    }
}
```

## Error Handling

### Handle Edge Cases

**✅ Good:**
```swift
struct ListView: GuiView {
    let items: [Item]

    func render() {
        if items.isEmpty {
            Text("No items to display")
                .textColor(.gray)
        } else {
            ForEach(items) { item in
                ItemRow(item: item)
            }
        }
    }
}
```

**❌ Bad:**
```swift
struct ListView: GuiView {
    let items: [Item]

    func render() {
        ForEach(items) { item in  // ❌ What if empty?
            ItemRow(item: item)
        }
    }
}
```

### Validate Bindings

**✅ Good:**
```swift
struct AgeInput: GuiView {
    @Binding var age: Int

    func render() {
        Drag(label: "Age", value: $age, in: 0...120)

        if age < 0 || age > 120 {
            Text("⚠️ Age must be between 0 and 120")
                .textColor(.red)
        }
    }
}
```

## Summary Checklist

- ✅ Organize code into logical folders
- ✅ Keep state as local as possible
- ✅ Create small, focused components
- ✅ Use descriptive names
- ✅ Minimize work in `render()`
- ✅ Cache expensive computations
- ✅ Handle edge cases
- ✅ Write testable code
- ✅ Document complex logic
- ✅ Use consistent formatting

## See Also

- [Architecture Overview](../architecture.md)
- [State Management Tutorial](../Tutorials/state-management.md)
- [Custom Views Tutorial](../Tutorials/custom-views.md)
- [Performance Guide](performance.md)
