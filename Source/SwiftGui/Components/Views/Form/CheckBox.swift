//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class CheckBox: GuiNode,
                       ActiveColorModifier {

    public var activeColor: GuiColor?

    public var text: String
    public var selectedState: Bool

    private let onChange: ((Bool) -> Void)?

    public init(_ text: String = "",
                selectedState: Bool,
                onChange: ((Bool) -> Void)? = nil) {

        self.text = text
        self.selectedState = selectedState
        self.onChange = onChange
    }

    public override func drawComponent() {

        if let color = self.activeColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.checkMark.rawValue, colorRef: color.cgColor)
        }

        var _value = self.selectedState

        if ImGuiWrapper.checkbox(self.text, value: &_value) {

            if _value != self.selectedState {

                onChange?(_value)
            }
        }

        if self.activeColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }
    }
}
