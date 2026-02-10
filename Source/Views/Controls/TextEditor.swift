//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A control that provides a rich text editing interface with syntax highlighting.
public struct TextEditor: GuiView, Modifiable {

    public var modifiers = ViewModifiers()

    public let text: Binding<String>

    public init(_ text: Binding<String>) {
        self.text = text
    }

    public func render() {
        withModifiers(modifiers) {
            TextEditorWrapper.render(text.wrappedValue)

            if TextEditorWrapper.isTextChanged() {
                text.wrappedValue = TextEditorWrapper.getText()
            }
        }
    }
}

// MARK: - Static Configuration API
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
