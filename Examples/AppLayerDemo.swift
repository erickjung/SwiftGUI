//
// SwiftGUI App Layer Demo
//
// This example demonstrates the new SwiftUI-style @main app API that
// eliminates 90+ lines of platform-specific boilerplate.
//
// Compare this to Sample01Mac/ViewController.swift to see the difference!
//

import SwiftGUI

// MARK: - SwiftUI-Style App (New Way)

@main
struct DemoApp: GuiApp {
    var body: some Scene {
        WindowGroup("SwiftGUI Demo") {
            ContentView()
        }
        .theme(DarculaTheme())
        .fontGroup(DefaultFontGroup())
        .windowSize(width: 800, height: 600)
        .windowPosition(x: 100, y: 100)
        .resizable(true)
        .minimumSize(width: 640, height: 480)
    }
}

// MARK: - Content View

struct ContentView: GuiView {
    @State var sliderValue: Float = 0.5
    @State var checkboxValue = false
    @State var textInput = "Hello, SwiftGUI!"
    @State var counter = 0

    func render() {
        Window("Main Window", options: .menuBar) {
            CollapsingHeader("Controls", options: .defaultOpen) {
                Text("This demo uses the new @main app layer!")
                    .textColor(.green)

                NewLine()

                Slider(label: "Volume", value: $sliderValue, in: 0...1)
                    .backgroundColor(.darkGray)

                CheckBox("Enable feature", isOn: $checkboxValue)
                    .activeColor(.green)

                TextField(label: "Input", text: $textInput)
                    .snap()

                Button("Increment Counter") {
                    counter += 1
                }

                Text("Counter: \(counter)")
                    .textColor(.yellow)
            }

            CollapsingHeader("Benefits", options: .defaultOpen) {
                Text("✓ Zero platform-specific code")
                Text("✓ No MTKView setup")
                Text("✓ No GuiRenderer boilerplate")
                Text("✓ No event handler methods")
                Text("✓ No tracking areas (macOS)")
                Text("✓ Declarative window configuration")
                Text("✓ Works identically on macOS and iOS")
            }
        }
        .position(CGPoint(x: 0, y: 20), condition: .always)
        .windowSize(CGSize(width: 800, height: 580), condition: .always)
        .render()
    }
}
