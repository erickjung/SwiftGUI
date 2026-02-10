# Tutorial: State Management in SwiftGUI

Learn how to manage state effectively in SwiftGUI applications using `@State`, `Binding`, and best practices.

## Table of Contents

- [Understanding State](#understanding-state)
- [@State Property Wrapper](#state-property-wrapper)
- [Binding](#binding)
- [State Flow Patterns](#state-flow-patterns)
- [Common Patterns](#common-patterns)
- [Best Practices](#best-practices)

## Understanding State

In immediate mode rendering, your `render()` method is called every frame. Without state management, your data would be lost between frames.

### The Problem

```swift
struct BadExample: GuiView {
    var count = 0  // ❌ Resets every frame!

    func render() {
        Window("Bad") {
            Text("Count: \(count)")
            Button("Increment") {
                count += 1  // ❌ Won't compile (immutable)
            }
        }
    }
}
```

### The Solution

```swift
struct GoodExample: GuiView {
    @State var count = 0  // ✅ Persists between frames!

    func render() {
        Window("Good") {
            Text("Count: \(count)")
            Button("Increment") {
                count += 1  // ✅ Works!
            }
        }
    }
}
```

## @State Property Wrapper

### What is @State?

`@State` is a property wrapper that provides persistent storage:

```swift
@State var counter = 0
@State var isEnabled = true
@State var name = "Alice"
@State var items: [String] = []
```

### How It Works

```swift
// Behind the scenes
@propertyWrapper
public class State<T> {
    private var value: T

    public var wrappedValue: T {
        get { value }
        nonmutating set { value = newValue }
    }

    public var projectedValue: Binding<T> {
        // Returns a Binding to this state
    }
}
```

**Key points:**
- `@State` is a **class** (reference type)
- Value persists across frames
- Changes are visible immediately
- Thread-safe (for UI thread)

### When to Use @State

✅ **Use @State for:**
- View-local state
- Temporary UI state
- Simple values that belong to one view

❌ **Don't use @State for:**
- Shared state across views (use a model)
- Computed values (use regular properties)
- Constants (use `let`)

### Examples

```swift
struct StateExamples: GuiView {
    // Simple values
    @State var count = 0
    @State var isEnabled = false
    @State var selectedIndex = 0

    // Strings
    @State var username = ""
    @State var searchQuery = ""

    // Collections
    @State var items: [String] = []
    @State var tags: Set<String> = []

    // Optional values
    @State var selectedItem: String? = nil

    // Custom types
    @State var settings = AppSettings()

    func render() {
        // Use state in your UI
    }
}
```

## Binding

### What is Binding?

`Binding` is a two-way reference to a value:

```swift
struct Parent: GuiView {
    @State var text = "Hello"

    func render() {
        Window("Parent") {
            // Pass binding using $
            ChildView(text: $text)

            Text("Parent sees: \(text)")
        }
    }
}

struct ChildView: GuiView {
    @Binding var text: String

    func render() {
        TextField(text: $text)
        // Child can read AND write!
    }
}
```

### Creating Bindings

**1. From @State (most common):**

```swift
@State var value = 42

// Use $ to get binding
let binding = $value
```

**2. Custom Binding:**

```swift
let customBinding = Binding(
    get: { self.computedValue },
    set: { newValue in
        self.handleNewValue(newValue)
    }
)
```

**3. Constant Binding:**

```swift
let constantBinding = Binding.constant(true)
// Always returns true, ignores writes
```

### Binding in Controls

Controls that modify values accept bindings:

```swift
struct BindingExample: GuiView {
    @State var isChecked = false
    @State var sliderValue: Float = 0.5
    @State var text = ""
    @State var selectedIndex = 0

    func render() {
        Window("Bindings") {
            CheckBox("Enable", isOn: $isChecked)

            Slider(value: $sliderValue, in: 0...1)

            TextField(text: $text)

            ComboBox(
                "Pick",
                selectedIndex: $selectedIndex,
                items: ["A", "B", "C"]
            )
        }
    }
}
```

## State Flow Patterns

### Pattern 1: Parent → Child (Read-Only)

Pass values directly (no binding needed):

```swift
struct Parent: GuiView {
    @State var count = 5

    func render() {
        ChildDisplay(count: count)  // Pass value
    }
}

struct ChildDisplay: GuiView {
    let count: Int  // Read-only

    func render() {
        Text("Count is: \(count)")
    }
}
```

### Pattern 2: Parent ↔ Child (Two-Way)

Pass binding for modification:

```swift
struct Parent: GuiView {
    @State var count = 5

    func render() {
        ChildEditor(count: $count)  // Pass binding
    }
}

struct ChildEditor: GuiView {
    @Binding var count: Int  // Can read and write

    func render() {
        Text("Count: \(count)")
        Button("+") { count += 1 }
        Button("-") { count -= 1 }
    }
}
```

### Pattern 3: Derived Bindings

Create bindings from computed values:

```swift
struct DerivedBindingExample: GuiView {
    @State var fahrenheit: Double = 32

    var celsiusBinding: Binding<Double> {
        Binding(
            get: { (fahrenheit - 32) * 5/9 },
            set: { celsius in
                fahrenheit = celsius * 9/5 + 32
            }
        )
    }

    func render() {
        Window("Temperature") {
            Slider(
                label: "°F",
                value: $fahrenheit,
                in: 0...100
            )

            Slider(
                label: "°C",
                value: celsiusBinding,
                in: -20...40
            )

            Text("Fahrenheit: \(fahrenheit, specifier: "%.1f")°F")
            Text("Celsius: \(celsiusBinding.wrappedValue, specifier: "%.1f")°C")
        }
    }
}
```

### Pattern 4: Multiple Sources of Truth

Use a shared model:

```swift
class AppModel {
    @State var username = ""
    @State var isLoggedIn = false
    @State var items: [Item] = []
}

struct MainView: GuiView {
    let model: AppModel

    func render() {
        Window("App") {
            UserPanel(username: $model.username)
            ItemList(items: $model.items)
        }
    }
}
```

## Common Patterns

### Toggle States

```swift
struct ToggleExample: GuiView {
    @State var showAdvanced = false

    func render() {
        Window("Settings") {
            CheckBox("Show Advanced", isOn: $showAdvanced)

            if showAdvanced {
                Text("Advanced options here")
                // More controls...
            }
        }
    }
}
```

### Form State

```swift
struct FormExample: GuiView {
    @State var name = ""
    @State var email = ""
    @State var age = 18
    @State var newsletter = false

    func render() {
        Window("Form") {
            TextField(label: "Name", text: $name)
            TextField(label: "Email", text: $email)
            Drag(label: "Age", value: $age, in: 0...120)
            CheckBox("Subscribe to newsletter", isOn: $newsletter)

            Button("Submit") {
                submitForm()
            }
        }
    }

    func submitForm() {
        print("Name: \(name)")
        print("Email: \(email)")
        print("Age: \(age)")
        print("Newsletter: \(newsletter)")
    }
}
```

### List State

```swift
struct ListExample: GuiView {
    @State var items = ["Apple", "Banana", "Cherry"]
    @State var newItem = ""

    func render() {
        Window("List") {
            // Display items
            ForEach(items) { item in
                Text("• \(item)")
            }

            NewLine()
            Divider()

            // Add new item
            TextField(label: "New item", text: $newItem)

            Button("Add") {
                if !newItem.isEmpty {
                    items.append(newItem)
                    newItem = ""
                }
            }
        }
    }
}
```

### Selection State

```swift
struct SelectionExample: GuiView {
    @State var selectedTab = 0
    @State var selectedItem: String? = nil

    func render() {
        Window("Selection") {
            TabBar {
                TabItem("Home") {
                    if selectedTab == 0 {
                        Text("Home content")
                    }
                }
                TabItem("Settings") {
                    if selectedTab == 1 {
                        Text("Settings content")
                    }
                }
            }

            if let item = selectedItem {
                Text("Selected: \(item)")
            }
        }
    }
}
```

## Best Practices

### 1. Keep State Local

```swift
// ✅ Good: State in the view that needs it
struct Counter: GuiView {
    @State var count = 0

    func render() {
        Text("Count: \(count)")
        Button("+") { count += 1 }
    }
}

// ❌ Bad: Unnecessary global state
class GlobalState {
    @State var count = 0  // Shared when not needed
}
```

### 2. Use Bindings for Sharing

```swift
// ✅ Good: Pass binding to child
struct Parent: GuiView {
    @State var value = ""

    func render() {
        ChildEditor(text: $value)
    }
}

// ❌ Bad: Callback soup
struct Parent: GuiView {
    @State var value = ""

    func render() {
        ChildEditor(
            text: value,
            onTextChange: { newValue in
                value = newValue
            }
        )
    }
}
```

### 3. Don't Abuse State

```swift
// ✅ Good: Computed property
struct GoodExample: GuiView {
    @State var items: [String]

    var itemCount: Int { items.count }  // Computed

    func render() {
        Text("Items: \(itemCount)")
    }
}

// ❌ Bad: Redundant state
struct BadExample: GuiView {
    @State var items: [String]
    @State var itemCount = 0  // ❌ Duplicates items.count

    func render() {
        Text("Items: \(itemCount)")
    }
}
```

### 4. Initialize Properly

```swift
// ✅ Good: Initialize with default value
@State var count = 0
@State var items: [String] = []

// ❌ Bad: Uninitialized (won't compile)
@State var count: Int  // ❌ Error
```

### 5. Use Meaningful Names

```swift
// ✅ Good: Descriptive names
@State var isLoginFormVisible = false
@State var selectedUserIndex = 0
@State var searchQuery = ""

// ❌ Bad: Unclear names
@State var flag = false
@State var x = 0
@State var str = ""
```

## Debugging State

### Print State Changes

```swift
@State var count = 0 {
    didSet {
        print("Count changed to: \(count)")
    }
}
```

### Check Binding Flow

```swift
var customBinding: Binding<Int> {
    Binding(
        get: {
            print("Reading value: \(count)")
            return count
        },
        set: { newValue in
            print("Writing value: \(newValue)")
            count = newValue
        }
    )
}
```

## Summary

✅ Use `@State` for persistent local state
✅ Use `Binding` to share state with children
✅ Use `$` syntax to create bindings from `@State`
✅ Keep state as local as possible
✅ Use computed properties for derived values
✅ Use meaningful names

## Next Steps

- [Custom Views Tutorial](custom-views.md)
- [State Management API](../Api/state.md)
- [Best Practices Guide](../Guides/best-practices.md)

## Exercises

1. Create a todo list with add/remove functionality
2. Build a form with validation state
3. Implement a multi-step wizard with step state
4. Create a filterable list with search state
5. Build a settings panel with multiple toggles
