# SwiftGUI Architecture

This document explains the internal architecture of SwiftGUI and how the different components work together.

## Table of Contents

- [Overview](#overview)
- [Core Components](#core-components)
- [The Rendering Pipeline](#the-rendering-pipeline)
- [State Management](#state-management)
- [The DSL System](#the-dsl-system)
- [ImGui Bridge](#imgui-bridge)
- [Design Decisions](#design-decisions)

## Overview

SwiftGUI is built on three main pillars:

1. **Declarative UI**: SwiftUI-like syntax using result builders
2. **Immediate Mode**: ImGui's immediate mode rendering
3. **Type Safety**: Leveraging Swift's type system

```
┌─────────────────────────────────────┐
│         Your SwiftGUI App           │
│   (Declarative View Definitions)    │
└──────────────┬──────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│       SwiftGUI Framework            │
│  • GuiView Protocol                 │
│  • @GuiBuilder (Result Builder)     │
│  • State Management (@State)        │
│  • View Modifiers                   │
└──────────────┬──────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│        ImGui Bridge Layer           │
│   (Objective-C++ Wrapper)           │
│   • ImGuiWrapper.mm                 │
│   • ImGuiStyleWrapper.mm            │
└──────────────┬──────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│         Dear ImGui (C++)            │
│    (Immediate Mode Rendering)       │
└─────────────────────────────────────┘
```

## Core Components

### 1. GuiView Protocol

The foundation of all views in SwiftGUI:

```swift
public protocol GuiView {
    func render()
}
```

Every view must implement the `render()` method, which is called every frame in immediate mode fashion.

**Key Points:**
- Called every frame
- Declares what should be shown
- Can access and modify state
- No view hierarchy retained between frames

### 2. View Types

SwiftGUI organizes views into categories:

**Primitives**
- `Empty`: No-op view
- `GuiNodeList`: Collection of views
- `ForEach`: Iterative view generation

**Layout Views**
- `HStack`: Horizontal layout
- `NewLine`: Line break
- `SameLine`: Same line positioning
- `Spacing`: Vertical spacing
- `Divider`: Visual separator

**Display Views**
- `Text`: Text rendering
- `Image`: Image display
- `Plot`: Data visualization
- `TextLabel`: Label-value pairs

**Container Views**
- `Window`: Top-level window
- `SubWindow`: Child window
- `Group`: Logical grouping
- `Popup`: Modal/popup dialogs
- `CollapsingHeader`: Collapsible section
- `Tree`: Tree node
- `TabBar`/`TabItem`: Tabbed interface

**Controls** (Action)
- `Button`: Click action
- `MenuItem`: Menu item
- `MenuGroup`: Menu grouping
- `MenuBar`: Menu bar

**Controls** (Stateful)
- `CheckBox`: Boolean toggle
- `RadioButton`: Single selection
- `Slider`: Numeric value
- `TextField`: Text input
- `ComboBox`: Dropdown selection
- `ListBox`: List selection
- `ColorEdit`: Color picker

## The Rendering Pipeline

### Frame Cycle

```
1. Begin Frame
   ↓
2. Call render() on root view
   ↓
3. Traverse view hierarchy
   ↓
4. Apply modifiers
   ↓
5. Execute ImGui commands
   ↓
6. End Frame
   ↓
7. Platform renders to screen
   ↓
8. Repeat
```

### Immediate Mode Rendering

Unlike retained mode (SwiftUI, UIKit), SwiftGUI uses **immediate mode**:

**Retained Mode** (SwiftUI/UIKit):
```
Build view tree → Store in memory → Update when needed → Render
```

**Immediate Mode** (SwiftGUI/ImGui):
```
Each frame: Declare views → Render immediately → Discard
```

**Implications:**
- ✅ Simple mental model
- ✅ No view diffing needed
- ✅ Direct control over rendering
- ⚠️ `render()` called every frame
- ⚠️ State must be managed separately

## State Management

### @State Property Wrapper

`@State` is a property wrapper that provides persistent storage across frames:

```swift
@propertyWrapper
public class State<T> {
    private var value: T

    public var wrappedValue: T {
        get { value }
        nonmutating set { value = newValue }
    }

    public var projectedValue: Binding<T> {
        Binding(
            get: { self.wrappedValue },
            set: { self.wrappedValue = $0 }
        )
    }
}
```

**How it works:**
1. `@State` is a reference type (class)
2. Value persists between `render()` calls
3. `projectedValue` ($) creates a `Binding`
4. Bindings allow two-way communication

### Binding

`Binding` provides a reference to a value:

```swift
public struct Binding<T> {
    private let _get: () -> T
    private let _set: (T) -> Void

    public var wrappedValue: T {
        get { _get() }
        nonmutating set { _set(newValue) }
    }

    public func get() -> T { _get() }
    public func set(_ value: T) { _set(value) }
}
```

**Use cases:**
- Passing state to child views
- Two-way binding with controls
- Computed bindings

### State Flow

```
┌──────────────┐
│  @State var  │  (Source of truth)
└──────┬───────┘
       │
       │ $ (projectedValue)
       ▼
┌──────────────┐
│   Binding    │  (Reference)
└──────┬───────┘
       │
       │ Pass to control
       ▼
┌──────────────┐
│  TextField   │  (Modifies via binding)
└──────────────┘
```

## The DSL System

### @GuiBuilder Result Builder

SwiftGUI uses Swift's result builder feature for declarative syntax:

```swift
@resultBuilder
public enum GuiBuilder {
    // Single view
    public static func buildBlock(_ view: GuiView) -> GuiView {
        view
    }

    // Multiple views
    public static func buildBlock(_ views: GuiView...) -> GuiView {
        GuiNodeList(children: views)
    }

    // Conditional (if)
    public static func buildOptional(_ view: GuiView?) -> GuiView {
        view ?? Empty()
    }

    // Conditional (if-else)
    public static func buildEither(first: GuiView) -> GuiView {
        first
    }

    public static func buildEither(second: GuiView) -> GuiView {
        second
    }

    // Loops
    public static func buildArray(_ views: [GuiView]) -> GuiView {
        GuiNodeList(children: views)
    }
}
```

**Transformation Example:**

```swift
// You write:
Window("App") {
    Text("Hello")
    Text("World")
}

// Compiler transforms to:
Window("App", content: {
    GuiBuilder.buildBlock(
        Text("Hello"),
        Text("World")
    )
})
```

## View Modifiers

### Modifier System

SwiftGUI uses two types of modifiers:

**1. View Modifiers** (via `Modifiable` protocol)

Common modifiers stored in `ViewModifiers` struct:

```swift
public struct ViewModifiers {
    var id: String?
    var snapWidth: Bool?
    var padding: GuiEdge?
    var paddingValue: Float?
    var fontIndex: Int?
    var textColor: GuiColor?
    var onHover: (() -> GuiView?)?
}
```

**2. Component-Specific Modifiers**

Modifiers specific to a view type (e.g., `backgroundColor` for buttons):

```swift
protocol HasBackgroundColor: GuiView {
    var backgroundColor: GuiColor? { get set }
}

extension HasBackgroundColor {
    func backgroundColor(_ color: GuiColor) -> Self {
        var copy = self
        copy.backgroundColor = color
        return copy
    }
}
```

### How Modifiers Work

```swift
// Modifier chain
Text("Hello")
    .textColor(.red)      // Returns modified copy
    .padding(.all, 10)     // Returns modified copy
    .identifier("hello")   // Returns modified copy

// Each modifier:
1. Creates a copy of the view (struct is value type)
2. Modifies the copy
3. Returns the modified copy
```

### Applying Modifiers

The `withModifiers()` helper applies modifiers during rendering:

```swift
func withModifiers(_ modifiers: ViewModifiers, body: () -> Void) {
    // Push modifiers to ImGui
    if let id = modifiers.id { /* push ID */ }
    if let color = modifiers.textColor { /* push color */ }
    if let padding = modifiers.padding { /* apply padding */ }

    // Execute body with modifiers active
    body()

    // Pop modifiers
    /* pop in reverse order */
}
```

## ImGui Bridge

### Bridge Architecture

SwiftGUI uses an Objective-C++ bridge to interface with C++ ImGui:

```
Swift (SwiftGUI)
    ↕️
Objective-C (ImGuiWrapper.mm)
    ↕️
C++ (Dear ImGui)
```

**Why Objective-C++?**
- Swift cannot directly call C++ (as of Swift 5.9)
- Objective-C++ can call both Swift and C++
- Clean separation of concerns

### Bridge Components

**ImGuiWrapper.mm**
- Core ImGui functionality
- Window creation
- Widget rendering
- Input handling

**ImGuiStyleWrapper.mm**
- Style and color management
- Theme application
- Font configuration

### Example Bridge Call

```swift
// Swift side
Text("Hello").render()

// Calls wrapper
ImGuiWrapper.text("Hello")

// Wrapper calls ImGui (in ImGuiWrapper.mm)
ImGui::Text("%s", text.UTF8String);
```

## Design Decisions

### Why Structs for Views?

**Decision**: All views are structs, not classes.

**Rationale:**
- ✅ Value semantics (modifications create copies)
- ✅ Immutability by default
- ✅ No reference counting overhead
- ✅ Matches SwiftUI patterns
- ✅ Thread-safe by design

### Why Immediate Mode?

**Decision**: Use ImGui's immediate mode rendering.

**Rationale:**
- ✅ Simple mental model
- ✅ No complex state synchronization
- ✅ Perfect for tools and debug UIs
- ✅ Direct control over rendering
- ✅ Excellent performance for dynamic UIs

**Trade-offs:**
- ⚠️ Different from SwiftUI (which is retained mode)
- ⚠️ `render()` called every frame
- ⚠️ Less suitable for complex animations

### Why Keep ObjC Bridge?

**Decision**: Keep Objective-C++ bridge instead of Swift-C++ interop.

**Rationale:**
- ✅ Mature and stable
- ✅ Works across all platforms
- ✅ Isolates C++ complexity
- ✅ No dependency on experimental features
- ✅ Clean separation of layers

### Why Property Wrappers for State?

**Decision**: Use @State and Binding like SwiftUI.

**Rationale:**
- ✅ Familiar to SwiftUI developers
- ✅ Clear separation of state and view
- ✅ Type-safe
- ✅ Ergonomic API
- ✅ Enables declarative code

## Performance Considerations

### Frame Budget

Immediate mode means `render()` is called every frame (~60 FPS):
- Each frame has ~16ms budget
- Keep `render()` logic fast
- Avoid expensive computations
- Cache when possible

### Memory Management

- Views are structs (stack allocated)
- No retained view hierarchy
- State is managed separately
- Minimal allocations per frame

### Best Practices

1. **Extract expensive work**: Do heavy lifting outside `render()`
2. **Use @State sparingly**: Only for truly reactive state
3. **Optimize loops**: ForEach can be expensive for large datasets
4. **Profile**: Use Instruments to find bottlenecks

## Summary

SwiftGUI combines:
- ✅ SwiftUI-like declarative syntax
- ✅ ImGui's immediate mode efficiency
- ✅ Swift's type safety
- ✅ Cross-platform support

The architecture is designed for:
- 🎯 Developer ergonomics
- 🎯 Type safety
- 🎯 Performance
- 🎯 Simplicity

For more details on specific components, see:
- [DSL & Builders](Api/dsl.md)
- [State Management](Api/state.md)
- [View Modifiers](Api/modifiers.md)
