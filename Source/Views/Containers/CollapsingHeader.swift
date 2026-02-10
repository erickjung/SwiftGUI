//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A container with a collapsible header that shows or hides its content.
public struct CollapsingHeader: GuiView, Modifiable, HasBackgroundColor, HasActiveColor, HasHoveredColor {

    public var modifiers = ViewModifiers()
    public var backgroundColor: GuiColor?
    public var activeColor: GuiColor?
    public var hoveredColor: GuiColor?

    public var text: String
    public var options: GuiTreeConfig
    private let child: any GuiView

    public init(
        _ text: String,
        options: GuiTreeConfig = .none,
        @GuiBuilder child: () -> any GuiView
    ) {
        self.text = text
        self.options = options
        self.child = child()
    }

    public func render() {
        withModifiers(modifiers) {
            var styleScope = StyleScope()
            styleScope.push(.header, color: backgroundColor)
            styleScope.push(.headerActive, color: activeColor)
            styleScope.push(.headerHovered, color: hoveredColor)

            if ImGuiWrapper.collapsingHeader(text, flags: options.rawValue) {
                child.render()
            }

            styleScope.pop()
        }
    }
}
