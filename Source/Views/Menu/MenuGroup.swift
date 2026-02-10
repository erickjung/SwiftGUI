//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A menu group that contains menu items.
public struct MenuGroup: GuiView, Modifiable, HasBackgroundColor {

    public var modifiers = ViewModifiers()
    public var backgroundColor: GuiColor?

    public var text: String
    public var enabled: Bool

    private let child: any GuiView

    public init(_ text: String,
                enabled: Bool = true,
                @GuiBuilder child: () -> GuiView) {
        self.text = text
        self.enabled = enabled
        self.child = child()
    }

    public func render() {
        withModifiers(modifiers) {
            var styleScope = StyleScope()

            styleScope.push(.popupBg, color: backgroundColor)

            if ImGuiWrapper.beginMenu(text, enabled: enabled) {
                child.render()
                ImGuiWrapper.endMenu()
            }

            styleScope.pop()
        }
    }
}
