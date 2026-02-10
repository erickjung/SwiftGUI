//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A layout view that creates a column-based layout.
public struct Column: GuiView, Modifiable {

    public var modifiers = ViewModifiers()

    public var count: Int
    public var border: Bool

    public init(count: Int = 1, border: Bool = true) {
        self.count = count
        self.border = border
    }

    public func render() {
        withModifiers(modifiers) {
            ImGuiWrapper.columns(
                Int32(count),
                strId: modifiers.id ?? "##column",
                border: border
            )
        }
    }
}
