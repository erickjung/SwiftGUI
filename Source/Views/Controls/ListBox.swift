//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A control that presents a scrollable list of selectable items.
public struct ListBox: GuiView, Modifiable, HasBackgroundColor, HasActiveColor, HasHoveredColor, HasSelectionColor {

    public var modifiers = ViewModifiers()
    public var backgroundColor: GuiColor?
    public var activeColor: GuiColor?
    public var hoveredColor: GuiColor?
    public var selectionColor: GuiColor?

    public var label: String
    public let selectedIndex: Binding<Int>
    public var items: [String]

    public init(
        label: String = "",
        selectedIndex: Binding<Int>,
        items: [String]
    ) {
        self.label = label
        self.selectedIndex = selectedIndex
        self.items = items
    }

    public func render() {
        withModifiers(modifiers) {
            var styleScope = StyleScope()
            styleScope.push(.frameBg, color: backgroundColor)
            styleScope.push(.headerActive, color: activeColor)
            styleScope.push(.headerHovered, color: hoveredColor)
            styleScope.push(.header, color: selectionColor)

            var currentItem = Int32(selectedIndex.wrappedValue)
            if ImGuiWrapper.listBox(
                label,
                currentItem: &currentItem,
                items: items,
                heightInItems: -1
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
