//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A control that presents a group of mutually exclusive radio buttons.
public struct RadioButtonGroup: GuiView, Modifiable, HasActiveColor {

    public var modifiers = ViewModifiers()
    public var activeColor: GuiColor?

    public var values: [String]
    public let selectedIndex: Binding<Int>

    public init(_ values: [String], selectedIndex: Binding<Int>) {
        self.values = values
        self.selectedIndex = selectedIndex
    }

    public func render() {
        withModifiers(modifiers) {
            var styleScope = StyleScope()
            styleScope.push(.checkMark, color: activeColor)

            for (index, text) in values.enumerated() {
                var value = Int32(selectedIndex.wrappedValue)
                if ImGuiWrapper.radioButton(text, value: &value, vButton: Int32(index)) {
                    if value != selectedIndex.wrappedValue {
                        selectedIndex.wrappedValue = Int(value)
                    }
                }
            }

            styleScope.pop()
        }
    }
}
