//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A layout view that arranges child views horizontally.
public struct HStack: GuiView {

    public let spacing: Float
    private let child: any GuiView

    public init(spacing: Float = -1.0,
                @GuiBuilder child: () -> GuiView) {
        self.spacing = spacing
        self.child = child()
    }

    public func render() {
        guard let multi = child as? GuiNodeList else {
            child.render()
            return
        }

        multi.children.forEach {
            ImGuiWrapper.beginGroup()
            $0.render()
            ImGuiWrapper.endGroup()
            ImGuiWrapper.sameLine(0.0, spacing: self.spacing)
        }

        ImGuiWrapper.newLine()
    }
}
