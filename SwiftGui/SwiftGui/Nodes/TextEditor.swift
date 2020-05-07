//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation
import SwiftGuiCore

/// TextEditor node.
/// NOTE: For now you can only have one editor running on screen.
/// You must use this node with all call functions below.
/// - parameter title: Text for node
/// - parameter onChange: Callback for state changing
/// - returns: New node
public func TextEditor(_ title: String,
                       onChange: ((String) -> Void)? = nil) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        TextEditorWrapper.render(title)

        if let onChange = onChange,
            TextEditorWrapper.isTextChanged() {

            onChange(TextEditorWrapper.getText())
        }
    }
}

// Important note:
// This component does not follow the "pure" one widget - one function approach.
// Since the editor has to maintain a relatively complex and large internal state, it did not seem to be practical
// to try and enforce fully immediate mode. It stores its internal state in an object instance which is reused across frames.

public func TextEditorSetLanguageDefinitionCall(_ type: TextEditorWrapperLanguage) {

    TextEditorWrapper.setLanguageDefinition(type)
}

public func TextEditorGetTotalLinesCall() -> Int {

    Int(TextEditorWrapper.getTotalLines())
}

public func TextEditorIsOverwriteCall() -> Bool {

    TextEditorWrapper.isOverwrite()
}

public func TextEditorSetReadOnlyCall(_ value: Bool) {

    TextEditorWrapper.setReadOnly(value)
}

public func TextEditorIsReadOnlyCall() -> Bool {

    TextEditorWrapper.isReadOnly()
}

public func TextEditorSetShowWhitespacesCall(_ value: Bool) {

    TextEditorWrapper.setShowWhitespaces(value)
}

public func TextEditorIsShowingWhitespacesCall() -> Bool {

    TextEditorWrapper.isShowingWhitespaces()
}

public func TextEditorSetColorizerEnableCall(_ value: Bool) {

    TextEditorWrapper.setColorizerEnable(value)
}

public func TextEditorIsColorizerEnabledCall() -> Bool {

    TextEditorWrapper.isColorizerEnabled()
}

public func TextEditorSetTabSizeCall(_ value: Int) {

    TextEditorWrapper.setTabSize(Int32(value))
}

public func TextEditorGetTabSizeCall() -> Int {

    Int(TextEditorWrapper.getTabSize())
}

public func TextEditorCanUndoCall() -> Bool {

    TextEditorWrapper.canUndo()
}

public func TextEditorUndoCall() {

    TextEditorWrapper.undo()
}

public func TextEditorCanRedoCall() -> Bool {

    TextEditorWrapper.canRedo()
}

public func TextEditorRedoCall() {

    TextEditorWrapper.redo()
}

public func TextEditorHasSelectionCall() -> Bool {

    TextEditorWrapper.hasSelection()
}

public func TextEditorCopyCall() {

    TextEditorWrapper.copy()
}

public func TextEditorCutCall() {

    TextEditorWrapper.cut()
}

public func TextEditorRemoveCall() {

    TextEditorWrapper.remove()
}

public func TextEditorPasteCall() {

    TextEditorWrapper.paste()
}

public func TextEditorSelectAllCall() {

    TextEditorWrapper.selectAll()
}

public func TextEditorSetPalleteCall(_ type: TextEditorWrapperPallete) {

    TextEditorWrapper.setPallete(type)
}

public func TextEditorSetTextCall(_ text: String) {

    TextEditorWrapper.setText(text)
}

public func TextEditorGetTextCall() -> String {

    TextEditorWrapper.getText()
}

public func TextEditorInsertTextCall(_ text: String) {

    TextEditorWrapper.insertText(text)
}

public func TextEditorClearErrorMarkersCall() {

    TextEditorWrapper.clearErrorMarkers()
}

public func TextEditorInsertErrorMarkerCall(_ index: Int, _ text: String) {

    TextEditorWrapper.insertErrorMarker(Int32(index), text: text)
}
