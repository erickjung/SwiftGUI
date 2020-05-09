//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// Button node.
/// - parameter title: Text for node
/// - parameter size: Size for node
/// - parameter onTap: Callback for node tap
/// - returns: New node
public func Button(_ title: String,
                   size: GuiSize = .zero,
                   onTap: (() -> Void)? = nil) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        if ImGuiWrapper.button(title, size: size) {
            onTap?()
        }
    }
}

/// Small Button node.
/// - parameter title: Text for node
/// - parameter onTap: Callback for node tap
/// - returns: New node
public func SmallButton(_ title: String,
                        onTap: (() -> Void)? = nil) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        if ImGuiWrapper.smallButton(title) {
            onTap?()
        }
    }
}

/// Arrow Button node.
/// - parameter id: Node id
/// - parameter direction: Arrow direction
/// - parameter onTap: Callback for node tap
/// - returns: New node
public func ArrowButton(_ id: String,
                        direction: GuiDirection,
                        onTap: (() -> Void)? = nil) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        if ImGuiWrapper.arrowButton(id, dir: direction.rawValue) {
            onTap?()
        }
    }
}

/// Push Button Group node.
/// - parameter loop: If true, Button functions return repeated true in a typematic manner
/// - parameter child: List of child nodes
/// - returns: New node
public func PushButtonGroup(loop: Bool = true,
                            @GuiBuilder child: () -> GuiView?) -> GuiNode {

    GuiNode(tag: #function, child: child()).onRender { child in

        ImGuiWrapper.pushButtonRepeat(loop)
        child?.render()
        ImGuiWrapper.popButtonRepeat()
    }
}

/// Bullet Button node.
/// - returns: New node
public func Bullet() -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        ImGuiWrapper.bullet()
    }
}
