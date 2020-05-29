//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class RadioButtonGroup: GuiNode,
                               ActiveColorModifier {

    public var activeColor: GuiColor?

    public var values: [String]
    public var selectedIndexState: Int

    private let onChange: ((Int) -> Void)?

    public init(_ values: [String],
                selectedIndexState: Int,
                onChange: ((Int) -> Void)? = nil) {

        self.values = values
        self.selectedIndexState = selectedIndexState
        self.onChange = onChange
    }

    public override func drawComponent() {

        if let color = self.activeColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.checkMark.rawValue, colorRef: color.cgColor)
        }

        for (index, element) in values.enumerated() {

            self.renderSequential(element, selectedIndexState: index, order: index)
        }

        if self.activeColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }
    }

    private func renderSequential(_ text: String,
                                  selectedIndexState: Int,
                                  order: Int) {

        var _value = Int32(self.selectedIndexState)
        if ImGuiWrapper.radioButton(text, value: &_value, vButton: Int32(order)) {

            if _value != self.selectedIndexState {

                self.onChange?(Int(_value))
            }
        }
    }
}
