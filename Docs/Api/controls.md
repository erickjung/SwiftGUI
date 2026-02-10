# Controls API Reference

Complete reference for all interactive control types in SwiftGUI.

## Table of Contents

- [Action Controls](#action-controls)
- [Stateful Controls](#stateful-controls)
- [Quick Reference](#quick-reference)

## Action Controls

Controls that perform actions when interacted with.

### Button

Clickable button that executes an action.

```swift
struct Button: GuiView {
    let text: String
    let type: ButtonType
    let action: () -> Void

    enum ButtonType {
        case `default`
        case small
    }

    init(_ text: String, type: ButtonType = .default, action: @escaping () -> Void)
}
```

**Modifiers:**
- `backgroundColor(_:)`: Sets background color
- `borderColor(_:)`: Sets border color
- `activeColor(_:)`: Sets color when pressed
- `hoveredColor(_:)`: Sets color when hovered
- `size(_:)`: Sets button size
- All `Modifiable` modifiers (textColor, padding, etc.)

**Usage:**

```swift
// Basic button
Button("Click Me") {
    print("Button clicked!")
}

// Styled button
Button("Submit") {
    submitForm()
}
.backgroundColor(.green)
.activeColor(.darkGreen)
.size(width: 120, height: 35)

// Small button
Button("X", type: .small) {
    close()
}
.backgroundColor(.red)
```

**Notes:**
- Action is called when button is clicked
- Button can be styled with colors and size
- Small type for compact buttons

---

### MenuItem

Menu item with optional shortcut.

```swift
struct MenuItem: GuiView {
    let text: String
    let shortcut: String
    let selected: Bool
    let enabled: Bool
    let action: (() -> Void)?

    init(
        _ text: String,
        shortcut: String = "",
        selected: Bool = false,
        enabled: Bool = true,
        action: (() -> Void)? = nil
    )
}
```

**Parameters:**
- `text`: Menu item label
- `shortcut`: Keyboard shortcut display (display only, doesn't bind keys)
- `selected`: Whether item shows checkmark
- `enabled`: Whether item is clickable
- `action`: Optional action to perform

**Usage:**

```swift
MenuItem("Open", shortcut: "Cmd+O") {
    openFile()
}

MenuItem("Save", shortcut: "Cmd+S", enabled: false)

MenuItem("Auto-save", selected: autoSaveEnabled) {
    toggleAutoSave()
}
```

---

### MenuGroup

Group of menu items.

```swift
struct MenuGroup: GuiView {
    let text: String
    let enabled: Bool
    var backgroundColor: GuiColor?

    init(
        _ text: String,
        enabled: Bool = true,
        @GuiBuilder content: () -> GuiView
    )
}
```

**Modifiers:**
- `backgroundColor(_:)`: Sets background color

**Usage:**

```swift
MenuGroup("File") {
    MenuItem("New", shortcut: "Cmd+N") { createNew() }
    MenuItem("Open", shortcut: "Cmd+O") { open() }
    MenuItem("Save", shortcut: "Cmd+S") { save() }
}
.backgroundColor(.darkGray)

MenuGroup("Edit", enabled: false) {
    MenuItem("Cut")
    MenuItem("Copy")
    MenuItem("Paste")
}
```

---

### MenuBar

Top-level menu bar containing menu groups.

```swift
struct MenuBar: GuiView {
    var backgroundColor: GuiColor?
    var hoveredColor: GuiColor?

    init(@GuiBuilder content: () -> GuiView)
}
```

**Modifiers:**
- `backgroundColor(_:)`: Sets background color
- `hoveredColor(_:)`: Sets color when hovered

**Usage:**

```swift
MenuBar {
    MenuGroup("File") {
        MenuItem("New") { }
        MenuItem("Open") { }
        MenuItem("Save") { }
    }

    MenuGroup("Edit") {
        MenuItem("Cut") { }
        MenuItem("Copy") { }
        MenuItem("Paste") { }
    }

    MenuGroup("Help") {
        MenuItem("About") { }
    }
}
.backgroundColor(.darkGray)
.hoveredColor(.lightGray)
```

---

## Stateful Controls

Controls that are bound to state values.

### CheckBox

Boolean checkbox control.

```swift
struct CheckBox: GuiView {
    let text: String
    let isOn: Binding<Bool>
    var activeColor: GuiColor?

    init(_ text: String = "", isOn: Binding<Bool>)
}
```

**Modifiers:**
- `activeColor(_:)`: Sets color when checked

**Usage:**

```swift
@State var isEnabled = false
@State var autoSave = true

CheckBox("Enable feature", isOn: $isEnabled)

CheckBox("Auto-save", isOn: $autoSave)
    .activeColor(.green)
```

---

### RadioButton

Single radio button (use RadioButtonGroup for groups).

```swift
struct RadioButton: GuiView {
    let text: String
    let isActive: Binding<Bool>
    var activeColor: GuiColor?

    init(_ text: String = "", isActive: Binding<Bool>)
}
```

**Usage:**

```swift
@State var option1 = true
@State var option2 = false

RadioButton("Option 1", isActive: $option1)
RadioButton("Option 2", isActive: $option2)
```

---

### RadioButtonGroup

Group of mutually exclusive radio buttons.

```swift
struct RadioButtonGroup: GuiView {
    let values: [String]
    let selectedIndex: Binding<Int>

    init(_ values: [String], selectedIndex: Binding<Int>)
}
```

**Usage:**

```swift
@State var selectedOption = 0

RadioButtonGroup(
    ["Small", "Medium", "Large"],
    selectedIndex: $selectedOption
)

// Selected value
let size = ["Small", "Medium", "Large"][selectedOption]
```

---

### Slider

Numeric slider control.

```swift
struct Slider<T: Numeric>: GuiView {
    let label: String
    let value: Binding<T>
    let range: ClosedRange<T>
    var backgroundColor: GuiColor?
    var activeColor: GuiColor?
    var hoveredColor: GuiColor?
    var selectionColor: GuiColor?

    init(
        label: String = "",
        value: Binding<T>,
        in range: ClosedRange<T> = 0...100
    )
}
```

**Modifiers:**
- `backgroundColor(_:)`: Sets background color
- `activeColor(_:)`: Sets active color
- `hoveredColor(_:)`: Sets hovered color
- `selectionColor(_:)`: Sets selection color

**Usage:**

```swift
@State var volume: Float = 50.0
@State var brightness = 0.75

Slider(label: "Volume", value: $volume, in: 0...100)
    .activeColor(.blue)

Slider(value: $brightness, in: 0.0...1.0)
```

---

### Drag

Numeric drag control (click and drag to change value).

```swift
struct Drag<T: Numeric>: GuiView {
    let label: String
    let value: Binding<T>
    let speed: Float
    let range: ClosedRange<T>
    var backgroundColor: GuiColor?
    var hoveredColor: GuiColor?

    init(
        label: String = "",
        value: Binding<T>,
        speed: Float = 1.0,
        in range: ClosedRange<T> = 0...100
    )
}
```

**Parameters:**
- `speed`: How fast the value changes when dragging

**Usage:**

```swift
@State var count = 0
@State var temperature = 20.0

Drag(label: "Count", value: $count, speed: 1.0, in: 0...100)

Drag(label: "Temp", value: $temperature, speed: 0.5, in: -10...40)
    .backgroundColor(.gray)
```

---

### TextField

Text input field.

```swift
struct TextField: GuiView {
    let type: TextFieldType
    let label: String
    let text: Binding<String>
    let placeHolder: String
    var size: GuiSize?

    enum TextFieldType {
        case `default`
        case multiline
        case password
    }

    init(
        type: TextFieldType = .default,
        label: String = "",
        text: Binding<String>,
        placeHolder: String = ""
    )
}
```

**Modifiers:**
- `size(_:)`: Sets field size

**Usage:**

```swift
@State var name = ""
@State var email = ""
@State var password = ""
@State var notes = ""

TextField(label: "Name", text: $name)
    .size(width: 200, height: 25)

TextField(
    type: .password,
    label: "Password",
    text: $password,
    placeHolder: "Enter password"
)

TextField(type: .multiline, text: $notes)
    .size(width: 300, height: 100)
```

---

### TextEditor

Multi-line text editor.

```swift
struct TextEditor: GuiView {
    let text: Binding<String>

    init(_ text: Binding<String>)
}
```

**Usage:**

```swift
@State var code = "func main() {\n    print(\"Hello\")\n}"

TextEditor($code)
```

---

### ComboBox

Dropdown selection control.

```swift
struct ComboBox: GuiView {
    let text: String
    let selectedIndex: Binding<Int>
    let items: [String]
    var backgroundColor: GuiColor?
    var activeColor: GuiColor?
    var hoveredColor: GuiColor?
    var selectionColor: GuiColor?

    init(
        _ text: String,
        selectedIndex: Binding<Int>,
        items: [String]
    )
}
```

**Modifiers:**
- Color modifiers for styling

**Usage:**

```swift
@State var selectedColor = 0

ComboBox(
    "Color",
    selectedIndex: $selectedColor,
    items: ["Red", "Green", "Blue"]
)
.backgroundColor(.darkGray)

// Get selected value
let color = ["Red", "Green", "Blue"][selectedColor]
```

---

### ListBox

List selection control.

```swift
struct ListBox: GuiView {
    let label: String
    let selectedIndex: Binding<Int>
    let items: [String]
    var backgroundColor: GuiColor?
    var activeColor: GuiColor?
    var hoveredColor: GuiColor?
    var selectionColor: GuiColor?

    init(
        label: String = "",
        selectedIndex: Binding<Int>,
        items: [String]
    )
}
```

**Usage:**

```swift
@State var selectedFile = 0

ListBox(
    label: "Files",
    selectedIndex: $selectedFile,
    items: ["file1.txt", "file2.txt", "file3.txt"]
)
.selectionColor(.blue)
```

---

### ColorEdit

Color picker control.

```swift
struct ColorEdit: GuiView {
    let color: Binding<GuiColor>
    var backgroundColor: GuiColor?
    var hoveredColor: GuiColor?

    init(color: Binding<GuiColor>)
}
```

**Usage:**

```swift
@State var themeColor = GuiColor.blue
@State var textColor = GuiColor.white

ColorEdit(color: $themeColor)
ColorEdit(color: $textColor)
```

---

## Quick Reference

### Action Controls

| Control | Purpose | Key Parameters |
|---------|---------|----------------|
| `Button` | Click action | text, action, type |
| `MenuItem` | Menu item | text, shortcut, action |
| `MenuGroup` | Menu grouping | text, enabled |
| `MenuBar` | Menu bar | content |

### Stateful Controls

| Control | Purpose | Binding Type |
|---------|---------|--------------|
| `CheckBox` | Boolean toggle | `Bool` |
| `RadioButton` | Single selection | `Bool` |
| `RadioButtonGroup` | Group selection | `Int` |
| `Slider` | Numeric range | `Numeric` |
| `Drag` | Numeric drag | `Numeric` |
| `TextField` | Text input | `String` |
| `TextEditor` | Multi-line text | `String` |
| `ComboBox` | Dropdown | `Int` (index) |
| `ListBox` | List selection | `Int` (index) |
| `ColorEdit` | Color picker | `GuiColor` |

## Common Patterns

### Form with Multiple Controls

```swift
struct SettingsForm: GuiView {
    @State var username = ""
    @State var email = ""
    @State var notifications = true
    @State var theme = 0
    @State var volume: Float = 75

    func render() {
        Window("Settings") {
            TextField(label: "Username", text: $username)
            TextField(label: "Email", text: $email)

            NewLine()
            Divider()

            CheckBox("Enable notifications", isOn: $notifications)

            ComboBox(
                "Theme",
                selectedIndex: $theme,
                items: ["Light", "Dark", "Auto"]
            )

            Slider(label: "Volume", value: $volume, in: 0...100)

            NewLine()

            Button("Save") {
                saveSettings()
            }
            .backgroundColor(.green)
        }
    }

    func saveSettings() {
        print("Saving: \(username), \(email)")
    }
}
```

## See Also

- [Action Controls Details](controls-action.md)
- [Stateful Controls Details](controls-stateful.md)
- [State Management API](state.md)
- [Views API](views.md)
- [Modifiers API](modifiers.md)
