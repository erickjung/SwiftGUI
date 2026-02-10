//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A menu item that triggers an action when selected.
public struct MenuItem: GuiView, Modifiable {

    public var modifiers = ViewModifiers()

    public var text: String
    public var shortcut: String?
    public var selected: Bool
    public var enabled: Bool

    private let onTap: (() -> Void)?

    public init(_ text: String,
                shortcut: String? = nil,
                selected: Bool = false,
                enabled: Bool = true,
                onTap: (() -> Void)? = nil) {
        self.text = text
        self.shortcut = shortcut
        self.selected = selected
        self.enabled = enabled
        self.onTap = onTap
    }

    public func render() {
        withModifiers(modifiers) {
            if ImGuiWrapper.menuItem(text, shortcut: shortcut, selected: selected, enabled: enabled) {
                onTap?()
            }
        }
    }
}
