//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// Tooltip node.
/// This can be used with onHover and others nodes to show a tooltip effect.
/// - parameter child: List of child nodes
/// - returns: New node
public func Tooltip(@GuiBuilder child: () -> GuiView?) -> GuiNode {

    GuiNode(tag: #function, child: child()).onRender { child in

        ImGuiWrapper.beginTooltip()
        child?.render()
        ImGuiWrapper.endTooltip()
    }
}
