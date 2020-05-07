//
//  TextEditor.swift
//  SwiftGui
//
//  Created by Erick Jung on 05/02/2020.
//  Copyright © 2020 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGuiCore

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
