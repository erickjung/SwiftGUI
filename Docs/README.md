# SwiftGUI Documentation

Welcome to the SwiftGUI documentation! SwiftGUI is a declarative UI framework for Swift that brings SwiftUI-like syntax to ImGui, enabling you to build cross-platform GUIs with a modern, intuitive API.

## 📚 Documentation Structure

### Getting Started
- [**Getting Started Guide**](getting-started.md) - Installation, setup, and your first app
- [**Architecture Overview**](architecture.md) - Understanding how SwiftGUI works

### Tutorials
- [**Building Your First App**](Tutorials/basic-app.md) - Create a simple counter app
- [**State Management**](Tutorials/state-management.md) - Working with @State and Binding
- [**Custom Views**](Tutorials/custom-views.md) - Building reusable view components

### API Reference
- [**Views**](Api/views.md) - All available view types
- [**Controls**](Api/controls.md) - Interactive components
- [**Modifiers**](Api/modifiers.md) - View modifiers and styling
- [**State Management**](Api/state.md) - @State, Binding, and reactivity

### Guides
- [**Best Practices**](Guides/best-practices.md) - Code organization and patterns

## 🚀 Quick Links

### For Beginners
1. Start with the [Getting Started Guide](getting-started.md)
2. Follow the [Basic App Tutorial](Tutorials/basic-app.md)
3. Learn about [State Management](Tutorials/state-management.md)

### For Experienced Developers
1. Review the [Architecture Overview](architecture.md)
2. Explore the [API Reference](Api/)
3. Check out [Best Practices](Guides/best-practices.md)

### Looking for Something Specific?
- **Views**: See [Views API Reference](Api/views.md)
- **Controls**: See [Controls API Reference](Api/controls.md)
- **Modifiers**: See [Modifiers API Reference](Api/modifiers.md)
- **State**: See [State API Reference](Api/state.md)

## 🎯 What is SwiftGUI?

SwiftGUI is a declarative UI framework that:

- ✅ Uses SwiftUI-like syntax for building UIs
- ✅ Powered by Dear ImGui under the hood
- ✅ Cross-platform (macOS, iOS, and more)
- ✅ Immediate mode rendering
- ✅ Type-safe and Swift-native
- ✅ Property wrappers for state management (@State, Binding)
- ✅ Result builders for declarative UI (@GuiBuilder)

## 📖 Example

```swift
import SwiftGUI

struct CounterApp: GuiView {
    @State var count = 0

    func render() {
        Window("Counter App") {
            VStack {
                Text("Count: \(count)")
                    .font(1)
                    .textColor(.cyan)

                HStack {
                    Button("Increment") {
                        count += 1
                    }
                    .backgroundColor(.green)

                    Button("Decrement") {
                        count -= 1
                    }
                    .backgroundColor(.red)
                }
            }
        }
    }
}
```

## 🤝 Contributing

Found an issue with the documentation? Please open an issue or submit a pull request!

## 📄 License

SwiftGUI is available under the MIT license.
