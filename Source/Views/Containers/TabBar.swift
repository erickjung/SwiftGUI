//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A container that displays content in a tabbed interface.
public struct TabBar: GuiView, Modifiable, HasBackgroundColor, HasActiveColor, HasHoveredColor {

    public var modifiers = ViewModifiers()
    public var backgroundColor: GuiColor?
    public var activeColor: GuiColor?
    public var hoveredColor: GuiColor?

    public var options: GuiTabBarConfig
    private let child: any GuiView

    public init(
        options: GuiTabBarConfig = .none,
        @GuiBuilder child: () -> any GuiView
    ) {
        self.options = options
        self.child = child()
    }

    public func render() {
        withModifiers(modifiers) {
            var styleScope = StyleScope()
            styleScope.push(.tab, color: backgroundColor)
            styleScope.push(.tabActive, color: activeColor)
            styleScope.push(.tabHovered, color: hoveredColor)

            if ImGuiWrapper.beginTabBar(modifiers.id ?? "##tabbar", flags: options.rawValue) {
                child.render()
                ImGuiWrapper.endTabBar()
            }

            styleScope.pop()
        }
    }
}
