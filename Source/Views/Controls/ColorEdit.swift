//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A control for editing color values.
public struct ColorEdit: GuiView, Modifiable, HasBackgroundColor, HasHoveredColor {

    public var modifiers = ViewModifiers()
    public var backgroundColor: GuiColor?
    public var hoveredColor: GuiColor?

    public let color: Binding<GuiColor>

    public init(color: Binding<GuiColor>) {
        self.color = color
    }

    public func render() {
        withModifiers(modifiers) {
            var styleScope = StyleScope()

            if let bgColor = backgroundColor {
                styleScope.push([.frameBg, .popupBg], color: bgColor)
            } else {
                styleScope.push([.frameBg, .popupBg], color: nil)
            }

            styleScope.push(.frameBgHovered, color: hoveredColor)

            var colorArray = color.wrappedValue.convertToFloats()
            if ImGuiWrapper.colorEdit3(
                modifiers.id ?? "##coloredit",
                color: &colorArray,
                flags: 0
            ) {
                color.wrappedValue = GuiColor(
                    r: colorArray[0],
                    g: colorArray[1],
                    b: colorArray[2],
                    a: 1.0
                )
            }

            styleScope.pop()
        }
    }
}
