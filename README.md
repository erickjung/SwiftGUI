<center>

![SwiftGUI](Docs/swiftgui.png)

[![license](https://img.shields.io/badge/license-MIT-brightgreen.svg)](LICENSE)
[![swift version](https://img.shields.io/badge/swift-5.0+-brightgreen.svg)](https://swift.org/download)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

<b>SwiftGUI</b> is an experimental API inspired by <b>SwiftUI</b> DSL, using Dear ImGui as renderer and running on OSX and iOS.
</center>

<p align="center">
    <img src="Docs/hellow_world.png" alt="hellow world"/>
</p>

```swift
Window("SwiftGUI") {

    Text("Hello world!")

    HStack {
        ForEach(1...2) { val in
            Button("Click \(val)")
        }

        ForEach(1...2) { val in
            CheckBox("Check \(val)", selectedState: true)
        }

        ForEach(1...2) { val in
            RadioButton("Radio \(val)", activeState: true)
        }
    }
}
```

## Highlights

* Easy to use abstraction for Dear ImGui
* Multi-platform support (iOS 11+ and macOS 10.13+)
* Huge list of UI components already available

### Theme support
    - Color scheme (embedded Darcula and Light)
    - Custom Fonts (embedded FiraCode)

### Components
    - Buttons
    - CheckBox
    - Color Selection
    - ComboBox
    - Drag
    - Dock
    - Image
    - InputFields
    - Lists
    - Menu
    - Plotting
    - Popup
    - RadioButton
    - SelectableFields
    - Sliders
    - TabBar
    - Texts
    - Text Editor (Code editor)
    - Tooltips
    - Tree
    - Window
    - General 
        - Group
        - HStack
        - Separator/NewLine/Spacing/Indent
        - ForEach
        - Perform


## Installation

### Carthage

To integrate `SwiftGui` into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "erickjung/SwiftGUI" "0.9.0"
```

For `OSX` project, run:

```ogdl
carthage update --platform macOS
```

For `iOS` project, run:

```ogdl
carthage update --platform iOS
```

### Cocoapods

To integrate `SwiftGui` into your Xcode project using Cocoapods, specify it in your `Podfile`:

```ogdl
pod 'SwiftGui', '~> 0.9.0'
```

run:

```ogdl
pod install
```

## Samples

### Sample01 (macOS)

![sample01](Docs/sample01-osx.gif)

### Sample 02 (macOS) - Simple TODO application

![sample02](Docs/sample02-osx.gif)

### Screenshot 01 (iOS)

![sample03](Docs/sample01-ios.jpg)

## Contributing

Read the [Contributing guidelines](CONTRIBUTING.md)

## License

 [MIT](LICENSE)

## Using 

* [Dear ImGui](https://github.com/ocornut/imgui) (1.77)
* [ImGuiColorTextEdit](https://github.com/BalazsJako/ImGuiColorTextEdit)

