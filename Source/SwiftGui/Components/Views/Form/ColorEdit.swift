//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class ColorEdit: GuiNode,
                        BackgroundColorModifier,
                        HoveredColorModifier {

    public var backgroundColor: GuiColor?
    public var hoveredColor: GuiColor?
    public var colorState: GuiColor

    private let onChange: ((GuiColor) -> Void)?

    public init(colorState: GuiColor,
                onChange: ((GuiColor) -> Void)? = nil) {

        self.colorState = colorState
        self.onChange = onChange
    }

    public override func drawComponent() {

        if let color = self.backgroundColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.frameBg.rawValue, colorRef: color.cgColor)
            ImGuiWrapper.pushStyleColor(GuiColorProperty.popupBg.rawValue, colorRef: color.cgColor)
        }

        if let color = self.hoveredColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.frameBgHovered.rawValue, colorRef: color.cgColor)
        }

        var _color = self.colorState.convertToFloats()
        if ImGuiWrapper.colorEdit3(self.id ?? "##coloredit", color: &_color, flags: 0) {

            if let onChange = onChange {

                onChange(GuiColor(r: _color[0], g: _color[1], b: _color[2], a: 1.0))
            }
        }

        if self.backgroundColor != nil {
            ImGuiWrapper.popStyleColor(2)
        }

        if self.hoveredColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }
    }
}
