//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A container view that displays a tooltip.
public struct Tooltip: GuiView {

    private let child: any GuiView

    public init(@GuiBuilder child: () -> GuiView) {
        self.child = child()
    }

    public func render() {
        ImGuiWrapper.beginTooltip()
        self.child.render()
        ImGuiWrapper.endTooltip()
    }
}
