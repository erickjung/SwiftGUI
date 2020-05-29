//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class Window: GuiNode,
                     WindowPositionModifier,
                     WindowSizeModifier {

    public var position: GuiPoint?
    public var positionCondition: GuiCondition?
    public var size: GuiSize?
    public var sizeCondition: GuiCondition?

    public var text: String
    public var options: GuiWindowConfig
    private let child: GuiView

    public init(_ text: String = "",
                options: GuiWindowConfig = .none,
                @GuiBuilder child: () -> GuiView) {

        self.text = text
        self.options = options
        self.child = child()
    }

    public override func drawComponent() {

        if let position = self.position,
            let positionCondition = self.positionCondition {

            ImGuiWrapper.setNextWindowPos(position, cond: positionCondition.rawValue, pivot: GuiPoint.zero)
        }

        if let size = self.size,
            let sizeCondition = self.sizeCondition {

            ImGuiWrapper.setNextWindowSize(size, cond: sizeCondition.rawValue)
        }

        if ImGuiWrapper.begin(self.text, flags: self.options.rawValue) {

            self.child.render()
        }
        ImGuiWrapper.end()
    }
}
