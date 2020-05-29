//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class MenuGroup: GuiNode, BackgroundColorModifier {

    public var backgroundColor: GuiColor?

    public var text: String
    public var enabled: Bool

    private let child: GuiView

    public init(_ text: String,
                enabled: Bool = true,
                @GuiBuilder child: () -> GuiView) {

        self.text = text
        self.enabled = enabled
        self.child = child()
    }

    public override func drawComponent() {

        if let color = self.backgroundColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.popupBg.rawValue, colorRef: color.cgColor)
        }

        if ImGuiWrapper.beginMenu(self.text, enabled: self.enabled) {

            child.render()
            ImGuiWrapper.endMenu()
        }

        if self.backgroundColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }
    }
}
