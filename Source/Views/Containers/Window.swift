//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A container that displays content in a movable, resizable window.
public struct Window: GuiView, Modifiable {

    public var modifiers = ViewModifiers()

    public var text: String
    public var options: GuiWindowConfig
    private let child: any GuiView

    // Window-specific properties
    public var position: GuiPoint?
    public var positionCondition: GuiCondition?
    public var size: GuiSize?
    public var sizeCondition: GuiCondition?

    public init(
        _ text: String = "",
        options: GuiWindowConfig = .none,
        @GuiBuilder child: () -> any GuiView
    ) {
        self.text = text
        self.options = options
        self.child = child()
    }

    public func render() {
        withModifiers(modifiers) {
            if let position = position, let positionCondition = positionCondition {
                ImGuiWrapper.setNextWindowPos(
                    position,
                    cond: positionCondition.rawValue,
                    pivot: GuiPoint.zero
                )
            }

            if let size = size, let sizeCondition = sizeCondition {
                ImGuiWrapper.setNextWindowSize(size, cond: sizeCondition.rawValue)
            }

            if ImGuiWrapper.begin(text, flags: options.rawValue) {
                child.render()
            }
            ImGuiWrapper.end()
        }
    }

    // Window-specific modifiers
    public func position(_ position: GuiPoint, condition: GuiCondition = .once) -> Window {
        var copy = self
        copy.position = position
        copy.positionCondition = condition
        return copy
    }

    public func windowSize(_ size: GuiSize, condition: GuiCondition = .once) -> Window {
        var copy = self
        copy.size = size
        copy.sizeCondition = condition
        return copy
    }
}
