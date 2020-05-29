//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class TextEditor: GuiNode {

    public var text: String

    private let onChange: ((String) -> Void)?

    public init(_ text: String,
                onChange: ((String) -> Void)? = nil) {

        self.text = text
        self.onChange = onChange
    }

    public override func drawComponent() {

        TextEditorWrapper.render(self.text)

        if let onChange = self.onChange,
            TextEditorWrapper.isTextChanged() {

            onChange(TextEditorWrapper.getText())
        }
    }
}

public extension TextEditor {

    static func setLanguage(_ type: TextEditorWrapperLanguage) {

        TextEditorWrapper.setLanguageDefinition(type)
    }

    static func getTotalLines() -> Int {

        Int(TextEditorWrapper.getTotalLines())
    }

    static func isOverwrite() -> Bool {

        TextEditorWrapper.isOverwrite()
    }

    static func setReadOnly(_ value: Bool) {

        TextEditorWrapper.setReadOnly(value)
    }

    static func isReadOnly() -> Bool {

        TextEditorWrapper.isReadOnly()
    }

    static func setShowWhitespaces(_ value: Bool) {

        TextEditorWrapper.setShowWhitespaces(value)
    }

    static func isShowingWhitespaces() -> Bool {

        TextEditorWrapper.isShowingWhitespaces()
    }

    static func setColorizerEnable(_ value: Bool) {

        TextEditorWrapper.setColorizerEnable(value)
    }

    static func isColorizerEnabled() -> Bool {

        TextEditorWrapper.isColorizerEnabled()
    }

    static func setTabSize(_ value: Int) {

        TextEditorWrapper.setTabSize(Int32(value))
    }

    static func getTabSize() -> Int {

        Int(TextEditorWrapper.getTabSize())
    }

    static func canUndo() -> Bool {

        TextEditorWrapper.canUndo()
    }

    static func undo() {

        TextEditorWrapper.undo()
    }

    static func canRedo() -> Bool {

        TextEditorWrapper.canRedo()
    }

    static func redo() {

        TextEditorWrapper.redo()
    }

    static func hasSelection() -> Bool {

        TextEditorWrapper.hasSelection()
    }

    static func copy() {

        TextEditorWrapper.copy()
    }

    static func cut() {

        TextEditorWrapper.cut()
    }

    static func remove() {

        TextEditorWrapper.remove()
    }

    static func paste() {

        TextEditorWrapper.paste()
    }

    static func selectAll() {

        TextEditorWrapper.selectAll()
    }

    static func setPallete(_ type: TextEditorWrapperPallete) {

        TextEditorWrapper.setPallete(type)
    }

    static func setText(_ text: String) {

        TextEditorWrapper.setText(text)
    }

    static func getText() -> String {

        TextEditorWrapper.getText()
    }

    static func insertText(_ text: String) {

        TextEditorWrapper.insertText(text)
    }

    static func clearErrorMarkers() {

        TextEditorWrapper.clearErrorMarkers()
    }

    static func insertErrorMarker(_ index: Int, _ text: String) {

        TextEditorWrapper.insertErrorMarker(Int32(index), text: text)
    }
}
