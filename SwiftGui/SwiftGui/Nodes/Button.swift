//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation
import SwiftGuiCore

/// Button node.
/// - parameter title: Text for node
/// - parameter size: Size for node
/// - parameter onTap: Callback for node tap
/// - returns: New node
public func Button(_ title: String,
                   size: GuiSize = .zero,
                   onTap: (() -> Void)? = nil) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        if igButton(title.cStr(), size.convertToVec2()) {
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

        if igSmallButton(title.cStr()) {
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

        if igArrowButton(id.cStr(), direction.rawValue) {
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

        igPushButtonRepeat(loop)
        child?.render()
        igPopButtonRepeat()
    }
}

/// Bullet Button node.
/// - returns: New node
public func Bullet() -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        igBullet()
    }
}

/// Selectable node.
/// A selectable highlights when hovered.
/// - parameter title: Text for node
/// - parameter selectedState: Select state
/// - parameter size: Size for node
/// - parameter options: Options for node
/// - parameter onChange: Callback for state changing
/// - returns: New node
public func Selectable(_ title: String,
                       selectedState: Bool = false,
                       size: GuiSize = .zero,
                       options: GuiSelectable = .none,
                       onChange: ((Bool) -> Void)? = nil) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        var _value = selectedState
        if igSelectableBoolPtr(title.cStr(), &_value, options.rawValue, size.convertToVec2()) {
            onChange?(_value)
        }
    }
}
