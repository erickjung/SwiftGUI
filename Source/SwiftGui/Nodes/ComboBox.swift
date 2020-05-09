//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// ComboBox node.
/// - parameter title: Text for node
/// - parameter currentItemState: Current selected item state
/// - parameter items: List of items
/// - parameter onChange: Callback for state changing
/// - returns: New node
public func ComboBox(_ title: String = "",
                     currentItemState: Int,
                     items: [String],
                     onChange: ((Int) -> Void)? = nil) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        var _currentItem = Int32(currentItemState)
        if ImGuiWrapper.combo(title, currentItem: &_currentItem, items: items.map { $0 }, popupMaxHeightItems: -1) {

            if _currentItem != currentItemState {

                onChange?(Int(_currentItem))
            }
        }
    }
}
