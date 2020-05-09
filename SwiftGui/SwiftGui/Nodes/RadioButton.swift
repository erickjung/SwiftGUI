//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation
//import SwiftGuiCore

/// RadioButton node.
/// - parameter title: Text for node
/// - parameter activeState: Active state
/// - parameter onChange: Callback for state changing
/// - returns: New node
public func RadioButton(_ title: String,
                        activeState: Bool,
                        onChange: (() -> Void)? = nil) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        if ImGuiWrapper.radioButton(title, active: activeState) {
            onChange?()
        }
    }
}

/// RadioButtonGroup node.
/// - parameter values: List of text values
/// - parameter selectedState: Selected item state
/// - parameter onChange: Callback for state changing
/// - returns: New node
public func RadioButtonGroup(_ values: [String],
                             selectedState: Int,
                             onChange: ((Int) -> Void)? = nil) -> GuiView {

    func RadioButtonSequential(_ title: String,
                               selectedState: Int,
                               order: Int,
                               onChange: ((Int) -> Void)? = nil) -> GuiNode {

        GuiNode(tag: #function).onRender { _ in

            var _value = Int32(selectedState)
            if ImGuiWrapper.radioButton(title, value: &_value, vButton: Int32(order)) {

                if _value != selectedState {

                    onChange?(Int(_value))
                }
            }
        }
    }

    var list = [GuiView]()
    for (index, element) in values.enumerated() {

        list.append(RadioButtonSequential(element, selectedState: selectedState, order: index, onChange: onChange))
    }

    return GuiNodeList(children: list)
}
