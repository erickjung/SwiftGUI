# State Management API Reference

Complete reference for state management in SwiftGUI.

## Table of Contents

- [@State](#state)
- [Binding](#binding)
- [State Flow](#state-flow)

## @State

Property wrapper for persistent local state.

### Declaration

```swift
@propertyWrapper
public class State<T> {
    public init(wrappedValue: T)

    public var wrappedValue: T { get nonmutating set }
    public var projectedValue: Binding<T> { get }
}
```

### Usage

```swift
@State var count = 0
@State var isEnabled = false
@State var text = "Hello"
@State var items: [String] = []
@State var user: User? = nil
```

### Properties

**wrappedValue**
- The actual stored value
- Access directly: `count`
- Modify: `count = 10`

**projectedValue**
- Returns a `Binding` to the value
- Access with `$`: `$count`
- Use for passing to child views

### Examples

**Basic State:**

```swift
struct Counter: GuiView {
    @State var count = 0

    func render() {
        Text("Count: \(count)")

        Button("+") {
            count += 1  // Modify directly
        }
    }
}
```

**Passing Binding:**

```swift
struct Parent: GuiView {
    @State var value = ""

    func render() {
        Child(text: $value)  // Pass binding
    }
}

struct Child: GuiView {
    @Binding var text: String

    func render() {
        TextField(text: $text)  // Use binding
    }
}
```

**Complex State:**

```swift
struct Form: GuiView {
    @State var user = User()
    @State var validationErrors: [String] = []

    func render() {
        TextField(text: $user.name)
        TextField(text: $user.email)

        Button("Submit") {
            validationErrors = validate(user)
        }

        ForEach(validationErrors) { error in
            Text(error).textColor(.red)
        }
    }
}
```

### Notes

- ✅ Persists across frames
- ✅ Reference type (class)
- ✅ Use for view-local state
- ❌ Don't use for constants
- ❌ Don't use for computed values

---

## Binding

A two-way reference to a value.

### Declaration

```swift
public struct Binding<T> {
    public init(get: @escaping () -> T, set: @escaping (T) -> Void)

    public var wrappedValue: T { get nonmutating set }

    public func get() -> T
    public func set(_ value: T)

    public static func constant(_ value: T) -> Binding<T>
}
```

### Creating Bindings

**1. From @State:**

```swift
@State var value = 42

// Use $ to create binding
let binding = $value
```

**2. Custom Binding:**

```swift
let binding = Binding(
    get: { self.computeValue() },
    set: { newValue in
        self.handleNewValue(newValue)
    }
)
```

**3. Constant Binding:**

```swift
let binding = Binding.constant(true)
// Always returns true, ignores writes
```

### Methods

**get()**
- Returns the current value
- `let value = binding.get()`

**set(_:)**
- Sets a new value
- `binding.set(42)`

**wrappedValue**
- Property for getting/setting
- `let value = binding.wrappedValue`
- `binding.wrappedValue = 42`

### Usage

**With Controls:**

```swift
@State var isChecked = false
@State var sliderValue: Float = 0.5
@State var text = ""

CheckBox(isOn: $isChecked)
Slider(value: $sliderValue, in: 0...1)
TextField(text: $text)
```

**Two-Way Communication:**

```swift
struct Editor: GuiView {
    @Binding var text: String

    func render() {
        TextField(text: $text)  // Modifies parent's state

        Button("Clear") {
            text = ""  // Direct modification
        }
    }
}
```

**Derived Bindings:**

```swift
struct TemperatureView: GuiView {
    @State var celsius: Double = 0

    var fahrenheit: Binding<Double> {
        Binding(
            get: { self.celsius * 9/5 + 32 },
            set: { fahrenheit in
                self.celsius = (fahrenheit - 32) * 5/9
            }
        )
    }

    func render() {
        Slider(label: "°C", value: $celsius, in: -20...50)
        Slider(label: "°F", value: fahrenheit, in: -4...122)
    }
}
```

### Notes

- ✅ Enables two-way data flow
- ✅ Created from @State with `$`
- ✅ Passed to child views
- ✅ Used by controls
- ❌ Don't create unless needed

---

## State Flow

### Patterns

**1. Parent Owns State:**

```swift
struct Parent: GuiView {
    @State var count = 0  // Source of truth

    func render() {
        Display(count: count)        // Read-only
        Editor(count: $count)        // Read-write
    }
}

struct Display: GuiView {
    let count: Int  // Read-only

    func render() {
        Text("Count: \(count)")
    }
}

struct Editor: GuiView {
    @Binding var count: Int  // Read-write

    func render() {
        Button("+") { count += 1 }
        Button("-") { count -= 1 }
    }
}
```

**2. Shared Model:**

```swift
class AppModel {
    @State var username = ""
    @State var isLoggedIn = false
}

struct LoginView: GuiView {
    let model: AppModel

    func render() {
        TextField(text: $model.username)
        CheckBox("Remember me", isOn: $model.isLoggedIn)
    }
}
```

**3. Computed Bindings:**

```swift
struct FormView: GuiView {
    @State var firstName = ""
    @State var lastName = ""

    var fullName: Binding<String> {
        Binding(
            get: { "\(firstName) \(lastName)" },
            set: { newValue in
                let parts = newValue.split(separator: " ")
                firstName = String(parts.first ?? "")
                lastName = String(parts.last ?? "")
            }
        )
    }

    func render() {
        TextField(label: "First", text: $firstName)
        TextField(label: "Last", text: $lastName)
        TextField(label: "Full Name", text: fullName)
    }
}
```

## Best Practices

### 1. Single Source of Truth

**✅ Good:**
```swift
@State var items: [Item] = []

var itemCount: Int { items.count }  // Computed
```

**❌ Bad:**
```swift
@State var items: [Item] = []
@State var itemCount = 0  // Duplicate!
```

### 2. Keep State Local

**✅ Good:**
```swift
struct Counter: GuiView {
    @State var count = 0  // Local to Counter

    func render() { /* ... */ }
}
```

**❌ Bad:**
```swift
class GlobalState {
    @State var everyCounter = 0  // Overused
}
```

### 3. Use Bindings for Sharing

**✅ Good:**
```swift
struct Parent: GuiView {
    @State var text = ""

    func render() {
        Child(text: $text)  // Binding
    }
}
```

**❌ Bad:**
```swift
struct Parent: GuiView {
    @State var text = ""

    func render() {
        Child(
            text: text,
            onChange: { text = $0 }  // Callback
        )
    }
}
```

### 4. Initialize Properly

**✅ Good:**
```swift
@State var count = 0
@State var items: [String] = []
```

**❌ Bad:**
```swift
@State var count: Int  // ❌ Uninitialized
```

## Summary

| Type | Purpose | Ownership |
|------|---------|-----------|
| `@State` | Local persistent state | View owns |
| `Binding` | Reference to value | View references |
| `let` | Read-only value | Immutable |

## See Also

- [State Management Tutorial](../Tutorials/state-management.md)
- [Views API](views.md)
- [Controls API](controls.md)
- [Architecture](../architecture.md)
