//
//  InputTextFlags.swift
//  SwiftGui
//
//  Created by Erick Jung on 07/05/2020.
//  Copyright © 2020 Erick Jung. All rights reserved.
//

import SwiftGuiCore

public struct ImGuiInputTextFlags: OptionSet {

    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    public static let none                = ImGuiInputTextFlags(rawValue: 0)
    public static let charsDecimal        = ImGuiInputTextFlags(rawValue: 1 << 0)   // Allow 0123456789.+-*/
    public static let charsHexadecimal    = ImGuiInputTextFlags(rawValue: 1 << 1)   // Allow 0123456789ABCDEFabcdef
    public static let charsUppercase      = ImGuiInputTextFlags(rawValue: 1 << 2)   // Turn a..z into A..Z
    public static let charsNoBlank        = ImGuiInputTextFlags(rawValue: 1 << 3)   // Filter out spaces, tabs
    public static let autoSelectAll       = ImGuiInputTextFlags(rawValue: 1 << 4)   // Select entire text when first taking mouse focus
    public static let enterReturnsTrue    = ImGuiInputTextFlags(rawValue: 1 << 5)   // Return 'true' when Enter is pressed (as opposed to every time the value was modified). Consider looking at the IsItemDeactivatedAfterEdit() function.
    public static let callbackCompletion  = ImGuiInputTextFlags(rawValue: 1 << 6)   // Callback on pressing TAB (for completion handling)
    public static let callbackHistory     = ImGuiInputTextFlags(rawValue: 1 << 7)   // Callback on pressing Up/Down arrows (for history handling)
    public static let callbackAlways      = ImGuiInputTextFlags(rawValue: 1 << 8)   // Callback on each iteration. User code may query cursor position, modify text buffer.
    public static let callbackCharFilter  = ImGuiInputTextFlags(rawValue: 1 << 9)   // Callback on character inputs to replace or discard them. Modify 'EventChar' to replace or discard, or return 1 in callback to discard.
    public static let allowTabInput       = ImGuiInputTextFlags(rawValue: 1 << 10)  // Pressing TAB input a '\t' character into the text field
    public static let ctrlEnterForNewLine = ImGuiInputTextFlags(rawValue: 1 << 11)  // In multi-line mode, unfocus with Enter, add new line with Ctrl+Enter (default is opposite: unfocus with Ctrl+Enter, add line with Enter).
    public static let noHorizontalScroll  = ImGuiInputTextFlags(rawValue: 1 << 12)  // Disable following the cursor horizontally
    public static let alwaysInsertMode    = ImGuiInputTextFlags(rawValue: 1 << 13)  // Insert mode
    public static let readOnly            = ImGuiInputTextFlags(rawValue: 1 << 14)  // Read-only mode
    public static let password            = ImGuiInputTextFlags(rawValue: 1 << 15)  // Password mode, display all characters as '*'
    public static let noUndoRedo          = ImGuiInputTextFlags(rawValue: 1 << 16)  // Disable undo/redo. Note that input text owns the text data while active, if you want to provide your own undo/redo stack you need e.g. to call ClearActiveID().
    public static let charsScientific     = ImGuiInputTextFlags(rawValue: 1 << 17)  // Allow 0123456789.+-*/eE (Scientific notation input)
    public static let callbackResize      = ImGuiInputTextFlags(rawValue: 1 << 18)  // Callback on buffer capacity changes request (beyond 'buf_size' parameter value), allowing the string to grow. Notify when the string wants to be resized (for string types which hold a cache of their Size). You will be provided a new BufSize in the callback and NEED to honor it. (see misc/cpp/imgui_stdlib.h for an example of using this)
}
