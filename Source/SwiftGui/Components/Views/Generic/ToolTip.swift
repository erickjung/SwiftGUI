//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class Tooltip: GuiView {

    private let child: GuiView

    public init(@GuiBuilder child: () -> GuiView) {

        self.child = child()
    }

    public func render() {

        ImGuiWrapper.beginTooltip()
        self.child.render()
        ImGuiWrapper.endTooltip()
    }
}
