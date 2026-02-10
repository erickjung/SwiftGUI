# Views API Reference

Complete reference for all view types in SwiftGUI.

## Table of Contents

- [Primitives](#primitives)
- [Layout Views](#layout-views)
- [Display Views](#display-views)
- [Container Views](#container-views)
- [Quick Reference](#quick-reference)

## Primitives

### Empty

A view that renders nothing. Useful as a placeholder.

```swift
struct Empty: GuiView
```

**Usage:**

```swift
Empty()

// Conditional rendering
if showContent {
    Text("Content")
} else {
    Empty()
}
```

---

### GuiNodeList

A collection of child views. Created automatically by `@GuiBuilder`.

```swift
struct GuiNodeList: GuiView {
    let children: [any GuiView]
}
```

**Usage:**

```swift
// Usually created implicitly
Group {
    Text("First")
    Text("Second")
}
// Creates GuiNodeList internally
```

---

### ForEach

Iterates over a sequence and creates views.

```swift
struct ForEach<Data: Sequence>: GuiView {
    init(_ data: Data, @GuiBuilder content: (Data.Element) -> GuiView)
}
```

**Parameters:**
- `data`: The sequence to iterate
- `content`: Closure that creates a view for each element

**Usage:**

```swift
let items = ["Apple", "Banana", "Cherry"]

ForEach(items) { item in
    Text(item)
}

// With indices
ForEach(Array(items.enumerated())) { index, item in
    Text("\(index + 1). \(item)")
}

// With ranges
ForEach(1...5) { number in
    Text("Number \(number)")
}
```

**Notes:**
- Works with any `Sequence`
- Common with arrays, ranges, dictionaries

---

## Layout Views

### HStack

Horizontal stack layout with optional spacing.

```swift
struct HStack: GuiView {
    let spacing: Float
    init(spacing: Float = -1, @GuiBuilder content: () -> GuiView)
}
```

**Parameters:**
- `spacing`: Space between elements (-1 = default ImGui spacing)
- `content`: The child views

**Usage:**

```swift
HStack {
    Text("Left")
    Text("Middle")
    Text("Right")
}

HStack(spacing: 20) {
    Button("A") { }
    Button("B") { }
    Button("C") { }
}
```

---

### NewLine

Forces a line break.

```swift
struct NewLine: GuiView
```

**Usage:**

```swift
Text("First line")
NewLine()
Text("Second line")
```

---

### SameLine

Positions the next element on the same line.

```swift
struct SameLine: GuiView {
    let offsetX: CGPoint
    let spacing: Float

    init(offsetX: CGPoint = .zero, spacing: Float = -1)
}
```

**Parameters:**
- `offsetX`: Horizontal offset
- `spacing`: Spacing before the next element

**Usage:**

```swift
Text("Label:")
SameLine()
Text("Value")

// With spacing
Text("Name:")
SameLine(spacing: 10)
TextField(text: $name)
```

---

### Spacing

Adds vertical space.

```swift
struct Spacing: GuiView
```

**Usage:**

```swift
Text("Section 1")
Spacing()
Text("Section 2")
```

---

### Divider

Renders a horizontal separator line.

```swift
struct Divider: GuiView
```

**Usage:**

```swift
Text("Header")
Divider()
Text("Content")
```

---

### Column

Sets up column layout.

```swift
struct Column: GuiView {
    let count: Int
    let border: Bool

    init(count: Int = 1, border: Bool = true)
}
```

**Parameters:**
- `count`: Number of columns
- `border`: Whether to show column borders

**Usage:**

```swift
Column(count: 3) {
    Text("Column 1")
    ColumnNext()
    Text("Column 2")
    ColumnNext()
    Text("Column 3")
}
```

---

### ColumnNext

Moves to the next column.

```swift
struct ColumnNext: GuiView
```

**Usage:**

```swift
Column(count: 2) {
    Text("Left")
    ColumnNext()
    Text("Right")
}
```

---

### ColumnWidth

Sets the width of a specific column.

```swift
struct ColumnWidth: GuiView {
    let index: Int
    let width: Float
}
```

**Usage:**

```swift
Column(count: 3) {
    ColumnWidth(index: 0, width: 100)
    ColumnWidth(index: 1, width: 200)
}
```

---

### Tooltip

Shows a tooltip on hover.

```swift
struct Tooltip: GuiView {
    init(@GuiBuilder content: () -> GuiView)
}
```

**Usage:**

```swift
Button("Help") { }
Tooltip {
    Text("Click for help")
}
```

---

## Display Views

### Text

Displays text.

```swift
struct Text: GuiView {
    let text: String
    let type: TextType

    enum TextType {
        case `default`
        case wrapped
        case bullet
    }

    init(_ text: String, type: TextType = .default)
}
```

**Parameters:**
- `text`: The text to display
- `type`: Display style (default, wrapped, or bullet)

**Modifiers:**
- `textColor(_:)`: Sets text color
- `font(_:)`: Sets font index
- `identifier(_:)`: Sets ID
- `padding(_:value:)`: Adds padding

**Usage:**

```swift
Text("Hello, World!")

Text("This is wrapped text", type: .wrapped)
    .textColor(.cyan)
    .font(1)

Text("Bullet point", type: .bullet)
```

---

### TextLabel

Displays a label-value pair.

```swift
struct TextLabel: GuiView {
    let label: String
    let value: String
}
```

**Usage:**

```swift
TextLabel(label: "Name", value: "Alice")
TextLabel(label: "Age", value: "25")
```

---

### Image

Displays an image from a texture.

```swift
struct Image: GuiView {
    let texture: GuiTexture?
    var size: CGSize
    var tintColor: GuiColor
    var borderColor: GuiColor?
    var uv0: CGSize
    var uv1: CGSize

    init(texture: GuiTexture?)
}
```

**Modifiers:**
- `size(_:)`: Sets image size
- `tintColor(_:)`: Sets tint color
- `borderColor(_:)`: Sets border color

**Usage:**

```swift
let texture = GuiTexture(from: imageObject)

Image(texture: texture)
    .size(width: 100, height: 100)
    .tintColor(.white)
    .borderColor(.gray)
```

**Default Values:**
- Size: 50x50
- Tint: white
- UV0: (0, 0)
- UV1: (1, 1)

---

### Plot

Displays data visualization (line or histogram).

```swift
struct Plot: GuiView {
    let type: PlotType
    let label: String
    let values: [Float]

    enum PlotType {
        case line
        case histogram
    }

    init(type: PlotType, label: String, values: [Float])
}
```

**Modifiers:**
- `backgroundColor(_:)`: Sets background color
- `activeColor(_:)`: Sets active color
- `hoveredColor(_:)`: Sets hovered color
- `size(_:)`: Sets plot size

**Usage:**

```swift
let data = [1.0, 2.5, 2.0, 4.0, 3.5]

Plot(type: .line, label: "Sales", values: data)
    .backgroundColor(.darkGray)
    .size(width: 300, height: 200)

Plot(type: .histogram, label: "Distribution", values: data)
    .activeColor(.blue)
```

---

## Container Views

### Window

Top-level window container.

```swift
struct Window: GuiView {
    let text: String
    let options: GuiWindowConfig

    init(
        _ text: String = "",
        options: GuiWindowConfig = .none,
        @GuiBuilder content: () -> GuiView
    )
}
```

**Window-Specific Modifiers:**
- `position(_:condition:)`: Sets window position
- `windowSize(_:condition:)`: Sets window size

**Options:**
- `.none`: Default window
- `.noResize`: Cannot be resized
- `.noMove`: Cannot be moved
- `.noTitleBar`: No title bar
- `.noScrollbar`: No scrollbars
- And more...

**Usage:**

```swift
Window("My App") {
    Text("Content here")
}
.windowSize(GuiSize(width: 800, height: 600))
.position(GuiPoint(x: 100, y: 100), condition: .firstUseEver)

Window("Settings", options: .noResize) {
    // Settings UI
}
```

---

### SubWindow

Child window within a parent.

```swift
struct SubWindow: GuiView {
    let border: Bool
    var size: GuiSize?

    init(
        border: Bool = false,
        @GuiBuilder content: () -> GuiView
    )
}
```

**Modifiers:**
- `size(_:)`: Sets subwindow size

**Usage:**

```swift
SubWindow(border: true) {
    Text("Child window content")
}
.size(GuiSize(width: 300, height: 200))
```

---

### Group

Logical grouping of views. No visual appearance.

```swift
struct Group: GuiView {
    init(@GuiBuilder content: () -> GuiView)
}
```

**Usage:**

```swift
Group {
    Text("Item 1")
    Text("Item 2")
    Text("Item 3")
}
```

---

### Popup

Modal or context popup.

```swift
struct Popup: GuiView {
    let type: PopupType
    let options: GuiWindowConfig

    enum PopupType {
        case `default`
        case modal
    }

    init(
        type: PopupType = .default,
        options: GuiWindowConfig = .none,
        @GuiBuilder content: () -> GuiView
    )
}
```

**Usage:**

```swift
Popup(type: .modal) {
    Text("Modal content")
    Button("Close") {
        // Close popup
    }
}
```

---

### CollapsingHeader

Collapsible section header.

```swift
struct CollapsingHeader: GuiView {
    let text: String
    let options: GuiTreeConfig
    var backgroundColor: GuiColor?
    var activeColor: GuiColor?
    var hoveredColor: GuiColor?

    init(
        _ text: String,
        options: GuiTreeConfig = .none,
        @GuiBuilder content: () -> GuiView
    )
}
```

**Options:**
- `.defaultOpen`: Starts expanded

**Modifiers:**
- `backgroundColor(_:)`: Sets background color
- `activeColor(_:)`: Sets active color
- `hoveredColor(_:)`: Sets hovered color

**Usage:**

```swift
CollapsingHeader("Advanced Settings", options: .defaultOpen) {
    Text("Setting 1")
    Text("Setting 2")
}
.backgroundColor(.darkGray)
```

---

### Tree

Tree node for hierarchical display.

```swift
struct Tree: GuiView {
    let text: String
    let options: GuiTreeConfig
    var activeColor: GuiColor?
    var hoveredColor: GuiColor?

    init(
        _ text: String,
        options: GuiTreeConfig = .none,
        @GuiBuilder content: () -> GuiView
    )
}
```

**Usage:**

```swift
Tree("Root") {
    Text("Child 1")

    Tree("Child 2") {
        Text("Grandchild 1")
        Text("Grandchild 2")
    }
}
```

---

### TabBar / TabItem

Tabbed interface.

```swift
struct TabBar: GuiView {
    let options: GuiTabBarConfig
    var backgroundColor: GuiColor?
    var activeColor: GuiColor?
    var hoveredColor: GuiColor?

    init(
        options: GuiTabBarConfig = .none,
        @GuiBuilder content: () -> GuiView
    )
}

struct TabItem: GuiView {
    let text: String
    let options: GuiTabItemConfig
    var backgroundColor: GuiColor?
    var activeColor: GuiColor?
    var hoveredColor: GuiColor?

    init(
        _ text: String,
        options: GuiTabItemConfig = .none,
        @GuiBuilder content: () -> GuiView
    )
}
```

**TabBar Options:**
- `.reorderable`: Tabs can be reordered
- `.autoSelect`: Auto-select new tabs

**Usage:**

```swift
TabBar {
    TabItem("Home") {
        Text("Home content")
    }

    TabItem("Settings") {
        Text("Settings content")
    }

    TabItem("About") {
        Text("About content")
    }
}
.backgroundColor(.darkGray)
```

---

## Quick Reference

### Layout

| View | Purpose |
|------|---------|
| `HStack` | Horizontal layout |
| `NewLine` | Line break |
| `SameLine` | Same line positioning |
| `Spacing` | Vertical space |
| `Divider` | Horizontal separator |
| `Column` | Column layout |
| `Tooltip` | Hover tooltip |

### Display

| View | Purpose |
|------|---------|
| `Text` | Text display |
| `TextLabel` | Label-value pair |
| `Image` | Image display |
| `Plot` | Data visualization |

### Containers

| View | Purpose |
|------|---------|
| `Window` | Top-level window |
| `SubWindow` | Child window |
| `Group` | Logical grouping |
| `Popup` | Modal/popup |
| `CollapsingHeader` | Collapsible section |
| `Tree` | Tree node |
| `TabBar` / `TabItem` | Tabbed interface |

## See Also

- [Layout Views Details](views-layout.md)
- [Display Views Details](views-display.md)
- [Container Views Details](views-containers.md)
- [Controls API](controls.md)
- [Modifiers API](modifiers.md)
