//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A button control that triggers an action when tapped.
public struct Button: GuiView, Modifiable, HasSize, HasBackgroundColor, HasBorderColor, HasActiveColor, HasHoveredColor {

    public enum ButtonType {
        /// Sizeable button
        case `default`

        /// Small fixed size
        case small
    }

    public var modifiers = ViewModifiers()
    public var size: GuiSize?
    public var backgroundColor: GuiColor?
    public var borderColor: GuiColor?
    public var activeColor: GuiColor?
    public var hoveredColor: GuiColor?

    public var text: String
    public let type: ButtonType
    private let onTap: (() -> Void)?

    public init(_ text: String,
                type: ButtonType = .default,
                onTap: (() -> Void)? = nil) {
        self.text = text
        self.type = type
        self.onTap = onTap
    }

    public func render() {
        withModifiers(modifiers) {
            var styleScope = StyleScope()

            styleScope.push(.button, color: backgroundColor)
            styleScope.push(.border, color: borderColor)
            styleScope.push(.buttonActive, color: activeColor)
            styleScope.push(.buttonHovered, color: hoveredColor)

            switch type {
            case .small:
                if ImGuiWrapper.smallButton(text) {
                    onTap?()
                }

            case .default:
                if ImGuiWrapper.button(text, size: size ?? .zero) {
                    onTap?()
                }
            }

            styleScope.pop()
        }
    }
}
