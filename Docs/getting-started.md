# Getting Started with SwiftGUI

This guide will help you install SwiftGUI and create your first application.

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Creating Your First App](#creating-your-first-app)
- [Project Structure](#project-structure)
- [Next Steps](#next-steps)

## Requirements

- **Swift**: 5.9 or later
- **Platforms**:
  - macOS 12.0+
  - iOS 15.0+
- **Xcode**: 15.0+ (for iOS/macOS development)

## Installation

### Swift Package Manager

Add SwiftGUI to your `Package.swift`:

```swift
// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MyApp",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
    ],
    dependencies: [
        .package(url: "https://github.com/your-org/swiftgui", from: "2.0.0")
    ],
    targets: [
        .executableTarget(
            name: "MyApp",
            dependencies: ["SwiftGUI"]
        )
    ]
)
```

### Xcode Project

1. In Xcode, go to **File > Add Packages...**
2. Enter the repository URL: `https://github.com/your-org/swiftgui`
3. Select the version you want to use
4. Click **Add Package**

## Creating Your First App

### 1. Import SwiftGUI

```swift
import SwiftGUI
```

### 2. Create a View

Every SwiftGUI view conforms to the `GuiView` protocol:

```swift
struct MyFirstView: GuiView {
    func render() {
        Window("My First App") {
            Text("Hello, SwiftGUI!")
        }
    }
}
```

### 3. Launch Your App

#### macOS

Create a main.swift file:

```swift
import SwiftGUI

@main
struct MyApp {
    static func main() {
        GuiAppLauncher.run(
            title: "My App",
            scene: MyFirstView()
        )
    }
}
```

Run with:
```bash
swift run
```

#### iOS

For iOS, you'll use the standard app lifecycle:

```swift
import SwiftGUI
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GuiAppLauncher.setupiOS(with: MyFirstView())
        return true
    }
}
```

## Creating an Interactive App

Let's add some interactivity with state management:

```swift
import SwiftGUI

struct CounterView: GuiView {
    @State var count = 0

    func render() {
        Window("Counter") {
            Text("Current count: \(count)")
                .font(1)
                .textColor(.cyan)

            NewLine()

            Button("Increment") {
                count += 1
            }
            .backgroundColor(.green)

            SameLine()

            Button("Decrement") {
                count -= 1
            }
            .backgroundColor(.red)
        }
    }
}

@main
struct MyApp {
    static func main() {
        GuiAppLauncher.run(
            title: "Counter App",
            scene: CounterView()
        )
    }
}
```

## Project Structure

A typical SwiftGUI project structure:

```
MyApp/
├── Package.swift
├── Sources/
│   └── MyApp/
│       ├── main.swift
│       ├── Views/
│       │   ├── ContentView.swift
│       │   ├── CounterView.swift
│       │   └── SettingsView.swift
│       └── Models/
│           └── AppState.swift
└── Resources/
    └── Fonts/
```

### Recommended Organization

- **Views/**: All your view components
- **Models/**: Data models and app state
- **ViewModels/**: Business logic (if using MVVM)
- **Resources/**: Assets, fonts, etc.

## Basic Concepts

### 1. Views

Everything you see is a `GuiView`:

```swift
struct MyView: GuiView {
    func render() {
        // UI code here
    }
}
```

### 2. State Management

Use `@State` for local state:

```swift
@State var isEnabled = false
@State var text = "Hello"
```

### 3. Modifiers

Chain modifiers to customize views:

```swift
Text("Styled Text")
    .textColor(.red)
    .font(1)
    .padding(.all, value: 10)
```

### 4. Containers

Organize views with containers:

```swift
Window("App") {
    Group {
        Text("Section 1")
        Button("Click Me") { }
    }
}
```

## Common Patterns

### Layout

```swift
// Horizontal layout
HStack(spacing: 10) {
    Text("Left")
    Text("Right")
}

// Vertical spacing
Text("Top")
NewLine()
Text("Bottom")

// Same line
Text("Label:")
SameLine()
Text("Value")
```

### Conditional Views

```swift
if showDetails {
    Text("Details here")
}
```

### Loops

```swift
ForEach(items) { item in
    Text(item.name)
}
```

## Next Steps

Now that you have SwiftGUI set up, explore:

1. [**Basic App Tutorial**](Tutorials/basic-app.md) - Build a complete app
2. [**State Management**](Tutorials/state-management.md) - Deep dive into @State and Binding
3. [**Views API Reference**](Api/views.md) - All available views
4. [**Controls API Reference**](Api/controls.md) - Interactive controls

## Troubleshooting

### Common Issues

**Build Errors**

If you encounter build errors:
1. Make sure you're using Swift 5.9 or later
2. Clean your build folder: `swift package clean`
3. Update dependencies: `swift package update`

**ImGui Context Errors**

If you see ImGui context errors:
- Make sure you're calling views within a proper rendering context
- Don't create ImGui widgets outside of the `render()` method

**Performance Issues**

For performance tips, see the [Performance Guide](Guides/performance.md).

## Getting Help

- 📖 Read the [Architecture Overview](architecture.md)
- 🎓 Follow the [Tutorials](Tutorials/)
- 📚 Check the [API Reference](Api/)
- 💬 Open an issue on GitHub

## Example Apps

Check out the [Complete Examples](examples/complete-examples.md) for full application examples including:

- Todo List App
- Settings Panel
- Data Visualization
- Multi-window Applications
