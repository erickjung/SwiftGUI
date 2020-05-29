//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import UIKit
import SwiftGui

class ViewController: UIViewController, GuiRendererDelegate {

    var renderer: GuiRenderer?
    let mtkView = MTKView()
    var logo: GuiImage?
    var bigList = [String](repeating: "test", count: 2000)

    override func loadView() {
        self.view = mtkView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let mtkView = self.view as? MTKView {

            mtkView.device = MTLCreateSystemDefaultDevice()

            self.renderer = GuiRenderer(view: mtkView)
            self.renderer?.delegate = self
            mtkView.delegate = self.renderer
        }

        self.renderer?.initializePlatform()

        self.loadResources()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.renderer?.handle(event, view: self.view)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.renderer?.handle(event, view: self.view)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.renderer?.handle(event, view: self.view)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.renderer?.handle(event, view: self.view)
    }

    private func loadResources() {

        logo = self.renderer?.loadTexture(withName: "swiftgui")
    }

    func setup() {

        DefaultFontGroup().load()
        DarculaTheme().apply()
    }

    func draw() {
        mainView().render()
    }
}

private extension ViewController {

    func testText() -> GuiView {

        CollapsingHeader("Text") {

            Text("color1").textColor(.darkGray)
            Text("color2").textColor(.orange)
            Text("test")
            Text("this text should automatically wrap on the edge of the window. The current implementation for text wrapping follows simple rules suitable for English and possibly other languages.", type: .wrapped)
        }
    }

    func testButton() -> GuiView {

        CollapsingHeader("Button") {

            Button("simple button")
            Button("small button", type: .small)
            Button("background/text color")
                .backgroundColor(.darkGray)
                .textColor(.orange)

            Button("size: 100x100")
                .size(GuiSize(width: 100, height: 100))

            Button("hovered color: red")
                .hoveredColor(.red)

            Button("active color: green")
                .activeColor(.green)
        }
    }

    func testCheckbox() -> GuiView {

        CollapsingHeader("Checkbox") {

            CheckBox("test false", selectedState: false)
            CheckBox("test true", selectedState: true)
            CheckBox("text color: yellow", selectedState: true)
                .textColor(.orange)

            CheckBox("active color: green", selectedState: true)
                .activeColor(.green)
        }
    }

    func testComboBox() -> GuiView {

        CollapsingHeader("Combobox") {

            ComboBox("combo1", selectedIndexState: 0, items: ["AAAA", "BBBB", "CCCC", "DDDD"])
            ComboBox("back/text color", selectedIndexState: 1, items: ["AAAA", "BBBB", "CCCC", "DDDD"])
                .backgroundColor(.darkGray)
                .textColor(.orange)

            ComboBox("hover color", selectedIndexState: 1, items: ["AAAA", "BBBB", "CCCC", "DDDD"])
                .hoveredColor(.orange)

            ComboBox("active color", selectedIndexState: 1, items: ["AAAA", "BBBB", "CCCC", "DDDD"])
                .activeColor(.orange)

            ComboBox("select color", selectedIndexState: 1, items: ["AAAA", "BBBB", "CCCC", "DDDD"])
                .selectionColor(.orange)
        }
    }

    func testRadioButton() -> GuiView {

        CollapsingHeader("RadioButton") {

            RadioButton("test false", activeState: true)
            RadioButton("test true", activeState: false)
            RadioButton("text color: yellow", activeState: true)
                .textColor(.orange)

            RadioButton("active color: green", activeState: true)
                .activeColor(.green)
        }
    }

    func testRadioGroup() -> GuiView {

        CollapsingHeader("RadioButtonGroup") {

            RadioButtonGroup(["radio1", "radio2", "radio3"], selectedIndexState: 1)
            RadioButtonGroup(["radio1", "radio2", "radio3"], selectedIndexState: 1)
                .textColor(.orange)
                .activeColor(.green)
        }
    }

    func testColorEdit() -> GuiView {

        CollapsingHeader("ColorEdit") {

            ColorEdit(colorState: .red)
                .identifier("##e1")

            ColorEdit(colorState: .blue)
                .identifier("##e2")

            ColorEdit(colorState: .blue)
                .backgroundColor(.darkGray)
                .textColor(.orange)
                .identifier("##e3")

            ColorEdit(colorState: .blue)
                .hoveredColor(.orange)
                .identifier("##e4")
        }
    }

    func testDrag() -> GuiView {

        CollapsingHeader("Drag") {

            Drag(label: "simple", valueState: 0)
            Drag(label: "back/text color", valueState: 50)
                .backgroundColor(.darkGray)
                .textColor(.orange)

            Drag(label: "hovered color", valueState: 50)
                .hoveredColor(.orange)
        }
    }

    func testImage() -> GuiView {

        CollapsingHeader("Image") {

            Image(imageId: self.logo)
                .size(GuiSize(width: 250, height: 65))
                .borderColor(.orange)

            Image(imageId: self.logo)
                .size(GuiSize(width: 250, height: 65))
                .tintColor(.red)
                .borderColor(.orange)

            Image(imageId: self.logo, uv0: GuiSize(width: 0.5, height: 0.5))
                .size(GuiSize(width: 250, height: 65))
                .borderColor(.orange)

            Image(imageId: self.logo, uv1: GuiSize(width: 0.5, height: 0.5))
                .size(GuiSize(width: 250, height: 65))
                .borderColor(.orange)
        }
    }

    func testListBox() -> GuiView {

        CollapsingHeader("ListBox") {

            ListBox(label: "simple", currentItemState: 0, items: ["Apple", "Banana", "Cherry"])

            ListBox(label: "back/text color", currentItemState: 1, items: ["Apple", "Banana", "Cherry"])
                .backgroundColor(.darkGray)
                .textColor(.orange)

            ListBox(label: "hover/active\ncolor", currentItemState: 1, items: ["Apple", "Banana", "Cherry"])
                .hoveredColor(.darkGray)
                .activeColor(.orange)

            ListBox(label: "select color", currentItemState: 2, items: ["Apple", "Banana", "Cherry"])
                .selectionColor(.orange)
        }
    }

    func testList() -> GuiView {

        CollapsingHeader("List") {

            List(buffer: bigList, itemHeight: 20) { index, item in

                Button("\(item)_\(index)")
            }
        }
    }

    func testPopup() -> GuiView {

        CollapsingHeader("Popup") {

            Popup {
                Text("Hellow")
                Button("close") {
                    Popup.close()
                }
            }.identifier("##p1")

            Popup(type: .modal) {
                Text("Hellow")
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

    func testTextField() -> GuiView {

        CollapsingHeader("TextField") {

            TextField(textState: "Hello, world!")
                .identifier("##t1")

            TextField(textState: "Hello, world!")
                .backgroundColor(.darkGray)
                .textColor(.orange)
                .identifier("##t2")
        }
    }

    func testTextFieldMultiline() -> GuiView {

        CollapsingHeader("TextField Multiline") {

            TextField(type: .multiline,
                      textState: "This text should automatically wrap\non the edge of the window.\nThe current implementation for ...")
                .identifier("##t1")

            TextField(type: .multiline,
                      textState: "This text should automatically wrap\non the edge of the window.\nThe current implementation for ...")
                .backgroundColor(.darkGray)
                .textColor(.orange)
                .identifier("##t2")
        }
    }

    func testTextEditor() -> GuiView {

        CollapsingHeader("TextEditor") {

            TextEditor("editor1")

            Perform {

                let code = "{\n  \"id\": \"XP-8YTH-NNP3-WSVN-3C76\",\n  \"name\": \"exampleProfile\",\n  \"temporary\": false,\n  \"flow_config\": {\n    \"landing_page_type\": \"billing\",\n    \"bank_txn_pending_url\": \"https://example.com/flow_config/\"\n  },\n  \"input_fields\": {\n    \"no_shipping\": 1,\n    \"address_override\": 1\n  },\n  \"presentation\": {\n    \"logo_image\": \"https://example.com/logo_image/\"\n  }\n}\n"
                TextEditor.setText(code)
                TextEditor.setLanguage(.cpp)

                return nil
            }
        }
    }

    func testSlider() -> GuiView {

        CollapsingHeader("Slider") {

            Slider(label: "simple", valueState: 0.2, min: 0, max: 1)

            Slider(label: "back/text color", valueState: 0.3, min: 0, max: 1)
                .backgroundColor(.darkGray)
                .textColor(.orange)

            Slider(label: "hover color", valueState: 0.5, min: 0, max: 1)
                .hoveredColor(.orange)

            Slider(label: "active color", valueState: 0.7, min: 0, max: 1)
                .activeColor(.orange)

            Slider(label: "select color", valueState: 0.8, min: 0, max: 1)
                .selectionColor(.orange)
        }
    }

    func testHStack() -> GuiView {

        CollapsingHeader("HStack") {

            HStack {

                Text("color1").textColor(.darkGray)
                Text("color2").textColor(.orange)
                Text("test")
                Text("this text should automatically wrap on the edge of the window. The current implementation for text wrapping follows simple rules suitable for English and possibly other languages.", type: .wrapped)
            }

            HStack {

                Button("test1")
                Button("button", type: .small)
                Button("color")
                    .backgroundColor(.darkGray)
                    .textColor(.orange)
            }
        }
    }

    func testForEach() -> GuiView {

        CollapsingHeader("ForEach") {

            ForEach(1...5) { val in

                Text("\(val)").textColor(.systemOrange)
            }
        }
    }

    func testPlot() -> GuiView {

        CollapsingHeader("Plot") {

            Plot(type: .line, label: "Frame Times", values: [0.6, 0.1, 1.0, 0.5, 0.92, 0.1, 0.2], size: CGSize(width: 0, height: 80))
                .backgroundColor(.gray)
                .activeColor(.blue)
                .hoveredColor(.green)
                .textColor(.orange)

            Plot(type: .histogram, label: "Histogram", values: [0.6, 0.1, 1.0, 0.5, 0.92, 0.1, 0.2], size: CGSize(width: 0, height: 80))
                .backgroundColor(.gray)
                .activeColor(.blue)
                .hoveredColor(.green)
                .textColor(.orange)
        }
    }

    func testTabBar() -> GuiView {

        CollapsingHeader("TabBar") {

            TabBar {
                TabItem("temp1") {
                    Text("test1")
                }
                TabItem("temp2") {
                    Text("test2")
                }
            }
        }
    }

    func testTree() -> GuiView {

        CollapsingHeader("Tree") {

            Tree("testing close") {
                Text("test")
            }

            Tree("testing open", options: .defaultOpen) {
                Text("test")
            }

            Tree("testing color", options: .defaultOpen) {
                Text("test")
            }
            .activeColor(.blue)
            .hoveredColor(.green)
            .textColor(.orange)
        }
    }

    func mainView() -> GuiView {

        Window("SwiftGUI Demo", options: .menuBar) {

            MenuBar {
                MenuGroup("Theme") {
                    MenuItem("Darcula") {
                        DarculaTheme().apply()
                    }
                    MenuItem("Light") {
                        LightTheme().apply()
                    }
                }
            }

            self.testText()
            self.testButton()
            self.testCheckbox()
            self.testComboBox()
            self.testRadioButton()
            self.testRadioGroup()
            self.testColorEdit()
            self.testDrag()
            self.testImage()
            self.testListBox()
            self.testList()
            self.testPopup()
            self.testTextField()
            self.testTextFieldMultiline()
            self.testTextEditor()
            self.testSlider()
            self.testHStack()
            self.testForEach()
            self.testPlot()
            self.testTabBar()
            self.testTree()
        }
        .position(CGPoint(x: 0, y: (0 + 20)), condition: .always)
        .size(CGSize(width: self.view.frame.width,
                     height: self.view.frame.height - 20), condition: .always)
        .font(DefaultFontGroup.Types.FiraCode_14)
    }
}
