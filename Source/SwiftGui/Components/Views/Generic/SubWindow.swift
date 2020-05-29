//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class SubWindow: GuiNode,
                        SizeModifier {

    public var size: GuiSize?

    public var border: Bool
    public var options: GuiWindowConfig

    private let child: GuiView

    public init(border: Bool = false,
                options: GuiWindowConfig = .none,
                @GuiBuilder child: () -> GuiView) {

        self.border = border
        self.options = options
        self.child = child()
    }

    public override func drawComponent() {

        if ImGuiWrapper.beginChild(self.id ?? "##subwindow",
                                   size: self.size ?? .zero,
                                   border: self.border,
                                   flags: self.options.rawValue) {

            self.child.render()
        }
        ImGuiWrapper.endChild()
    }
}
