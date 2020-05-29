//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class Drag: GuiNode,
                   BackgroundColorModifier,
                   HoveredColorModifier {

    public var backgroundColor: GuiColor?
    public var hoveredColor: GuiColor?

    public var label: String
    public var valueState: Int
    public var speed: Float
    public var min: Int
    public var max: Int
    public var format: String

    private let onChange: ((Int) -> Void)?

    public init(label: String = "",
                valueState: Int,
                speed: Float = 1.0,
                min: Int = 0,
                max: Int = 0,
                format: String = "%d",
                onChange: ((Int) -> Void)? = nil) {

        self.label = label
        self.valueState = valueState
        self.speed = speed
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

        var _value = Int32(self.valueState)
        if ImGuiWrapper.dragInt(self.label,
                                value: &_value,
                                vSpeed: self.speed,
                                vMin: Int32(self.min),
                                vMax: Int32(self.max),
                                format: self.format) {

            if _value != valueState {

                onChange?(Int(_value))
            }
        }

        if self.backgroundColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }

        if self.hoveredColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }
    }
}
