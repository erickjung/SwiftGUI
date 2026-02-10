//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A control that presents a dropdown list of selectable items.
public struct ComboBox: GuiView, Modifiable, HasBackgroundColor, HasActiveColor, HasHoveredColor, HasSelectionColor {

    public var modifiers = ViewModifiers()
    public var backgroundColor: GuiColor?
    public var activeColor: GuiColor?
    public var hoveredColor: GuiColor?
    public var selectionColor: GuiColor?

    public var text: String
    public let selectedIndex: Binding<Int>
    public var items: [String]

    public init(
        _ text: String,
        selectedIndex: Binding<Int>,
        items: [String]
    ) {
        self.text = text
        self.selectedIndex = selectedIndex
        self.items = items
    }

    public func render() {
        withModifiers(modifiers) {
            var styleScope = StyleScope()

            // ComboBox uses multiple color properties per type
            if let color = backgroundColor {
                styleScope.push([.frameBg, .popupBg], color: color)
            } else {
                styleScope.push([.frameBg, .popupBg], color: nil)
            }

            if let color = hoveredColor {
                styleScope.push([.buttonHovered, .headerHovered], color: color)
            } else {
                styleScope.push([.buttonHovered, .headerHovered], color: nil)
            }

            if let color = activeColor {
                styleScope.push([.buttonActive, .headerActive], color: color)
            } else {
                styleScope.push([.buttonActive, .headerActive], color: nil)
            }

            styleScope.push(.header, color: selectionColor)

            var currentItem = Int32(selectedIndex.wrappedValue)
            if ImGuiWrapper.combo(
                text,
                currentItem: &currentItem,
                items: items.map { $0 },
                popupMaxHeightItems: -1
            ) {
                let newIndex = Int(currentItem)
                if newIndex != selectedIndex.wrappedValue {
                    selectedIndex.wrappedValue = newIndex
                }
            }

            styleScope.pop()
        }
    }
}
