//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import SwiftGUI

/// Main demo view showcasing SwiftGUI components using the new app layer.
///
/// This demonstrates the new @main app API which eliminates 90+ lines
/// of boilerplate compared to the old ViewController approach.
struct DemoView: GuiView {

    // MARK: - State

    @State var checkboxValue1 = false
    @State var checkboxValue2 = true
    @State var checkboxValue3 = true
    @State var checkboxValue4 = true

    @State var comboSelection1 = 0
    @State var comboSelection2 = 1
    @State var comboSelection3 = 1
    @State var comboSelection4 = 1
    @State var comboSelection5 = 1

    @State var radioValue1 = true
    @State var radioValue2 = false
    @State var radioValue3 = true
    @State var radioValue4 = true

    @State var radioGroupSelection1 = 1
    @State var radioGroupSelection2 = 1

    @State var colorEditValue1 = GuiColor.red
    @State var colorEditValue2 = GuiColor.blue
    @State var colorEditValue3 = GuiColor.blue
    @State var colorEditValue4 = GuiColor.blue

    @State var dragValue1 = 0
    @State var dragValue2 = 50
    @State var dragValue3 = 50

    @State var listBoxSelection1 = 0
    @State var listBoxSelection2 = 1
    @State var listBoxSelection3 = 1
    @State var listBoxSelection4 = 1

    @State var textFieldValue1 = "test"
    @State var textFieldValue2 = "test"
    @State var textFieldValue3 = "test"
    @State var textFieldValue4 = "test"

    @State var textEditorValue = "test text editor"

    @State var sliderValue1: Float = 0.2
    @State var sliderValue2: Float = 1.0
    @State var sliderValue3: Float = 1.0
    @State var sliderValue4: Float = 1.0
    @State var sliderValue5: Float = 1.0

    var bigList = [String](repeating: "test", count: 2000)

    // MARK: - Render

    func render() {
        Window("SwiftGUI Demo", options: [.menuBar]) {

            Text("SwiftGUI 2.0 - New App Layer Demo")
                .textColor(.green)

            Text("This sample uses @main GuiApp - zero boilerplate!")
                .textColor(.yellow)

            NewLine()

            testText()
            testTextLabel()
            testButton()
            testCheckbox()
            testComboBox()
            testRadioButton()
            testRadioGroup()
            testColorEdit()
            testDrag()
            testListBox()
            testList()
            testPopup()
            testTextField()
            testTextFieldMultiline()
            testTextEditor()
            testSlider()
            testHStack()
            testForEach()
        }
        .position(CGPoint(x: 0, y: 20), condition: .always)
        .windowSize(CGSize(width: 800, height: 780), condition: .always)
        .render()
    }

    // MARK: - Test Functions

    func testText() -> any GuiView {
        CollapsingHeader("Text") {
            Text("text")
            Text("text").textColor(.red)
            Text("text").textColor(.green)
            Text("text").textColor(.blue)
        }
    }

    func testTextLabel() -> any GuiView {
        CollapsingHeader("TextLabel") {
            TextLabel(label: "label", value: "test")
        }
    }

    func testButton() -> any GuiView {
        CollapsingHeader("Button") {
            Button("button") {
                print("button clicked")
            }

            Button("button") {
                print("button clicked")
            }
            .backgroundColor(.red)

            Button("button") {
                print("button clicked")
            }
            .backgroundColor(.green)
            .textColor(.white)
        }
    }

    func testCheckbox() -> any GuiView {
        CollapsingHeader("CheckBox") {
            CheckBox("value 1", isOn: $checkboxValue1)
            CheckBox("value 2", isOn: $checkboxValue2)
            CheckBox("value 3", isOn: $checkboxValue3)
                .activeColor(.red)
            CheckBox("value 4", isOn: $checkboxValue4)
                .activeColor(.green)
        }
    }

    func testComboBox() -> any GuiView {
        CollapsingHeader("ComboBox") {
            ComboBox("combo 1", selectedIndex: $comboSelection1, items: ["test1", "test2", "test3"])
            ComboBox("combo 2", selectedIndex: $comboSelection2, items: ["test1", "test2", "test3"])
            ComboBox("combo 3", selectedIndex: $comboSelection3, items: ["test1", "test2", "test3"])
                .backgroundColor(.darkGray)
            ComboBox("combo 4", selectedIndex: $comboSelection4, items: ["test1", "test2", "test3"])
                .backgroundColor(.darkGray)
                .textColor(.orange)
            ComboBox("combo 5", selectedIndex: $comboSelection5, items: bigList)
        }
    }

    func testRadioButton() -> any GuiView {
        CollapsingHeader("RadioButton") {
            RadioButton("value 1", isActive: $radioValue1)
            RadioButton("value 2", isActive: $radioValue2)
            RadioButton("value 3", isActive: $radioValue3)
                .activeColor(.orange)
            RadioButton("value 4", isActive: $radioValue4)
                .activeColor(.green)
        }
    }

    func testRadioGroup() -> any GuiView {
        CollapsingHeader("RadioButtonGroup") {
            RadioButtonGroup(["test1", "test2", "test3"], selectedIndex: $radioGroupSelection1)
            RadioButtonGroup(["test1", "test2", "test3"], selectedIndex: $radioGroupSelection2)
                .activeColor(.orange)
        }
    }

    func testColorEdit() -> any GuiView {
        CollapsingHeader("ColorEdit") {
            ColorEdit(color: $colorEditValue1)
            ColorEdit(color: $colorEditValue2)
            ColorEdit(color: $colorEditValue3)
            ColorEdit(color: $colorEditValue4)
                .backgroundColor(.darkGray)
        }
    }

    func testDrag() -> any GuiView {
        CollapsingHeader("Drag") {
            Drag(label: "drag 1", value: $dragValue1, in: 0...100)
            Drag(label: "drag 2", value: $dragValue2, in: 0...100)
                .backgroundColor(.darkGray)
            Drag(label: "drag 3", value: $dragValue3, in: 0...100)
                .backgroundColor(.darkGray)
                .textColor(.orange)
        }
    }

    func testListBox() -> any GuiView {
        CollapsingHeader("ListBox") {
            ListBox(label: "list 1", selectedIndex: $listBoxSelection1, items: ["test1", "test2", "test3"])
            ListBox(label: "list 2", selectedIndex: $listBoxSelection2, items: ["test1", "test2", "test3"])
            ListBox(label: "list 3", selectedIndex: $listBoxSelection3, items: ["test1", "test2", "test3"])
                .backgroundColor(.darkGray)
            ListBox(label: "list 4", selectedIndex: $listBoxSelection4, items: ["test1", "test2", "test3"])
                .backgroundColor(.darkGray)
                .textColor(.orange)
        }
    }

    func testList() -> any GuiView {
        CollapsingHeader("List (BigList)") {
            SubWindow {
                ForEach(bigList) { item in
                    Button("\(item)_\(index)")
                }
            }
            .identifier("##biglist")
        }
    }

    func testPopup() -> any GuiView {
        CollapsingHeader("Popup") {
            Popup {
                Text("Hello")
                Button("close") {
                    Popup.close()
                }
            }.identifier("##p1")

            Popup(type: .modal) {
                Text("Hello")
                Button("close") {
                    Popup.close()
                }
            }.identifier("##p2")

            Button("open simple") {
                Popup.open("##p1")
            }

            Button("open modal") {
                Popup.open("##p2")
            }
        }
    }

    func testTextField() -> any GuiView {
        CollapsingHeader("TextField") {
            TextField(text: $textFieldValue1)
                .identifier("##t1")

            TextField(text: $textFieldValue2)
                .backgroundColor(.darkGray)
                .textColor(.orange)
                .identifier("##t2")
        }
    }

    func testTextFieldMultiline() -> any GuiView {
        CollapsingHeader("TextField Multiline") {
            TextField(type: .multiline, text: $textFieldValue3)
                .identifier("##t3")

            TextField(type: .multiline, text: $textFieldValue4)
                .backgroundColor(.darkGray)
                .textColor(.orange)
                .identifier("##t4")
        }
    }

    func testTextEditor() -> any GuiView {
        CollapsingHeader("TextEditor") {
            TextEditor($textEditorValue)
        }
    }

    func testSlider() -> any GuiView {
        CollapsingHeader("Slider") {
            Slider(label: "slider 1", value: $sliderValue1, in: 0...1)
            Slider(label: "slider 2", value: $sliderValue2, in: 0...10)
            Slider(label: "slider 3", value: $sliderValue3, in: 0...10)
                .backgroundColor(.darkGray)
            Slider(label: "slider 4", value: $sliderValue4, in: 0...10)
                .backgroundColor(.darkGray)
                .textColor(.orange)
            Slider(label: "slider 5", value: $sliderValue5, in: 0...10)
        }
    }

    func testHStack() -> any GuiView {
        CollapsingHeader("HStack") {
            HStack {
                Button("A") { }
                Button("B") { }
                Button("C") { }
            }
        }
    }

    func testForEach() -> any GuiView {
        CollapsingHeader("ForEach") {
            ForEach(["test1", "test2", "test3"]) { item in
                Button(item)
            }
        }
    }
}
