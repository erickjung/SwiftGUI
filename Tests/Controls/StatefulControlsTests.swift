//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Testing
@testable import SwiftGUI

@Suite("Stateful Controls Tests")
struct StatefulControlsTests {

    // MARK: - CheckBox Tests

    @Test("CheckBox is a struct")
    func checkboxIsStruct() {
        var checkbox = CheckBox(isOn: .constant(false))
        checkbox = checkbox.identifier("test")

        #expect(true)
    }

    @Test("CheckBox takes Binding")
    func checkboxTakesBinding() {
        var value = false
        let binding = Binding(get: { value }, set: { value = $0 })
        let checkbox = CheckBox("Test", isOn: binding)

        #expect(checkbox.text == "Test")
        #expect(!checkbox.isOn.wrappedValue)
    }

    @Test("CheckBox supports modifiers")
    func checkboxModifiable() {
        let checkbox = CheckBox(isOn: .constant(false))
            .identifier("test-checkbox")
            .textColor(.red)

        #expect(checkbox.modifiers.id == "test-checkbox")
        #expect(checkbox.modifiers.textColor != nil)
    }

    @Test("CheckBox has activeColor property")
    func checkboxHasActiveColor() {
        var checkbox = CheckBox(isOn: .constant(false))
        checkbox.activeColor = .blue

        #expect(checkbox.activeColor == .blue)
    }

    // MARK: - RadioButton Tests

    @Test("RadioButton is a struct")
    func radioButtonIsStruct() {
        var button = RadioButton(isActive: .constant(false))
        button = button.identifier("test")

        #expect(true)
    }

    @Test("RadioButton takes Binding")
    func radioButtonTakesBinding() {
        var value = true
        let binding = Binding(get: { value }, set: { value = $0 })
        let button = RadioButton("Option", isActive: binding)

        #expect(button.text == "Option")
        #expect(button.isActive.wrappedValue)
    }

    @Test("RadioButton has activeColor property")
    func radioButtonHasActiveColor() {
        var button = RadioButton(isActive: .constant(false))
        button.activeColor = .green

        #expect(button.activeColor == .green)
    }

    // MARK: - RadioButtonGroup Tests

    @Test("RadioButtonGroup is a struct")
    func radioButtonGroupIsStruct() {
        var group = RadioButtonGroup(["A", "B"], selectedIndex: .constant(0))
        group = group.identifier("test")

        #expect(true)
    }

    @Test("RadioButtonGroup takes Binding")
    func radioButtonGroupTakesBinding() {
        var index = 1
        let binding = Binding(get: { index }, set: { index = $0 })
        let group = RadioButtonGroup(["A", "B", "C"], selectedIndex: binding)

        #expect(group.values == ["A", "B", "C"])
        #expect(group.selectedIndex.wrappedValue == 1)
    }

    @Test("RadioButtonGroup supports modifiers")
    func radioButtonGroupModifiable() {
        let group = RadioButtonGroup(["A", "B"], selectedIndex: .constant(0))
            .identifier("group")
            .padding(.all, value: 10)

        #expect(group.modifiers.id == "group")
        #expect(group.modifiers.padding != nil)
    }

    // MARK: - Slider Tests

    @Test("Slider is a struct")
    func sliderIsStruct() {
        var slider = Slider(value: .constant(0.5), in: 0...1)
        slider = slider.identifier("test")

        #expect(true)
    }

    @Test("Slider takes Binding and range")
    func sliderTakesBinding() {
        var value: Float = 0.75
        let binding = Binding(get: { value }, set: { value = $0 })
        let slider = Slider(label: "Volume", value: binding, in: 0.0...1.0)

        #expect(slider.label == "Volume")
        #expect(slider.value.wrappedValue == 0.75)
        #expect(slider.range == 0.0...1.0)
    }

    @Test("Slider uses range correctly")
    func sliderUsesRange() {
        let slider = Slider(value: .constant(50), in: 0...100)

        #expect(slider.range.lowerBound == 0)
        #expect(slider.range.upperBound == 100)
    }

    @Test("Slider has color properties")
    func sliderHasColors() {
        var slider = Slider(value: .constant(0.5))
        slider.backgroundColor = .gray
        slider.activeColor = .blue
        slider.hoveredColor = .lightGray
        slider.selectionColor = .cyan

        #expect(slider.backgroundColor == .gray)
        #expect(slider.activeColor == .blue)
        #expect(slider.hoveredColor == .lightGray)
        #expect(slider.selectionColor == .cyan)
    }

    // MARK: - Drag Tests

    @Test("Drag is a struct")
    func dragIsStruct() {
        var drag = Drag(value: .constant(0))
        drag = drag.identifier("test")

        #expect(true)
    }

    @Test("Drag takes Binding with speed and range")
    func dragTakesBinding() {
        var value = 42
        let binding = Binding(get: { value }, set: { value = $0 })
        let drag = Drag(label: "Count", value: binding, speed: 2.0, in: 0...100)

        #expect(drag.label == "Count")
        #expect(drag.value.wrappedValue == 42)
        #expect(drag.speed == 2.0)
        #expect(drag.range == 0...100)
    }

    @Test("Drag has color properties")
    func dragHasColors() {
        var drag = Drag(value: .constant(5))
        drag.backgroundColor = .white
        drag.hoveredColor = .yellow

        #expect(drag.backgroundColor == .white)
        #expect(drag.hoveredColor == .yellow)
    }

    // MARK: - TextField Tests

    @Test("TextField is a struct")
    func textFieldIsStruct() {
        var textField = TextField(text: .constant(""))
        textField = textField.identifier("test")

        #expect(true)
    }

    @Test("TextField takes Binding and stores all parameters")
    func textFieldTakesBinding() {
        var text = "Hello"
        let binding = Binding(get: { text }, set: { text = $0 })
        let textField = TextField(
            type: .default,
            label: "Name",
            text: binding,
            placeHolder: "Enter name"
        )

        #expect(textField.label == "Name")
        #expect(textField.text.wrappedValue == "Hello")
        #expect(textField.placeHolder == "Enter name")
        #expect(textField.type == .default)
    }

    @Test("TextField supports multiline type")
    func textFieldMultiline() {
        let textField = TextField(
            type: .multiline,
            text: .constant("Multi\nLine")
        )

        #expect(textField.type == .multiline)
    }

    @Test("TextField has size property")
    func textFieldHasSize() {
        var textField = TextField(text: .constant(""))
        textField.size = GuiSize(width: 200, height: 30)

        #expect(textField.size?.width == 200)
        #expect(textField.size?.height == 30)
    }

    // MARK: - TextEditor Tests

    @Test("TextEditor is a struct")
    func textEditorIsStruct() {
        var editor = TextEditor(.constant(""))
        editor = editor.identifier("test")

        #expect(true)
    }

    @Test("TextEditor takes Binding")
    func textEditorTakesBinding() {
        var code = "let x = 5"
        let binding = Binding(get: { code }, set: { code = $0 })
        let editor = TextEditor(binding)

        #expect(editor.text.wrappedValue == "let x = 5")
    }

    @Test("TextEditor supports modifiers")
    func textEditorModifiable() {
        let editor = TextEditor(.constant(""))
            .identifier("code-editor")
            .padding(.all, value: 5)

        #expect(editor.modifiers.id == "code-editor")
    }

    // MARK: - ComboBox Tests

    @Test("ComboBox is a struct")
    func comboBoxIsStruct() {
        var combo = ComboBox("Select", selectedIndex: .constant(0), items: ["A"])
        combo = combo.identifier("test")

        #expect(true)
    }

    @Test("ComboBox takes Binding and stores items")
    func comboBoxTakesBinding() {
        var index = 1
        let binding = Binding(get: { index }, set: { index = $0 })
        let combo = ComboBox(
            "Choose",
            selectedIndex: binding,
            items: ["Red", "Green", "Blue"]
        )

        #expect(combo.text == "Choose")
        #expect(combo.selectedIndex.wrappedValue == 1)
        #expect(combo.items == ["Red", "Green", "Blue"])
    }

    @Test("ComboBox has color properties")
    func comboBoxHasColors() {
        var combo = ComboBox("Test", selectedIndex: .constant(0), items: ["A"])
        combo.backgroundColor = .darkGray
        combo.activeColor = .orange
        combo.hoveredColor = .yellow
        combo.selectionColor = .cyan

        #expect(combo.backgroundColor == .darkGray)
        #expect(combo.activeColor == .orange)
        #expect(combo.hoveredColor == .yellow)
        #expect(combo.selectionColor == .cyan)
    }

    // MARK: - ListBox Tests

    @Test("ListBox is a struct")
    func listBoxIsStruct() {
        var listBox = ListBox(selectedIndex: .constant(0), items: ["A"])
        listBox = listBox.identifier("test")

        #expect(true)
    }

    @Test("ListBox takes Binding and stores items")
    func listBoxTakesBinding() {
        var index = 2
        let binding = Binding(get: { index }, set: { index = $0 })
        let listBox = ListBox(
            label: "Items",
            selectedIndex: binding,
            items: ["One", "Two", "Three"]
        )

        #expect(listBox.label == "Items")
        #expect(listBox.selectedIndex.wrappedValue == 2)
        #expect(listBox.items.count == 3)
    }

    @Test("ListBox has color properties")
    func listBoxHasColors() {
        var listBox = ListBox(selectedIndex: .constant(0), items: ["A", "B"])
        listBox.backgroundColor = .white
        listBox.activeColor = .blue
        listBox.hoveredColor = .lightGray
        listBox.selectionColor = .purple

        #expect(listBox.backgroundColor == .white)
        #expect(listBox.activeColor == .blue)
        #expect(listBox.hoveredColor == .lightGray)
        #expect(listBox.selectionColor == .purple)
    }

    // MARK: - ColorEdit Tests

    @Test("ColorEdit is a struct")
    func colorEditIsStruct() {
        var colorEdit = ColorEdit(color: .constant(.red))
        colorEdit = colorEdit.identifier("test")

        #expect(true)
    }

    @Test("ColorEdit takes Binding")
    func colorEditTakesBinding() {
        var color = GuiColor.blue
        let binding = Binding(get: { color }, set: { color = $0 })
        let colorEdit = ColorEdit(color: binding)

        #expect(colorEdit.color.wrappedValue == .blue)
    }

    @Test("ColorEdit has color properties")
    func colorEditHasColors() {
        var colorEdit = ColorEdit(color: .constant(.red))
        colorEdit.backgroundColor = .gray
        colorEdit.hoveredColor = .lightGray

        #expect(colorEdit.backgroundColor == .gray)
        #expect(colorEdit.hoveredColor == .lightGray)
    }

    // MARK: - Integration Tests

    @Test("Stateful controls work with @State")
    func statefulControlsWithState() {
        class TestController {
            @State var isChecked = false
            @State var sliderValue: Float = 0.5
            @State var text = "Hello"
            @State var selectedIndex = 0
        }

        let controller = TestController()

        #expect(!controller.$isChecked.wrappedValue)
        #expect(controller.$sliderValue.wrappedValue == 0.5)
        #expect(controller.$text.wrappedValue == "Hello")
        #expect(controller.$selectedIndex.wrappedValue == 0)

        let checkbox = CheckBox("Enable", isOn: controller.$isChecked)
        let slider = Slider(value: controller.$sliderValue, in: 0...1)
        let textField = TextField(text: controller.$text)
        let combo = ComboBox("Pick", selectedIndex: controller.$selectedIndex, items: ["A", "B"])

        #expect(!checkbox.isOn.wrappedValue)
        #expect(slider.value.wrappedValue == 0.5)
        #expect(textField.text.wrappedValue == "Hello")
        #expect(combo.selectedIndex.wrappedValue == 0)
    }

    @Test("Binding updates reflect in control")
    func bindingUpdatesReflectInControl() {
        var value = false
        let binding = Binding(get: { value }, set: { value = $0 })
        let checkbox = CheckBox(isOn: binding)

        #expect(!checkbox.isOn.wrappedValue)

        value = true

        #expect(checkbox.isOn.wrappedValue)
    }

    @Test("All controls are modifiable")
    func allControlsAreModifiable() {
        let checkbox = CheckBox(isOn: .constant(false)).identifier("cb")
        let radioButton = RadioButton(isActive: .constant(false)).identifier("rb")
        let radioGroup = RadioButtonGroup(["A"], selectedIndex: .constant(0)).identifier("rg")
        let slider = Slider(value: .constant(0.5)).identifier("sl")
        let drag = Drag(value: .constant(0)).identifier("dr")
        let textField = TextField(text: .constant("")).identifier("tf")
        let textEditor = TextEditor(.constant("")).identifier("te")
        let combo = ComboBox("", selectedIndex: .constant(0), items: [""]).identifier("cb")
        let listBox = ListBox(selectedIndex: .constant(0), items: [""]).identifier("lb")
        let colorEdit = ColorEdit(color: .constant(.red)).identifier("ce")

        #expect(checkbox.modifiers.id == "cb")
        #expect(radioButton.modifiers.id == "rb")
        #expect(radioGroup.modifiers.id == "rg")
        #expect(slider.modifiers.id == "sl")
        #expect(drag.modifiers.id == "dr")
        #expect(textField.modifiers.id == "tf")
        #expect(textEditor.modifiers.id == "te")
        #expect(combo.modifiers.id == "cb")
        #expect(listBox.modifiers.id == "lb")
        #expect(colorEdit.modifiers.id == "ce")
    }
}
