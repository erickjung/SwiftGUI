//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// Reusable push/pop style color helper to eliminate boilerplate in every component.
/// Tracks the number of pushed style colors and pops them all at once.
public struct StyleScope {
    private var count: Int32 = 0

    /// Push a single style color property.
    /// Does nothing if color is nil.
    public mutating func push(_ property: GuiColorProperty, color: GuiColor?) {
        guard let color = color else { return }
        ImGuiWrapper.pushStyleColor(property.rawValue, colorRef: color.cgColor)
        count += 1
    }

    /// Push multiple style color properties with the same color.
    /// Useful for components that affect multiple ImGui color properties.
    /// Does nothing if color is nil.
    public mutating func push(_ properties: [GuiColorProperty], color: GuiColor?) {
        guard let color = color else { return }
        for prop in properties {
            ImGuiWrapper.pushStyleColor(prop.rawValue, colorRef: color.cgColor)
            count += 1
        }
    }

    /// Pop all pushed style colors.
    /// Must be called to restore ImGui state.
    public func pop() {
        if count > 0 {
            ImGuiWrapper.popStyleColor(count)
        }
    }
}
