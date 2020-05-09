//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation
//import SwiftGuiCore

/// CheckBox node.
/// - parameter title: Text for node
/// - parameter id: Node id
/// - parameter selectedState: Selected state
/// - parameter onChange: Callback for state changing
/// - returns: New node
public func CheckBox(_ title: String = "",
                     id: String? = nil,
                     selectedState: Bool,
                     onChange: ((Bool) -> Void)? = nil) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        var _value = selectedState

        if let id = id {

            ImGuiWrapper.pushID(id)

            if ImGuiWrapper.checkbox(title, value: &_value) {

                if _value != selectedState {

                    onChange?(_value)
                }
            }

            ImGuiWrapper.popID()

        } else {

            if ImGuiWrapper.checkbox(title, value: &_value) {

                if _value != selectedState {

                    onChange?(_value)
                }
            }
        }
    }
}
