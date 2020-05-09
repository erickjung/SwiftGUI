//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation
//import SwiftGuiCore

/// InputText node.
/// - parameter title: Text for node
/// - parameter textState: Current text state
/// - parameter placeHolder: Input placeholder
/// - parameter maxLength: Max length
/// - parameter options: Node options
/// - parameter onChange: Callback for state changing
/// - returns: New node
public func InputText(_ title: String = "",
                      textState: String,
                      placeHolder: String? = nil,
                      maxLength: Int = 256,
                      options: GuiInputTextConfig = .none,
                      onChange: ((String) -> Void)? = nil) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        var _value = textState.cChars(with: maxLength)

        if let placeHolder = placeHolder {

            if ImGuiWrapper.inputText(withHint: title, hint: placeHolder, buffer: &_value, bufferSize: Int32(maxLength), flags: options.rawValue) {
                onChange?(String(cString: _value))
            }

        } else {

            if ImGuiWrapper.inputText(title, buffer: &_value, bufferSize: Int32(maxLength), flags: options.rawValue) {
                onChange?(String(cString: _value))
            }
        }
    }
}

/// InputTextMultiline node.
/// - parameter id: Node id
/// - parameter textState: Current text state
/// - parameter size: Input size
/// - parameter options: Node options
/// - parameter onChange: Callback for state changing
/// - returns: New node
public func InputTextMultiline(id: String,
                               textState: String,
                               size: GuiSize = .zero,
                               options: GuiInputTextConfig = .none,
                               onChange: ((String) -> Void)? = nil) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        var _value = textState.cChars(with: textState.count + 2048)
        if ImGuiWrapper.inputTextMultiline(id, buffer: &_value, bufferSize: Int32(_value.count), size: size, flags: options.rawValue) {

            onChange?(String(cString: _value))
        }
    }
}

/// InputFloat node.
/// This will show an input field for float values
/// - parameter title: Text for node
/// - parameter valueState: Current float state
/// - parameter step: Incremental number for normal tap
/// - parameter stepFast: Incremental number for holding tap
/// - parameter format: Number format
/// - parameter options: Node options
/// - parameter onChange: Callback for state changing
/// - returns: New node
public func InputFloat(_ title: String,
                       valueState: Float,
                       step: Float = 0,
                       stepFast: Float = 0,
                       format: String,
                       options: GuiInputTextConfig = .none,
                       onChange: ((Float) -> Void)? = nil) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        var _value = Float32(valueState)
        if ImGuiWrapper.inputFloat(title, v: &_value, step: step, stepFast: stepFast, format: format, flags: options.rawValue) {
            onChange?(Float(_value))
        }
    }
}

/// InputInt node.
/// This will show an input field for int values
/// - parameter title: Text for node
/// - parameter valueState: Current number state
/// - parameter step: Incremental number for normal tap
/// - parameter stepFast: Incremental number for holding tap
/// - parameter options: Node options
/// - parameter onChange: Callback for state changing
/// - returns: New node
public func InputInt(_ title: String,
                     valueState: Int,
                     step: Int = 1,
                     stepFast: Int = 100,
                     options: GuiInputTextConfig = .none,
                     onChange: ((Int) -> Void)? = nil) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        var _value = Int32(valueState)
        if ImGuiWrapper.inputInt(title, v: &_value, step: Int32(step), stepFast: Int32(stepFast), flags: options.rawValue) {
            onChange?(Int(_value))
        }
    }
}
