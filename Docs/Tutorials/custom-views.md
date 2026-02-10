# Tutorial: Building Custom Views

Learn how to create reusable, composable custom views in SwiftGUI.

## Table of Contents

- [Why Custom Views?](#why-custom-views)
- [Creating Simple Components](#creating-simple-components)
- [Configurable Components](#configurable-components)
- [Stateful Components](#stateful-components)
- [Composition Patterns](#composition-patterns)
- [Best Practices](#best-practices)

## Why Custom Views?

Custom views help you:
- ✅ Reuse code across your app
- ✅ Create consistent UI patterns
- ✅ Simplify complex layouts
- ✅ Improve readability
- ✅ Enable team collaboration

## Creating Simple Components

### Basic Custom View

The simplest custom view implements `GuiView`:

```swift
struct WelcomeMessage: GuiView {
    func render() {
        Text("Welcome to SwiftGUI!")
            .font(2)
            .textColor(.cyan)
    }
}

// Usage
struct MainView: GuiView {
    func render() {
        Window("App") {
            WelcomeMessage()
        }
    }
}
```

### Parameterized View

Add properties for customization:

```swift
struct Greeting: GuiView {
    let name: String

    func render() {
        Text("Hello, \(name)!")
            .font(1)
            .textColor(.green)
    }
}

// Usage
Greeting(name: "Alice")
Greeting(name: "Bob")
```

### Styled Component

Create a consistent button style:

```swift
struct PrimaryButton: GuiView {
    let title: String
    let action: () -> Void

    func render() {
        Button(title, action: action)
            .backgroundColor(.blue)
            .activeColor(.darkBlue)
            .hoveredColor(.lightBlue)
            .size(width: 120, height: 35)
    }
}

// Usage
PrimaryButton(title: "Submit") {
    print("Submitted!")
}
```

## Configurable Components

### With Optional Parameters

```swift
struct Card: GuiView {
    let title: String
    let subtitle: String?
    let backgroundColor: GuiColor

    init(
        title: String,
        subtitle: String? = nil,
        backgroundColor: GuiColor = .darkGray
    ) {
        self.title = title
        self.subtitle = subtitle
        self.backgroundColor = backgroundColor
    }

    func render() {
        SubWindow(border: true) {
            Text(title)
                .font(1)
                .textColor(.white)

            if let subtitle = subtitle {
                Text(subtitle)
                    .textColor(.lightGray)
            }
        }
        .backgroundColor(backgroundColor)
    }
}

// Usage
Card(title: "Welcome")
Card(title: "Profile", subtitle: "Edit your info")
Card(title: "Warning", backgroundColor: .red)
```

### With Content Builder

Accept child views using `@GuiBuilder`:

```swift
struct Panel: GuiView {
    let title: String
    let content: GuiView

    init(title: String, @GuiBuilder content: () -> GuiView) {
        self.title = title
        self.content = content()
    }

    func render() {
        CollapsingHeader(title, options: .defaultOpen) {
            Group {
                content.render()
            }
            .padding(.all, value: 10)
        }
        .backgroundColor(.darkGray)
    }
}

// Usage
Panel(title: "Settings") {
    CheckBox("Enable feature", isOn: $featureEnabled)
    Slider(value: $volume, in: 0...100)
    Text("Version 1.0")
}
```

### With Enum Configuration

```swift
enum ButtonStyle {
    case primary, secondary, danger

    var color: GuiColor {
        switch self {
        case .primary: return .blue
        case .secondary: return .gray
        case .danger: return .red
        }
    }
}

struct StyledButton: GuiView {
    let title: String
    let style: ButtonStyle
    let action: () -> Void

    func render() {
        Button(title, action: action)
            .backgroundColor(style.color)
            .size(width: 100, height: 30)
    }
}

// Usage
StyledButton(title: "Save", style: .primary) { save() }
StyledButton(title: "Cancel", style: .secondary) { cancel() }
StyledButton(title: "Delete", style: .danger) { delete() }
```

## Stateful Components

### Component with Local State

```swift
struct ExpandableSection: GuiView {
    let title: String
    let content: GuiView

    @State var isExpanded = false

    init(title: String, @GuiBuilder content: () -> GuiView) {
        self.title = title
        self.content = content()
    }

    func render() {
        HStack {
            Text(isExpanded ? "▼" : "▶")
            Text(title)
                .font(1)
        }
        .onHover {
            // Highlight on hover
            return nil
        }

        // TODO: Make clickable when Button supports this

        if isExpanded {
            Group {
                content.render()
            }
            .padding(.leading, value: 20)
        }
    }
}
```

### Component with Bound State

```swift
struct SearchBox: GuiView {
    @Binding var query: String
    let placeholder: String
    let onSearch: () -> Void

    func render() {
        HStack {
            TextField(
                label: "",
                text: $query,
                placeHolder: placeholder
            )
            .size(width: 200, height: 25)

            Button("Search", action: onSearch)
                .backgroundColor(.blue)
        }
    }
}

// Usage
struct SearchView: GuiView {
    @State var searchText = ""

    func render() {
        SearchBox(
            query: $searchText,
            placeholder: "Enter search..."
        ) {
            performSearch()
        }
    }

    func performSearch() {
        print("Searching for: \(searchText)")
    }
}
```

## Composition Patterns

### Nested Components

Build complex UIs from simple components:

```swift
struct UserCard: GuiView {
    let name: String
    let email: String
    let avatar: GuiTexture?

    func render() {
        HStack(spacing: 10) {
            if let avatar = avatar {
                Image(texture: avatar)
                    .size(width: 50, height: 50)
                    .borderColor(.white)
            }

            VStack(spacing: 5) {
                Text(name)
                    .font(1)
                    .textColor(.white)

                Text(email)
                    .textColor(.gray)
            }
        }
    }
}

struct UserList: GuiView {
    let users: [User]

    func render() {
        SubWindow(border: true) {
            ForEach(users) { user in
                UserCard(
                    name: user.name,
                    email: user.email,
                    avatar: user.avatar
                )

                Divider()
            }
        }
    }
}
```

### Container Components

Create layout helpers:

```swift
struct VStack: GuiView {
    let spacing: Float
    let content: GuiView

    init(
        spacing: Float = 5,
        @GuiBuilder content: () -> GuiView
    ) {
        self.spacing = spacing
        self.content = content()
    }

    func render() {
        Group {
            content.render()
        }
        // Note: Actual VStack would need to insert Spacing() between children
    }
}

struct HStack: GuiView {
    let spacing: Float
    let content: GuiView

    init(
        spacing: Float = -1,
        @GuiBuilder content: () -> GuiView
    ) {
        self.spacing = spacing
        self.content = content()
    }

    func render() {
        // Implementation would use SameLine between children
        Group {
            content.render()
        }
    }
}
```

### Form Components

```swift
struct FormField: GuiView {
    let label: String
    @Binding var value: String
    let width: Float

    init(
        label: String,
        value: Binding<String>,
        width: Float = 200
    ) {
        self.label = label
        self._value = value
        self.width = width
    }

    func render() {
        Text(label)
            .textColor(.lightGray)

        TextField(text: $value)
            .size(width: width, height: 25)

        NewLine()
        Spacing()
    }
}

struct Form: GuiView {
    @State var name = ""
    @State var email = ""
    @State var password = ""

    func render() {
        Window("Form") {
            Text("Sign Up")
                .font(2)

            Divider()

            FormField(label: "Name", value: $name)
            FormField(label: "Email", value: $email)
            FormField(label: "Password", value: $password)

            Button("Submit") {
                submitForm()
            }
            .backgroundColor(.green)
        }
    }

    func submitForm() {
        print("Name: \(name)")
        print("Email: \(email)")
    }
}
```

## Advanced Patterns

### View Modifier Extension

Create custom modifiers:

```swift
extension GuiView {
    func debugBorder() -> some GuiView {
        // Wrap view with visual debug border
        SubWindow(border: true) {
            self.render()
        }
        .backgroundColor(.clear)
    }
}

// Usage
Text("Debug me")
    .debugBorder()
```

### Conditional Styling

```swift
struct ConditionalCard: GuiView {
    let title: String
    let isHighlighted: Bool

    func render() {
        SubWindow(border: true) {
            Text(title)
                .textColor(isHighlighted ? .yellow : .white)
        }
        .backgroundColor(isHighlighted ? .darkBlue : .darkGray)
    }
}
```

### Generic Components

```swift
struct DataList<T>: GuiView {
    let items: [T]
    let itemView: (T) -> GuiView

    init(
        items: [T],
        @GuiBuilder itemView: @escaping (T) -> GuiView
    ) {
        self.items = items
        self.itemView = itemView
    }

    func render() {
        ForEach(items) { item in
            itemView(item).render()
            Divider()
        }
    }
}

// Usage
DataList(items: users) { user in
    Text(user.name)
}
```

## Best Practices

### 1. Single Responsibility

```swift
// ✅ Good: One clear purpose
struct UserAvatar: GuiView {
    let texture: GuiTexture?
    let size: Float

    func render() {
        if let texture = texture {
            Image(texture: texture)
                .size(width: size, height: size)
        } else {
            // Placeholder
            Text("?")
        }
    }
}

// ❌ Bad: Too many responsibilities
struct UserEverything: GuiView {
    // Avatar, profile, settings, messages all in one
}
```

### 2. Clear API

```swift
// ✅ Good: Clear parameters
struct Badge: GuiView {
    let text: String
    let color: GuiColor

    init(text: String, color: GuiColor = .blue) {
        self.text = text
        self.color = color
    }
}

// ❌ Bad: Unclear parameters
struct Badge: GuiView {
    let t: String
    let c: GuiColor
    let x: Bool  // What is this?
}
```

### 3. Sensible Defaults

```swift
// ✅ Good: Smart defaults
struct InfoBox: GuiView {
    let message: String
    let icon: String
    let backgroundColor: GuiColor

    init(
        message: String,
        icon: String = "ℹ️",
        backgroundColor: GuiColor = .blue
    ) {
        self.message = message
        self.icon = icon
        self.backgroundColor = backgroundColor
    }
}

// Simple usage
InfoBox(message: "Hello")

// Customized usage
InfoBox(message: "Warning", icon: "⚠️", backgroundColor: .orange)
```

### 4. Composition Over Inheritance

```swift
// ✅ Good: Compose small views
struct ProfileHeader: GuiView {
    func render() {
        HStack {
            UserAvatar()
            UserInfo()
            ActionButtons()
        }
    }
}

// ❌ Bad: Monolithic view
struct ProfileHeader: GuiView {
    func render() {
        // 200 lines of everything mixed together
    }
}
```

### 5. Extract Constants

```swift
// ✅ Good: Named constants
struct Card: GuiView {
    private let cornerRadius: Float = 8
    private let padding: Float = 16
    private let shadowColor = GuiColor.black.withAlpha(0.2)

    func render() {
        // Use constants
    }
}

// ❌ Bad: Magic numbers
struct Card: GuiView {
    func render() {
        // padding(.all, value: 16)  // What does 16 mean?
    }
}
```

## Summary

✅ Create focused, single-purpose components
✅ Use parameters for configuration
✅ Accept `@GuiBuilder` for flexible content
✅ Provide sensible defaults
✅ Compose small components into larger ones
✅ Use `@State` for component-local state
✅ Use `@Binding` to share state with parent

## Next Steps

- [Layouts Tutorial](layouts.md)
- [Views API Reference](../Api/views.md)
- [Best Practices Guide](../Guides/best-practices.md)

## Exercises

1. Create a reusable `ProgressBar` component
2. Build a `Toast` notification component
3. Design a `TabView` container component
4. Create a `DataTable` component with sorting
5. Build a `Wizard` component for multi-step forms
