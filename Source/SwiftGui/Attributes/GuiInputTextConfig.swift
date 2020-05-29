//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// OptionSet with flags for text inputs.
/// Represents: `ImGuiInputTextFlags`.
public struct GuiInputTextConfig: OptionSet {

    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    public static let none                = GuiInputTextConfig([])

    /// Allow 0123456789.+-*/
    public static let charsDecimal        = GuiInputTextConfig(rawValue: 1 << 0)

    /// Allow 0123456789ABCDEFabcdef
    public static let charsHexadecimal    = GuiInputTextConfig(rawValue: 1 << 1)

    /// Turn a..z into A..Z
    public static let charsUppercase      = GuiInputTextConfig(rawValue: 1 << 2)

    /// Filter out spaces, tabs
    public static let charsNoBlank        = GuiInputTextConfig(rawValue: 1 << 3)

    /// Select entire text when first taking mouse focus
    public static let autoSelectAll       = GuiInputTextConfig(rawValue: 1 << 4)

    /// Return 'true' when Enter is pressed (as opposed to every time the value was modified). Consider looking at the IsItemDeactivatedAfterEdit() function.
    public static let enterReturnsTrue    = GuiInputTextConfig(rawValue: 1 << 5)

    /// Callback on pressing TAB (for completion handling)
    public static let callbackCompletion  = GuiInputTextConfig(rawValue: 1 << 6)

    /// Callback on pressing Up/Down arrows (for history handling)
    public static let callbackHistory     = GuiInputTextConfig(rawValue: 1 << 7)

    /// Callback on each iteration. User code may query cursor position, modify text buffer.
    public static let callbackAlways      = GuiInputTextConfig(rawValue: 1 << 8)

    /// Callback on character inputs to replace or discard them. Modify 'EventChar' to replace or discard, or return 1 in callback to discard.
    public static let callbackCharFilter  = GuiInputTextConfig(rawValue: 1 << 9)

    /// Pressing TAB input a '\t' character into the text field
    public static let allowTabInput       = GuiInputTextConfig(rawValue: 1 << 10)

    /// In multi-line mode, unfocus with Enter, add new line with Ctrl+Enter (default is opposite: unfocus with Ctrl+Enter, add line with Enter).
    public static let ctrlEnterForNewLine = GuiInputTextConfig(rawValue: 1 << 11)

    /// Disable following the cursor horizontally
    public static let noHorizontalScroll  = GuiInputTextConfig(rawValue: 1 << 12)

    /// Insert modes
    public static let alwaysInsertMode    = GuiInputTextConfig(rawValue: 1 << 13)

    /// Read-only mode
    public static let readOnly            = GuiInputTextConfig(rawValue: 1 << 14)

    /// Password mode, display all characters as '*'
    public static let password            = GuiInputTextConfig(rawValue: 1 << 15)

    /// Disable undo/redo. Note that input text owns the text data while active, if you want to provide your own undo/redo stack you need e.g. to call ClearActiveID().
    public static let noUndoRedo          = GuiInputTextConfig(rawValue: 1 << 16)

    /// Allow 0123456789.+-*/eE (Scientific notation input)
    public static let charsScientific     = GuiInputTextConfig(rawValue: 1 << 17)

    /// Callback on buffer capacity changes request (beyond 'buf_size' parameter value), allowing the string to grow.
    /// Notify when the string wants to be resized (for string types which hold a cache of their Size).
    /// You will be provided a new BufSize in the callback and NEED to honor it.
    public static let callbackResize      = GuiInputTextConfig(rawValue: 1 << 18)
}
