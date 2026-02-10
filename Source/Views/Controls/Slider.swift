//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A control for selecting a value from a bounded linear range.
public struct Slider: GuiView, Modifiable, HasBackgroundColor, HasActiveColor, HasHoveredColor, HasSelectionColor {

    public var modifiers = ViewModifiers()
    public var backgroundColor: GuiColor?
    public var activeColor: GuiColor?
    public var hoveredColor: GuiColor?
    public var selectionColor: GuiColor?

    public var label: String
    public let value: Binding<Float>
    public var range: ClosedRange<Float>
    public var format: String

    public init(
        label: String = "",
        value: Binding<Float>,
        in range: ClosedRange<Float> = 0.0...1.0,
        format: String = "%.3f"
    ) {
        self.label = label
        self.value = value
        self.range = range
        self.format = format
    }

    public func render() {
        withModifiers(modifiers) {
            var styleScope = StyleScope()
            styleScope.push(.frameBg, color: backgroundColor)
            styleScope.push(.frameBgHovered, color: hoveredColor)
            styleScope.push(.sliderGrabActive, color: activeColor)
            styleScope.push(.sliderGrab, color: selectionColor)

            var currentValue = value.wrappedValue
            if ImGuiWrapper.sliderFloat(
                label,
                value: &currentValue,
                min: range.lowerBound,
                max: range.upperBound,
                format: format,
                power: 1.0
            ) {
                if currentValue != value.wrappedValue {
                    value.wrappedValue = currentValue
                }
            }

            styleScope.pop()
        }
    }
}
