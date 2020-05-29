//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Cocoa
import Metal
import MetalKit
import SwiftGui

class ViewController: MTKViewController {

    enum States {

        static var inputTask: String = ""
    }

    var items = [ "Test todo app": false ]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.renderer?.delegate = self
        self.renderer?.initializePlatform()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

// data
extension ViewController {

    func insertItem(key: String) {
        self.items[key] = false
    }

    func updateItem(key: String, value: Bool) {
        self.items[key] = value
    }

    func removeItem(key: String) {
        self.items.removeValue(forKey: key)
    }
}

extension ViewController: GuiRendererDelegate {

    func setup() {
        DefaultFontGroup().load()
        DarculaTheme().apply()
    }

    func todoInput() -> GuiView {

        Group {

            Text("Task Description:")

            TextField(textState: States.inputTask, placeHolder: "ex. buy milk") {
                States.inputTask = $0
            }
            .snap()

            Button("Create") {

                if States.inputTask.count > 0 {

                    self.insertItem(key: States.inputTask)
                    States.inputTask = ""
                }
            }

            NewLine()
        }
        .padding(.top, value: 10)
    }

    func confirmationPopup(name: String) -> GuiView {

        Popup {

            Text("Remove this task?")

            HStack {

                Button("No") {

                    Popup.close()
                }

                Button("Yes") {

                    self.removeItem(key: name)
                }
            }
        }
        .identifier(name)
    }

    func cell(name: String, value: Bool, color: GuiColor) -> GuiView {

        Group {

            HStack {

                CheckBox(selectedState: value) {

                    self.updateItem(key: name, value: $0)
                }

                if !value {

                    Text(name)

                } else {

                    Text(name)
                        .textColor(.gray)
                }
            }

            Button("remove") {

                Popup.open(name)
            }
            .backgroundColor(color)

            confirmationPopup(name: name)

            Divider()
        }
        .identifier(name)
    }

    func todoList() -> GuiView {

        CollapsingHeader("TODO", options: .defaultOpen) {

            SubWindow {

                ForEach(items) { val in

                    if !val.1 {

                        return self.cell(name: val.0, value: val.1, color: .orange)
                    }
                    return nil
                }
            }
            .size(GuiSize(width: 0, height: 150))
            .identifier("##todo")
        }
    }

    func doneList() -> GuiView {

        CollapsingHeader("DONE", options: .defaultOpen) {

            SubWindow {

                ForEach(items) { val in

                    if val.1 {

                        return self.cell(name: val.0, value: val.1, color: .gray)
                    }
                    return nil
                }
            }
            .identifier("##done")
        }
    }

    func mainView() -> GuiView {

        Window("TODO", options: .noTitleBar) {

            todoInput()
            todoList()
            doneList()
        }
        .position(CGPoint(x: 0, y: 0), condition: .always)
        .size(CGSize(width: self.view.frame.width,
                     height: self.view.frame.height), condition: .always)
        .font(DefaultFontGroup.Types.FiraCode_18)
    }

    func draw() {
        mainView().render()
    }
}
