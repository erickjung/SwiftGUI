//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A container that displays content in a child window region.
public struct SubWindow: GuiView, Modifiable, HasSize {

    public var modifiers = ViewModifiers()
    public var size: GuiSize?

    public var border: Bool
    public var options: GuiWindowConfig
    private let child: any GuiView

    public init(
        border: Bool = false,
        options: GuiWindowConfig = .none,
        @GuiBuilder child: () -> any GuiView
    ) {
        self.border = border
        self.options = options
        self.child = child()
    }

    public func render() {
        withModifiers(modifiers) {
            if ImGuiWrapper.beginChild(
                modifiers.id ?? "##subwindow",
                size: size ?? .zero,
                border: border,
                flags: options.rawValue
            ) {
                child.render()
            }
            ImGuiWrapper.endChild()
        }
    }
}
