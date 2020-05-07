//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation
import SwiftGuiCore

/// Dock node.
/// NOTE: Still experimental
/// - parameter child: List of nodes
/// - returns: New node
public func Dock(@GuiBuilder child: () -> GuiView?) -> GuiNode {

    GuiNode(tag: #function, child: child()).onRender { child in

        let dockFlags: GuiDockConfig = .autoHideTabBar

        if let mainViewPort = igGetMainViewport() {

            igSetNextWindowPos(mainViewPort.pointee.Pos, 0, ImVec2(x: 0, y: 0))
            igSetNextWindowSize(mainViewPort.pointee.Size, 0)
            igSetNextWindowViewport(mainViewPort.pointee.ID)
        }

        let windowFlags: GuiWindowConfig = [.noTitleBar, .noCollapse, .noResize, .noMove, .noBringToFrontOnFocus, .noNavFocus]
        if igBegin("dock".cStr(), nil, windowFlags.rawValue) {

            let dockId = igGetIDStr("dockSpaceID".cStr())
            igDockSpace(dockId, ImVec2(x: 0, y: 0), dockFlags.rawValue, nil)

            child?.render()
        }
        igEnd()
    }
}
