//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class Button: GuiNode,
                     SizeModifier,
                     BackgroundColorModifier,
                     BorderColorModifier,
                     ActiveColorModifier,
                     HoveredColorModifier {

    public enum ButtonType {
        /// sizeable button
        case `default`

        /// small fixed size
        case small
    }

    public var size: GuiSize?
    public var backgroundColor: GuiColor?
    public var borderColor: GuiColor?
    public var activeColor: GuiColor?
    public var hoveredColor: GuiColor?

    public var text: String

    public private(set) var type: ButtonType
    private let onTap: (() -> Void)?

    public init(_ text: String,
                type: ButtonType = .default,
                onTap: (() -> Void)? = nil) {

        self.text = text
        self.type = type
        self.onTap = onTap
    }

    public override func drawComponent() {

        if let color = self.backgroundColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.button.rawValue, colorRef: color.cgColor)
        }

        if let color = self.borderColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.border.rawValue, colorRef: color.cgColor)
        }

        if let color = self.activeColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.buttonActive.rawValue, colorRef: color.cgColor)
        }

        if let color = self.hoveredColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.buttonHovered.rawValue, colorRef: color.cgColor)
        }

        switch self.type {

        case .small:

            if ImGuiWrapper.smallButton(self.text) {
                onTap?()
            }

        case .default:

            if ImGuiWrapper.button(self.text, size: self.size ?? .zero) {
                onTap?()
            }
        }

        if self.backgroundColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }

        if self.borderColor != nil {
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
