//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class TabBar: GuiNode,
                     BackgroundColorModifier,
                     ActiveColorModifier,
                     HoveredColorModifier {

    public var backgroundColor: GuiColor?
    public var activeColor: GuiColor?
    public var hoveredColor: GuiColor?

    public var options: GuiTabBarConfig

    private let child: GuiView

    public init(options: GuiTabBarConfig = .none,
                @GuiBuilder child: () -> GuiView) {

        self.options = options
        self.child = child()
    }

    public override func drawComponent() {

        if let color = self.backgroundColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.tab.rawValue, colorRef: color.cgColor)
        }

        if let color = self.activeColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.tabActive.rawValue, colorRef: color.cgColor)
        }

        if let color = self.hoveredColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.tabHovered.rawValue, colorRef: color.cgColor)
        }

        if ImGuiWrapper.beginTabBar(self.id ?? "##tabbar", flags: self.options.rawValue) {

            self.child.render()
            ImGuiWrapper.endTabBar()
        }

        if self.backgroundColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }

        if self.activeColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }

        if self.hoveredColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }
    }
}
