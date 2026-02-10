//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A menu bar that contains menu groups.
public struct MenuBar: GuiView, Modifiable, HasBackgroundColor, HasHoveredColor {

    public var modifiers = ViewModifiers()
    public var backgroundColor: GuiColor?
    public var hoveredColor: GuiColor?

    private let child: any GuiView

    public init(@GuiBuilder child: () -> GuiView) {
        self.child = child()
    }

    public func render() {
        withModifiers(modifiers) {
            var styleScope = StyleScope()

            styleScope.push(.menuBarBg, color: backgroundColor)
            styleScope.push(.headerHovered, color: hoveredColor)

            if ImGuiWrapper.beginMenuBar() {
                child.render()
                ImGuiWrapper.endMenuBar()
            }

            styleScope.pop()
        }
    }
}
