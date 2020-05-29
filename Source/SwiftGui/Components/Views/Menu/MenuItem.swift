//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class MenuItem: GuiNode {

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

    public override func drawComponent() {

        if ImGuiWrapper.menuItem(self.text, shortcut: self.shortcut, selected: self.selected, enabled: self.enabled) {
            onTap?()
        }
    }
}
