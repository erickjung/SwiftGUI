# Modifiers API Reference

Complete reference for view modifiers in SwiftGUI.

## Table of Contents

- [Common Modifiers](#common-modifiers)
- [Component Modifiers](#component-modifiers)
- [Modifier Protocols](#modifier-protocols)

## Common Modifiers

All views conforming to `Modifiable` support these modifiers.

### identifier(_:)

Sets a unique identifier for the view.

```swift
func identifier(_ id: String) -> Self
```

**Usage:**

```swift
Text("Hello")
    .identifier("greeting-text")

Button("Submit") { }
    .identifier("submit-button")
```

**Notes:**
- Useful for debugging
- Can be used with ImGui's ID system
- Helps identify views in the hierarchy

---

### textColor(_:)

Sets the text color.

```swift
func textColor(_ color: GuiColor) -> Self
```

**Usage:**

```swift
Text("Error")
    .textColor(.red)

Text("Success")
    .textColor(.green)

Button("Info") { }
    .textColor(.cyan)
```

---

### padding(_:value:)

Adds padding around the view.

```swift
func padding(_ edge: GuiEdge, value: Float) -> Self
```

**GuiEdge values:**
- `.top`
- `.bottom`
- `.leading`
- `.trailing`
- `.all`
- `.horizontal`
- `.vertical`

**Usage:**

```swift
Text("Padded")
    .padding(.all, value: 10)

Group {
    Text("Content")
}
.padding(.horizontal, value: 20)
.padding(.vertical, value: 10)

Button("Click") { }
    .padding(.all, value: 5)
```

---

### font(_:)

Sets the font index.

```swift
func font(_ index: Int) -> Self
```

**Usage:**

```swift
Text("Heading")
    .font(2)  // Larger font

Text("Body")
    .font(0)  // Default font

Text("Small")
    .font(1)  // Medium font
```

**Notes:**
- Font indices correspond to fonts loaded in your FontGroup
- Default font index is usually 0

---

### snap()

Makes the view snap to its natural width.

```swift
func snap() -> Self
```

**Usage:**

```swift
Text("Exact width")
    .snap()
```

---

### onHover(_:)

Adds a hover callback.

```swift
func onHover(_ callback: @escaping () -> GuiView?) -> Self
```

**Usage:**

```swift
Text("Hover me")
    .onHover {
        // Return a tooltip view
        return Tooltip {
            Text("This is a tooltip")
        }
    }

Button("Info") { }
    .onHover {
        print("Button hovered")
        return nil
    }
```

---

## Component Modifiers

Specific to component types that conform to specialized protocols.

### backgroundColor(_:)

Sets background color (for views conforming to `HasBackgroundColor`).

```swift
func backgroundColor(_ color: GuiColor) -> Self
```

**Supported by:**
- Button
- Plot
- CollapsingHeader
- Tree
- TabBar
- TabItem
- MenuGroup
- MenuBar
- Slider
- Drag
- ComboBox
- ListBox
- ColorEdit

**Usage:**

```swift
Button("Primary") { }
    .backgroundColor(.blue)

CollapsingHeader("Section") { }
    .backgroundColor(.darkGray)

Slider(value: $volume)
    .backgroundColor(.gray)
```

---

### borderColor(_:)

Sets border color (for views conforming to `HasBorderColor`).

```swift
func borderColor(_ color: GuiColor) -> Self
```

**Supported by:**
- Button
- Image

**Usage:**

```swift
Button("Outlined") { }
    .borderColor(.white)

Image(texture: tex)
    .borderColor(.blue)
```

---

### activeColor(_:)

Sets color when active/pressed (for views conforming to `HasActiveColor`).

```swift
func activeColor(_ color: GuiColor) -> Self
```

**Supported by:**
- Button
- Plot
- CollapsingHeader
- Tree
- TabBar
- TabItem
- CheckBox
- RadioButton
- Slider
- ComboBox
- ListBox

**Usage:**

```swift
Button("Click") { }
    .backgroundColor(.blue)
    .activeColor(.darkBlue)

CheckBox("Enable", isOn: $enabled)
    .activeColor(.green)
```

---

### hoveredColor(_:)

Sets color when hovered (for views conforming to `HasHoveredColor`).

```swift
func hoveredColor(_ color: GuiColor) -> Self
```

**Supported by:**
- Button
- Plot
- CollapsingHeader
- Tree
- TabBar
- TabItem
- MenuBar
- Slider
- Drag
- ComboBox
- ListBox
- ColorEdit

**Usage:**

```swift
Button("Hover") { }
    .backgroundColor(.blue)
    .hoveredColor(.lightBlue)

MenuBar { }
    .hoveredColor(.gray)
```

---

### selectionColor(_:)

Sets selection color (for views conforming to `HasSelectionColor`).

```swift
func selectionColor(_ color: GuiColor) -> Self
```

**Supported by:**
- Slider
- ComboBox
- ListBox

**Usage:**

```swift
Slider(value: $value)
    .selectionColor(.cyan)

ListBox(selectedIndex: $index, items: items)
    .selectionColor(.blue)
```

---

### tintColor(_:)

Sets tint color (for views conforming to `HasTintColor`).

```swift
func tintColor(_ color: GuiColor) -> Self
```

**Supported by:**
- Image

**Usage:**

```swift
Image(texture: iconTexture)
    .tintColor(.white)
```

---

### size(_:)

Sets view size (for views conforming to `HasSize`).

```swift
func size(_ size: GuiSize) -> Self
func size(width: Float, height: Float) -> Self
```

**Supported by:**
- Button
- Image
- Plot
- SubWindow
- TextField
- List

**Usage:**

```swift
Button("Big") { }
    .size(width: 200, height: 50)

Image(texture: tex)
    .size(CGSize(width: 100, height: 100))

TextField(text: $input)
    .size(width: 300, height: 25)
```

---

## Window-Specific Modifiers

### position(_:condition:)

Sets window position.

```swift
func position(_ position: GuiPoint, condition: GuiCondition = .always) -> Window
```

**GuiCondition values:**
- `.always`: Set position every frame
- `.once`: Set position once
- `.firstUseEver`: Set only if window never positioned before
- `.appearing`: Set when window appears

**Usage:**

```swift
Window("App") {
    // Content
}
.position(GuiPoint(x: 100, y: 100), condition: .firstUseEver)
```

---

### windowSize(_:condition:)

Sets window size.

```swift
func windowSize(_ size: GuiSize, condition: GuiCondition = .always) -> Window
```

**Usage:**

```swift
Window("Settings") {
    // Content
}
.windowSize(GuiSize(width: 800, height: 600), condition: .firstUseEver)
```

---

## Modifier Protocols

### Modifiable

Base protocol for common modifiers.

```swift
public protocol Modifiable: GuiView {
    var modifiers: ViewModifiers { get set }
}
```

**Provides:**
- `identifier(_:)`
- `textColor(_:)`
- `padding(_:value:)`
- `font(_:)`
- `snap()`
- `onHover(_:)`

---

### HasBackgroundColor

Protocol for views with background color.

```swift
public protocol HasBackgroundColor: GuiView {
    var backgroundColor: GuiColor? { get set }
}
```

**Provides:**
- `backgroundColor(_:)`

---

### HasBorderColor

Protocol for views with border color.

```swift
public protocol HasBorderColor: GuiView {
    var borderColor: GuiColor? { get set }
}
```

**Provides:**
- `borderColor(_:)`

---

### HasActiveColor

Protocol for views with active state color.

```swift
public protocol HasActiveColor: GuiView {
    var activeColor: GuiColor? { get set }
}
```

**Provides:**
- `activeColor(_:)`

---

### HasHoveredColor

Protocol for views with hover color.

```swift
public protocol HasHoveredColor: GuiView {
    var hoveredColor: GuiColor? { get set }
}
```

**Provides:**
- `hoveredColor(_:)`

---

### HasSelectionColor

Protocol for views with selection color.

```swift
public protocol HasSelectionColor: GuiView {
    var selectionColor: GuiColor? { get set }
}
```

**Provides:**
- `selectionColor(_:)`

---

### HasTintColor

Protocol for views with tint color.

```swift
public protocol HasTintColor: GuiView {
    var tintColor: GuiColor? { get set }
}
```

**Provides:**
- `tintColor(_:)`

---

### HasSize

Protocol for views with configurable size.

```swift
public protocol HasSize: GuiView {
    var size: GuiSize? { get set }
}
```

**Provides:**
- `size(_:)`
- `size(width:height:)`

---

## Chaining Modifiers

Modifiers can be chained together:

```swift
Text("Styled Text")
    .font(1)
    .textColor(.cyan)
    .padding(.all, value: 10)
    .identifier("main-text")

Button("Submit") {
    submit()
}
.backgroundColor(.green)
.activeColor(.darkGreen)
.hoveredColor(.lightGreen)
.size(width: 120, height: 35)
.textColor(.white)
.identifier("submit-btn")
```

**Order doesn't matter** for most modifiers (they're applied during rendering).

## Custom Modifiers

Create custom modifier extensions:

```swift
extension GuiView {
    func primaryStyle() -> some GuiView {
        self
            .backgroundColor(.blue)
            .activeColor(.darkBlue)
            .textColor(.white)
            .size(width: 120, height: 35)
    }

    func secondaryStyle() -> some GuiView {
        self
            .backgroundColor(.gray)
            .activeColor(.darkGray)
            .textColor(.white)
            .size(width: 120, height: 35)
    }
}

// Usage
Button("Primary") { }
    .primaryStyle()

Button("Secondary") { }
    .secondaryStyle()
```

## Summary

### Common to All Views (Modifiable)
- `identifier(_:)` - Set ID
- `textColor(_:)` - Set text color
- `padding(_:value:)` - Add padding
- `font(_:)` - Set font index
- `snap()` - Snap to natural width
- `onHover(_:)` - Hover callback

### Component-Specific
- `backgroundColor(_:)` - Background color
- `borderColor(_:)` - Border color
- `activeColor(_:)` - Active/pressed color
- `hoveredColor(_:)` - Hover color
- `selectionColor(_:)` - Selection color
- `tintColor(_:)` - Tint color
- `size(_:)` - View size

### Window-Specific
- `position(_:condition:)` - Window position
- `windowSize(_:condition:)` - Window size

## See Also

- [Views API](views.md)
- [Controls API](controls.md)
- [Architecture](../architecture.md)
