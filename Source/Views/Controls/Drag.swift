//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A control for adjusting an integer value by dragging.
public struct Drag: GuiView, Modifiable, HasBackgroundColor, HasHoveredColor {

    public var modifiers = ViewModifiers()
    public var backgroundColor: GuiColor?
    public var hoveredColor: GuiColor?

    public var label: String
    public let value: Binding<Int>
    public var speed: Float
    public var range: ClosedRange<Int>
    public var format: String

    public init(
        label: String = "",
        value: Binding<Int>,
        speed: Float = 1.0,
        in range: ClosedRange<Int> = 0...0,
        format: String = "%d"
    ) {
        self.label = label
        self.value = value
        self.speed = speed
        self.range = range
        self.format = format
    }

    public func render() {
        withModifiers(modifiers) {
            var styleScope = StyleScope()
            styleScope.push(.frameBg, color: backgroundColor)
            styleScope.push(.frameBgHovered, color: hoveredColor)

            var currentValue = Int32(value.wrappedValue)
            if ImGuiWrapper.dragInt(
                label,
                value: &currentValue,
                vSpeed: speed,
                vMin: Int32(range.lowerBound),
                vMax: Int32(range.upperBound),
                format: format
            ) {
                let newValue = Int(currentValue)
                if newValue != value.wrappedValue {
                    value.wrappedValue = newValue
                }
            }

            styleScope.pop()
        }
    }
}
