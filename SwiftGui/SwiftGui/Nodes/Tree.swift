//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation
import SwiftGuiCore

/// Tree node.
/// - parameter title: Text for node
/// - parameter options: Node options
/// - parameter child: List of child nodes
/// - returns: New node
public func Tree(_ title: String,
                 options: GuiTreeConfig = .none,
                 @GuiBuilder child: () -> GuiView?) -> GuiNode {

    GuiNode(tag: #function, child: child()).onRender { child in

        if igTreeNodeExStr(title.cStr(), options.rawValue) {

            child?.render()
            igTreePop()
        }
    }
}

/// CollapsingHeader node.
/// - parameter title: Text for node
/// - parameter options: Node options
/// - parameter child: List of child nodes
/// - returns: New node
public func CollapsingHeader(_ title: String,
                             options: GuiTreeConfig = .none,
                             @GuiBuilder child: () -> GuiView?) -> GuiNode {

    GuiNode(tag: #function, child: child()).onRender { child in

        if igCollapsingHeader(title.cStr(), options.rawValue) {

            child?.render()
        }
    }
}

/// CollapsingHeaderClosable node.
/// - parameter title: Text for node
/// - parameter closeState: Close state
/// - parameter options: Node options
/// - parameter onClose: Callback for close state changing
/// - parameter child: List of child nodes
/// - returns: New node
public func CollapsingHeaderClosable(_ title: String,
                                     closeState: Bool = false,
                                     options: GuiTreeConfig = .none,
                                     onClose: ((Bool) -> Void)? = nil,
                                     @GuiBuilder child: () -> GuiView?) -> GuiNode {

    GuiNode(tag: #function, child: child()).onRender { child in

        var _value = closeState
        if igCollapsingHeaderBoolPtr(title, &_value, options.rawValue) {

            child?.render()
        }
        onClose?(_value)
    }
}
