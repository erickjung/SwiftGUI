//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation
import SwiftGuiCore

/// SliderFloat node.
/// - parameter title: Text for node
/// - parameter valueState: Value state
/// - parameter min: Min slider value
/// - parameter max: Max slider value
/// - parameter format: Data format
/// - parameter onChange: Callback for state changing
/// - returns: New node
public func SliderFloat(_ title: String,
                        valueState: Float,
                        min: Float,
                        max: Float,
                        format: String = "%.3f",
                        onChange: ((Float) -> Void)? = nil) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        var _value = valueState
        if igSliderFloat(title, &_value, min, max, format, 1.0) {

            if _value != valueState {

                onChange?(_value)
            }
        }
    }
}
