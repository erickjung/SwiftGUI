//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class RadioButton: GuiNode,
                          ActiveColorModifier {

    public var activeColor: GuiColor?

    public var text: String
    public var activeState: Bool

    private let onChange: (() -> Void)?

    public init(_ text: String = "",
                activeState: Bool,
                onChange: (() -> Void)? = nil) {

        self.text = text
        self.activeState = activeState
        self.onChange = onChange
    }

    public override func drawComponent() {

        if let color = self.activeColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.checkMark.rawValue, colorRef: color.cgColor)
        }

        if ImGuiWrapper.radioButton(self.text, active: self.activeState) {
            self.onChange?()
        }

        if self.activeColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }
    }
}
