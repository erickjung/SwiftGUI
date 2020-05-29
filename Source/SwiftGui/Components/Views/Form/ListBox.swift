//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class ListBox: GuiNode,
                      BackgroundColorModifier,
                      ActiveColorModifier,
                      HoveredColorModifier,
                      SelectionColorModifier {

    public var backgroundColor: GuiColor?
    public var activeColor: GuiColor?
    public var hoveredColor: GuiColor?
    public var selectionColor: GuiColor?

    public var label: String
    public var currentItemState: Int

    public private(set) var items: [String]
    private let onChange: ((Int) -> Void)?

    public init(label: String = "",
                currentItemState: Int,
                items: [String],
                onChange: ((Int) -> Void)? = nil) {

        self.label = label
        self.currentItemState = currentItemState
        self.items = items
        self.onChange = onChange
    }

    public override func drawComponent() {

        if let color = self.backgroundColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.frameBg.rawValue, colorRef: color.cgColor)
        }

        if let color = self.activeColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.headerActive.rawValue, colorRef: color.cgColor)
        }

        if let color = self.hoveredColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.headerHovered.rawValue, colorRef: color.cgColor)
        }

        if let color = self.selectionColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.header.rawValue, colorRef: color.cgColor)
        }

        var _currentItem = Int32(self.currentItemState)
        if ImGuiWrapper.listBox(self.label, currentItem: &_currentItem, items: items, heightInItems: -1) {

            if _currentItem != self.currentItemState {

                onChange?(Int(_currentItem))
            }
        }

        if self.backgroundColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }

        if self.activeColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }

        if self.hoveredColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }

        if self.selectionColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }
    }
}
