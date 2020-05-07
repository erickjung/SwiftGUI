//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation
import SwiftGuiCore

/// Drag node.
/// This will show a draggable number field
/// - parameter title: Text for node
/// - parameter valueState: Current value state
/// - parameter speed: Drag changing speed
/// - parameter min: Min value
/// - parameter max: Max value
/// - parameter format: Data format
/// - parameter onChange: Callback for state changing
/// - returns: New node
public func Drag(_ title: String,
                 valueState: Int,
                 speed: Float = 1.0,
                 min: Int = 0,
                 max: Int = 0,
                 format: String = "%d",
                 onChange: ((Int) -> Void)? = nil) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        var _value = Int32(valueState)
        if igDragInt(title.cStr(), &_value, speed, Int32(min), Int32(max), format) {
            
            if _value != valueState {
                
                onChange?(Int(_value))
            }
        }
    }
}
