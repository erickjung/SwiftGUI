//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation
import SwiftGuiCore

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

            if igInputTextWithHint(title.cStr(), placeHolder, &_value, maxLength, options.rawValue, nil, nil) {
                onChange?(String(cString: _value))
            }

        } else {
            
            if igInputText(title.cStr(), &_value, maxLength, options.rawValue, nil, nil) {
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
        if igInputTextMultiline(id.cStr(), &_value, _value.count, size.convertToVec2(), options.rawValue, { (data) -> Int32 in

            return 0

        }, nil) {

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
        if igInputFloat(title.cStr(), &_value, step, stepFast, format, options.rawValue) {
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
        if igInputInt(title.cStr(), &_value, Int32(step), Int32(stepFast), options.rawValue) {
            onChange?(Int(_value))
        }
    }
}
