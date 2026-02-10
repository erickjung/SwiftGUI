# Tutorial: Building Your First SwiftGUI App

In this tutorial, you'll build a complete counter application that demonstrates the core concepts of SwiftGUI.

## What You'll Build

A simple counter app with:
- Display of the current count
- Increment and decrement buttons
- Reset button
- Styled UI with colors

## Prerequisites

- SwiftGUI installed (see [Getting Started](../getting-started.md))
- Basic Swift knowledge
- Understanding of structs and protocols

## Step 1: Create the Project

Create a new Swift package:

```bash
mkdir CounterApp
cd CounterApp
swift package init --type executable
```

Add SwiftGUI to your `Package.swift`:

```swift
// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CounterApp",
    platforms: [.macOS(.v12)],
    dependencies: [
        .package(url: "https://github.com/your-org/swiftgui", from: "2.0.0")
    ],
    targets: [
        .executableTarget(
            name: "CounterApp",
            dependencies: ["SwiftGUI"]
        )
    ]
)
```

## Step 2: Create a Basic View

Replace `main.swift` with:

```swift
import SwiftGUI

struct CounterView: GuiView {
    func render() {
        Window("Counter App") {
            Text("Hello, SwiftGUI!")
        }
    }
}

@main
struct CounterApp {
    static func main() {
        GuiAppLauncher.run(
            title: "Counter App",
            scene: CounterView()
        )
    }
}
```

Run it:
```bash
swift run
```

You should see a window with "Hello, SwiftGUI!" displayed.

## Step 3: Add State

Now let's add a counter. We'll use `@State` to store the count:

```swift
import SwiftGUI

struct CounterView: GuiView {
    @State var count = 0  // ← Add state

    func render() {
        Window("Counter App") {
            Text("Count: \(count)")  // ← Display count
        }
    }
}
```

**What's happening:**
- `@State` creates persistent storage
- The value survives between frames
- Changes trigger re-rendering

## Step 4: Add Buttons

Add buttons to modify the count:

```swift
import SwiftGUI

struct CounterView: GuiView {
    @State var count = 0

    func render() {
        Window("Counter App") {
            // Display
            Text("Count: \(count)")
                .font(1)
                .textColor(.cyan)

            NewLine()
            Spacing()

            // Buttons
            Button("Increment") {
                count += 1
            }

            SameLine()

            Button("Decrement") {
                count -= 1
            }
        }
    }
}
```

**New concepts:**
- `Button`: Takes a label and a closure
- The closure runs when the button is clicked
- `NewLine()`: Moves to the next line
- `Spacing()`: Adds vertical space
- `SameLine()`: Keeps next element on the same line

Run the app and try clicking the buttons!

## Step 5: Add Styling

Let's make it look better with colors and styling:

```swift
import SwiftGUI

struct CounterView: GuiView {
    @State var count = 0

    func render() {
        Window("Counter App") {
            // Title
            Text("Counter Application")
                .font(2)
                .textColor(.yellow)
                .padding(.bottom, value: 10)

            Divider()

            // Count display
            Text("Current Count: \(count)")
                .font(1)
                .textColor(count >= 0 ? .green : .red)

            NewLine()
            Spacing()

            // Increment button
            Button("+ Increment") {
                count += 1
            }
            .backgroundColor(.green)
            .size(width: 120, height: 30)

            SameLine()

            // Decrement button
            Button("- Decrement") {
                count -= 1
            }
            .backgroundColor(.red)
            .size(width: 120, height: 30)

            SameLine()

            // Reset button
            Button("Reset") {
                count = 0
            }
            .backgroundColor(.blue)
            .size(width: 120, height: 30)
        }
    }
}
```

**New modifiers:**
- `.font()`: Changes text size
- `.textColor()`: Sets text color
- `.padding()`: Adds spacing
- `.backgroundColor()`: Sets button color
- `.size()`: Sets button dimensions

## Step 6: Add Constraints

Let's add min/max limits and show a warning:

```swift
import SwiftGUI

struct CounterView: GuiView {
    @State var count = 0

    // Constants
    let minValue = -10
    let maxValue = 10

    func render() {
        Window("Counter App") {
            // Title
            Text("Counter Application")
                .font(2)
                .textColor(.yellow)

            Divider()

            // Count display with color
            Text("Count: \(count)")
                .font(1)
                .textColor(countColor)

            // Warning message
            if count == maxValue {
                Text("⚠️ Maximum value reached!")
                    .textColor(.orange)
            } else if count == minValue {
                Text("⚠️ Minimum value reached!")
                    .textColor(.orange)
            }

            NewLine()
            Spacing()

            // Increment button (disabled at max)
            Button("+ Increment") {
                if count < maxValue {
                    count += 1
                }
            }
            .backgroundColor(count >= maxValue ? .gray : .green)
            .size(width: 120, height: 30)

            SameLine()

            // Decrement button (disabled at min)
            Button("- Decrement") {
                if count > minValue {
                    count -= 1
                }
            }
            .backgroundColor(count <= minValue ? .gray : .red)
            .size(width: 120, height: 30)

            SameLine()

            // Reset button
            Button("Reset") {
                count = 0
            }
            .backgroundColor(.blue)
            .size(width: 120, height: 30)

            NewLine()
            Spacing()

            // Info text
            Text("Range: \(minValue) to \(maxValue)")
                .textColor(.lightGray)
        }
    }

    // Computed property for color
    var countColor: GuiColor {
        if count > 0 { return .green }
        if count < 0 { return .red }
        return .white
    }
}
```

**New concepts:**
- Conditional rendering with `if`
- Computed properties for logic
- Dynamic button styling based on state

## Step 7: Extract a Component

Let's extract the counter display into a reusable component:

```swift
import SwiftGUI

// Counter display component
struct CounterDisplay: GuiView {
    let count: Int
    let min: Int
    let max: Int

    func render() {
        Text("Count: \(count)")
            .font(1)
            .textColor(color)

        if count == max {
            Text("⚠️ Maximum value reached!")
                .textColor(.orange)
        } else if count == min {
            Text("⚠️ Minimum value reached!")
                .textColor(.orange)
        }
    }

    var color: GuiColor {
        if count > 0 { return .green }
        if count < 0 { return .red }
        return .white
    }
}

// Counter buttons component
struct CounterButtons: GuiView {
    @Binding var count: Int
    let min: Int
    let max: Int

    func render() {
        Button("+ Increment") {
            if count < max {
                count += 1
            }
        }
        .backgroundColor(count >= max ? .gray : .green)
        .size(width: 120, height: 30)

        SameLine()

        Button("- Decrement") {
            if count > min {
                count -= 1
            }
        }
        .backgroundColor(count <= min ? .gray : .red)
        .size(width: 120, height: 30)

        SameLine()

        Button("Reset") {
            count = 0
        }
        .backgroundColor(.blue)
        .size(width: 120, height: 30)
    }
}

// Main view
struct CounterView: GuiView {
    @State var count = 0

    let minValue = -10
    let maxValue = 10

    func render() {
        Window("Counter App") {
            Text("Counter Application")
                .font(2)
                .textColor(.yellow)

            Divider()

            CounterDisplay(count: count, min: minValue, max: maxValue)

            NewLine()
            Spacing()

            CounterButtons(count: $count, min: minValue, max: maxValue)

            NewLine()
            Spacing()

            Text("Range: \(minValue) to \(maxValue)")
                .textColor(.lightGray)
        }
    }
}
```

**New concepts:**
- Component extraction for reusability
- `@Binding` for passing state references
- `$count` syntax to create a binding

## Step 8: Add More Features

Let's add a history of counts:

```swift
import SwiftGUI

struct CounterView: GuiView {
    @State var count = 0
    @State var history: [Int] = []

    let minValue = -10
    let maxValue = 10

    func render() {
        Window("Counter App") {
            // Header
            Text("Counter Application")
                .font(2)
                .textColor(.yellow)

            Divider()

            // Current count
            Text("Current Count: \(count)")
                .font(1)
                .textColor(countColor)

            NewLine()
            Spacing()

            // Buttons
            Button("+ Increment") {
                incrementCount()
            }
            .backgroundColor(count >= maxValue ? .gray : .green)
            .size(width: 120, height: 30)

            SameLine()

            Button("- Decrement") {
                decrementCount()
            }
            .backgroundColor(count <= minValue ? .gray : .red)
            .size(width: 120, height: 30)

            SameLine()

            Button("Reset") {
                resetCount()
            }
            .backgroundColor(.blue)
            .size(width: 120, height: 30)

            NewLine()
            Spacing()

            Divider()

            // History
            Text("History:")
                .font(1)
                .textColor(.cyan)

            if history.isEmpty {
                Text("No history yet")
                    .textColor(.gray)
            } else {
                ForEach(history.reversed().prefix(5)) { value in
                    Text("• \(value)")
                }

                if history.count > 5 {
                    Text("... and \(history.count - 5) more")
                        .textColor(.gray)
                }
            }
        }
    }

    var countColor: GuiColor {
        if count > 0 { return .green }
        if count < 0 { return .red }
        return .white
    }

    func incrementCount() {
        guard count < maxValue else { return }
        count += 1
        history.append(count)
    }

    func decrementCount() {
        guard count > minValue else { return }
        count -= 1
        history.append(count)
    }

    func resetCount() {
        count = 0
        history.append(count)
    }
}
```

## Complete Code

Here's the final, complete application:

```swift
import SwiftGUI

struct CounterView: GuiView {
    @State var count = 0
    @State var history: [Int] = []
    @State var showHistory = true

    let minValue = -10
    let maxValue = 10

    func render() {
        Window("Counter App") {
            renderHeader()
            renderCounter()
            renderButtons()

            if showHistory {
                renderHistory()
            }
        }
        .windowSize(GuiSize(width: 400, height: 500))
    }

    func renderHeader() {
        Text("Counter Application")
            .font(2)
            .textColor(.yellow)

        Divider()
    }

    func renderCounter() {
        Text("Current Count: \(count)")
            .font(1)
            .textColor(countColor)

        if count == maxValue || count == minValue {
            Text("⚠️ Limit reached!")
                .textColor(.orange)
        }

        NewLine()
        Spacing()
    }

    func renderButtons() {
        Button("+ Increment") {
            incrementCount()
        }
        .backgroundColor(count >= maxValue ? .gray : .green)
        .size(width: 110, height: 30)

        SameLine()

        Button("- Decrement") {
            decrementCount()
        }
        .backgroundColor(count <= minValue ? .gray : .red)
        .size(width: 110, height: 30)

        SameLine()

        Button("Reset") {
            resetCount()
        }
        .backgroundColor(.blue)
        .size(width: 110, height: 30)

        NewLine()
        Spacing()

        Divider()
    }

    func renderHistory() {
        HStack {
            Text("History:")
                .font(1)
                .textColor(.cyan)

            SameLine()

            CheckBox("Show", isOn: $showHistory)
        }

        if history.isEmpty {
            Text("No actions yet")
                .textColor(.gray)
        } else {
            ForEach(history.reversed().prefix(10)) { value in
                Text("• \(value)")
            }
        }
    }

    var countColor: GuiColor {
        if count > 0 { return .green }
        if count < 0 { return .red }
        return .white
    }

    func incrementCount() {
        guard count < maxValue else { return }
        count += 1
        history.append(count)
    }

    func decrementCount() {
        guard count > minValue else { return }
        count -= 1
        history.append(count)
    }

    func resetCount() {
        count = 0
        history.append(count)
    }
}

@main
struct CounterApp {
    static func main() {
        GuiAppLauncher.run(
            title: "Counter App",
            scene: CounterView()
        )
    }
}
```

## What You Learned

✅ Creating views with `GuiView`
✅ Using `@State` for local state
✅ Using `@Binding` to pass state
✅ Button actions and event handling
✅ View modifiers for styling
✅ Layout with `NewLine`, `SameLine`, `HStack`
✅ Conditional rendering
✅ Loops with `ForEach`
✅ Component extraction
✅ Window configuration

## Next Steps

- [State Management Tutorial](state-management.md) - Deep dive into state
- [Custom Views Tutorial](custom-views.md) - Build reusable components
- [Layouts Tutorial](layouts.md) - Master layout techniques
- [Controls API](../Api/controls.md) - Explore all available controls

## Exercises

Try extending the app:

1. Add a "Step" control to increment/decrement by different amounts
2. Add a slider to set the count directly
3. Save and load history to/from a file
4. Add animations when the count changes
5. Create a settings panel to configure min/max values
