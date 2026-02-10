//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A container that represents a single tab within a TabBar.
public struct TabItem: GuiView, Modifiable, HasBackgroundColor, HasActiveColor, HasHoveredColor {

    public var modifiers = ViewModifiers()
    public var backgroundColor: GuiColor?
    public var activeColor: GuiColor?
    public var hoveredColor: GuiColor?

    public var text: String
    public var options: GuiTabItemConfig
    private let child: any GuiView

    public init(
        _ text: String,
        options: GuiTabItemConfig = .none,
        @GuiBuilder child: () -> any GuiView
    ) {
        self.text = text
        self.options = options
        self.child = child()
    }

    public func render() {
        withModifiers(modifiers) {
            var styleScope = StyleScope()
            styleScope.push(.tab, color: backgroundColor)
            styleScope.push(.tabActive, color: activeColor)
            styleScope.push(.tabHovered, color: hoveredColor)

            if ImGuiWrapper.beginTabItem(text, flags: options.rawValue) {
                child.render()
                ImGuiWrapper.endTabItem()
            }

            styleScope.pop()
        }
    }
}
