//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// MenuBar node.
/// - parameter child: List of child nodes
/// - returns: New node
public func MenuBar(@GuiBuilder child: () -> GuiView?) -> GuiNode {

    GuiNode(tag: #function, child: child()).onRender { child in

        if ImGuiWrapper.beginMenuBar() {

            child?.render()
            ImGuiWrapper.endMenuBar()
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

        if ImGuiWrapper.beginMenu(title, enabled: enabled) {

            child?.render()
            ImGuiWrapper.endMenu()
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

        if ImGuiWrapper.menuItem(title, shortcut: shortcut, selected: selected, enabled: enabled) {
            onTap?()
        }
    }
}
