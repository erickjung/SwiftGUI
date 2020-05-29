//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class ComboBox: GuiNode,
                       BackgroundColorModifier,
                       ActiveColorModifier,
                       HoveredColorModifier,
                       SelectionColorModifier {

    public var backgroundColor: GuiColor?
    public var activeColor: GuiColor?
    public var hoveredColor: GuiColor?
    public var selectionColor: GuiColor?

    public var text: String
    public var selectedIndexState: Int
    public var items: [String]

    private let onChange: ((Int) -> Void)?

    public init(_ text: String,
                selectedIndexState: Int,
                items: [String],
                onChange: ((Int) -> Void)? = nil) {

        self.text = text
        self.selectedIndexState = selectedIndexState
        self.items = items
        self.onChange = onChange
    }

    public override func drawComponent() {

        if let color = self.backgroundColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.frameBg.rawValue, colorRef: color.cgColor)
            ImGuiWrapper.pushStyleColor(GuiColorProperty.popupBg.rawValue, colorRef: color.cgColor)
        }

        if let color = self.hoveredColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.buttonHovered.rawValue, colorRef: color.cgColor)
            ImGuiWrapper.pushStyleColor(GuiColorProperty.headerHovered.rawValue, colorRef: color.cgColor)
        }

        if let color = self.activeColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.buttonActive.rawValue, colorRef: color.cgColor)
            ImGuiWrapper.pushStyleColor(GuiColorProperty.headerActive.rawValue, colorRef: color.cgColor)
        }

        if let color = self.selectionColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.header.rawValue, colorRef: color.cgColor)
        }

        var _currentItem = Int32(self.selectedIndexState)
        if ImGuiWrapper.combo(self.text, currentItem: &_currentItem, items: items.map { $0 }, popupMaxHeightItems: -1) {

            if _currentItem != self.selectedIndexState {

                onChange?(Int(_currentItem))
            }
        }

        if self.backgroundColor != nil {
            ImGuiWrapper.popStyleColor(2)
        }

        if self.hoveredColor != nil {
            ImGuiWrapper.popStyleColor(2)
        }

        if self.activeColor != nil {
            ImGuiWrapper.popStyleColor(2)
        }

        if self.selectionColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }
    }
}
