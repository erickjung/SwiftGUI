//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// Protocol for views that support the standard modifier chain.
/// Uses copy-on-modify pattern (suitable for structs).
///
/// Types conforming to this protocol must have a `modifiers` property of type `ViewModifiers`.
public protocol Modifiable: GuiView {
    var modifiers: ViewModifiers { get set }
}

// MARK: - Default Modifier Implementations

public extension Modifiable {

    /// Sets a unique identifier for this view (useful for ImGui's ID stack).
    func identifier(_ value: String) -> Self {
        var copy = self
        copy.modifiers.id = value
        return copy
    }

    /// Sets the text color for this view.
    func textColor(_ color: GuiColor) -> Self {
        var copy = self
        copy.modifiers.textColor = color
        return copy
    }

    /// Adds padding to the specified edge.
    func padding(_ edge: GuiEdge, value: Double) -> Self {
        var copy = self
        copy.modifiers.padding = edge
        copy.modifiers.paddingValue = value
        return copy
    }

    /// Sets the font index for this view.
    func font(_ index: Int) -> Self {
        var copy = self
        copy.modifiers.fontIndex = index
        return copy
    }

    /// Makes this view's width snap to the full available width.
    func snap() -> Self {
        var copy = self
        copy.modifiers.snapWidth = true
        return copy
    }

    /// Registers a callback to be invoked when the user hovers over this view.
    /// The callback can optionally return a view to display (e.g., a tooltip).
    func onHover(_ callback: @escaping () -> (any GuiView)?) -> Self {
        var copy = self
        copy.modifiers.onHover = callback
        return copy
    }
}
