//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A control that selects one option from a set of mutually exclusive options.
public struct RadioButton: GuiView, Modifiable, HasActiveColor {

    public var modifiers = ViewModifiers()
    public var activeColor: GuiColor?

    public var text: String
    public let isActive: Binding<Bool>

    public init(_ text: String = "", isActive: Binding<Bool>) {
        self.text = text
        self.isActive = isActive
    }

    public func render() {
        withModifiers(modifiers) {
            var styleScope = StyleScope()
            styleScope.push(.checkMark, color: activeColor)

            if ImGuiWrapper.radioButton(text, active: isActive.wrappedValue) {
                isActive.wrappedValue = true
            }

            styleScope.pop()
        }
    }
}
