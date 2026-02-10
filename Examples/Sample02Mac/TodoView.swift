//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import SwiftGUI

/// TODO app demo view using the new @main app layer.
struct TodoView: GuiView {

    @State var inputTask: String = ""
    @State var items = [ "Test todo app": false ]

    // MARK: - Render

    func render() {
        Window("TODO", options: .noTitleBar) {
            todoInput()
            todoList()
            doneList()
        }
        .position(CGPoint(x: 0, y: 0), condition: .always)
        .windowSize(CGSize(width: 800, height: 600), condition: .always)
        .font(DefaultFontGroup.Types.FiraCode_18)
        .render()
    }

    // MARK: - Data Operations

    func insertItem(key: String) {
        var newItems = self.items
        newItems[key] = false
        self.items = newItems
    }

    func updateItem(key: String, value: Bool) {
        var newItems = self.items
        newItems[key] = value
        self.items = newItems
    }

    func removeItem(key: String) {
        var newItems = self.items
        newItems.removeValue(forKey: key)
        self.items = newItems
    }

    func binding(for key: String) -> Binding<Bool> {
        Binding(
            get: { self.items[key] ?? false },
            set: { newValue in
                var newItems = self.items
                newItems[key] = newValue
                self.items = newItems
            }
        )
    }

    // MARK: - UI Components

    func todoInput() -> any GuiView {
        Group {
            Text("Task Description:")

            TextField(label: "##input", text: $inputTask, placeHolder: "ex. buy milk")
                .snap()

            Button("Create") {
                if self.inputTask.count > 0 {
                    self.insertItem(key: self.inputTask)
                    self.inputTask = ""
                }
            }

            NewLine()
        }
        .padding(.top, value: 10)
    }

    func confirmationPopup(name: String) -> any GuiView {
        Popup {
            Text("Remove this task?")

            HStack {
                Button("No") {
                    Popup.close()
                }

                Button("Yes") {
                    self.removeItem(key: name)
                    Popup.close()
                }
            }
        }
        .identifier(name)
    }

    func cell(name: String, color: GuiColor) -> any GuiView {
        Group {
            HStack {
                CheckBox(isOn: binding(for: name))

                if !(items[name] ?? false) {
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
    }

    func todoList() -> any GuiView {
        CollapsingHeader("TODO", options: .defaultOpen) {
            SubWindow {
                ForEach(items) { val in
                    if !val.1 {
                        return self.cell(name: val.0, color: .orange)
                    }
                    return nil
                }
            }
            .size(GuiSize(width: 0, height: 150))
            .identifier("##todo")
        }
    }

    func doneList() -> any GuiView {
        CollapsingHeader("DONE", options: .defaultOpen) {
            SubWindow {
                ForEach(items) { val in
                    if val.1 {
                        return self.cell(name: val.0, color: .gray)
                    }
                    return nil
                }
            }
            .identifier("##done")
        }
    }
}
