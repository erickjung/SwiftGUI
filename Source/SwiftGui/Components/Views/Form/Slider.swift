//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class Slider: GuiNode,
                     BackgroundColorModifier,
                     ActiveColorModifier,
                     HoveredColorModifier,
                     SelectionColorModifier {

    public var backgroundColor: GuiColor?
    public var activeColor: GuiColor?
    public var hoveredColor: GuiColor?
    public var selectionColor: GuiColor?

    public var label: String
    public var valueState: Float
    public var min: Float
    public var max: Float
    public var format: String

    private let onChange: ((Float) -> Void)?

    public init(label: String = "",
                valueState: Float,
                min: Float,
                max: Float,
                format: String = "%.3f",
                onChange: ((Float) -> Void)? = nil) {

        self.label = label
        self.valueState = valueState
        self.min = min
        self.max = max
        self.format = format
        self.onChange = onChange
    }

    public override func drawComponent() {

        if let color = self.backgroundColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.frameBg.rawValue, colorRef: color.cgColor)
        }

        if let color = self.hoveredColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.frameBgHovered.rawValue, colorRef: color.cgColor)
        }

        if let color = self.activeColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.sliderGrabActive.rawValue, colorRef: color.cgColor)
        }

        if let color = self.selectionColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.sliderGrab.rawValue, colorRef: color.cgColor)
        }

        var _value = valueState
        if ImGuiWrapper.sliderFloat(self.label,
                                    value: &_value,
                                    min: self.min,
                                    max: self.max,
                                    format: self.format,
                                    power: 1.0) {

            if _value != valueState {

                onChange?(_value)
            }
        }

        if self.backgroundColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }

        if self.hoveredColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }

        if self.activeColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }

        if self.selectionColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }
    }
}
