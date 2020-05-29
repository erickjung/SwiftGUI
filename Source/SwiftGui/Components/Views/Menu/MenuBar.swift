//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class MenuBar: GuiNode,
                      BackgroundColorModifier,
                      HoveredColorModifier {

    public var backgroundColor: GuiColor?
    public var hoveredColor: GuiColor?

    private let child: GuiView

    public init(@GuiBuilder child: () -> GuiView) {

        self.child = child()
    }

    public override func drawComponent() {

        if let color = self.backgroundColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.menuBarBg.rawValue, colorRef: color.cgColor)
        }

        if let color = self.hoveredColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.headerHovered.rawValue, colorRef: color.cgColor)
        }

        if ImGuiWrapper.beginMenuBar() {

            child.render()
            ImGuiWrapper.endMenuBar()
        }

        if self.backgroundColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }

        if self.hoveredColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }
    }
}
