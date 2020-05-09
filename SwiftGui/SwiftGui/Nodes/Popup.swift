//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// Popup node.
/// NOTE: This node should be used with PopupOpenCall and PopupCloseCall
/// - parameter id: Node id
/// - parameter options: Node options
/// - parameter child: List of child nodes
/// - returns: New node
public func Popup(id: String,
                  options: GuiWindowConfig = .none,
                  @GuiBuilder child: () -> GuiView?) -> GuiNode {

    GuiNode(tag: #function, child: child()).onRender { child in

        if ImGuiWrapper.beginPopup(id, flags: options.rawValue) {

            child?.render()

            ImGuiWrapper.endPopup()
        }
    }
}

/// PopupOpenCall function.
/// - parameter id: Should be same id used by Popup node
public func PopupOpenCall(_ id: String) {

    ImGuiWrapper.openPopup(id)
}

/// PopupCloseCall function.
/// NOTE: This will close any popup opened
public func PopupCloseCall() {

    ImGuiWrapper.closeCurrentPopup()
}
