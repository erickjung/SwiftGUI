//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A view that displays a label-value pair.
public struct TextLabel: GuiView, Modifiable {

    public var modifiers = ViewModifiers()

    public var label: String
    public var value: String

    public init(label: String, value: String) {
        self.label = label
        self.value = value
    }

    public func render() {
        withModifiers(modifiers) {
            ImGuiWrapper.labelText(label, format: value)
        }
    }
}
