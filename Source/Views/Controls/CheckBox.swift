//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A control that toggles between on and off states.
public struct CheckBox: GuiView, Modifiable, HasActiveColor {

    public var modifiers = ViewModifiers()
    public var activeColor: GuiColor?

    public var text: String
    public let isOn: Binding<Bool>

    public init(_ text: String = "", isOn: Binding<Bool>) {
        self.text = text
        self.isOn = isOn
    }

    public func render() {
        withModifiers(modifiers) {
            var styleScope = StyleScope()
            styleScope.push(.checkMark, color: activeColor)

            var value = isOn.wrappedValue

            if ImGuiWrapper.checkbox(text, value: &value) {
                if value != isOn.wrappedValue {
                    isOn.wrappedValue = value
                }
            }

            styleScope.pop()
        }
    }
}
