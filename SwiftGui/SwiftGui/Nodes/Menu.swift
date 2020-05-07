//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation
import SwiftGuiCore

/// MenuBar node.
/// - parameter child: List of child nodes
/// - returns: New node
public func MenuBar(@GuiBuilder child: () -> GuiView?) -> GuiNode {

    GuiNode(tag: #function, child: child()).onRender { child in

        if igBeginMenuBar() {

            child?.render()
            igEndMenuBar()
        }
    }
}

/// MenuGroup node.
/// - parameter title: Text for node
/// - parameter enabled: Enable/Disable node
/// - parameter child: List of child nodes
/// - returns: New node
public func MenuGroup(_ title: String,
                      enabled: Bool = true,
                      @GuiBuilder child: () -> GuiView?) -> GuiNode {

    GuiNode(tag: #function, child: child()).onRender { child in

        if igBeginMenu(title.cStr(), enabled) {

            child?.render()
            igEndMenu()
        }
    }
}

/// MenuItem node.
/// - parameter title: Text for node
/// - parameter shortcut: Shortcut helper text
/// - parameter selected: Select/Unselect node
/// - parameter enabled: Enable/Disable node
/// - parameter onTap: Callback for node tap
/// - returns: New node
public func MenuItem(_ title: String,
                     shortcut: String? = nil,
                     selected: Bool = false,
                     enabled: Bool = true,
                     onTap: (() -> Void)? = nil) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        if igMenuItemBool(title.cStr(), shortcut, selected, enabled) {
            onTap?()
        }
    }
}
