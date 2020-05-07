//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation
import SwiftGuiCore

/// Window node.
/// - parameter title: Text for node
/// - parameter options: Node options
/// - parameter child: List of child nodes
/// - returns: New node
public func Window(_ title: String,
                   options: GuiWindowConfig = .none,
                   @GuiBuilder child: () -> GuiView?) -> GuiNode {

    GuiNode(tag: #function, child: child()).onRender { child in

        if igBegin(title.cStr(), nil, options.rawValue) {

            child?.render()
        }
        igEnd()
    }
}

/// SubWindow node.
/// - parameter id: Node id
/// - parameter size: Node size
/// - parameter border: Show border
/// - parameter options: Node options
/// - parameter child: List of child nodes
/// - returns: New node
public func SubWindow(_ id: String,
                      size: GuiSize = .zero,
                      border: Bool = false,
                      options: GuiWindowConfig = .none,
                      @GuiBuilder child: () -> GuiView?) -> GuiNode {

    GuiNode(tag: #function, child: child()).onRender { child in

        if igBeginChild(id.cStr(), size.convertToVec2(), border, options.rawValue) {

            child?.render()
        }
        igEndChild()
    }
}
