//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// Protocol for views that support background color customization.
/// Uses copy-on-modify pattern (suitable for structs).
public protocol HasBackgroundColor: GuiView {
    var backgroundColor: GuiColor? { get set }
}

public extension HasBackgroundColor {
    func backgroundColor(_ color: GuiColor) -> Self {
        var copy = self
        copy.backgroundColor = color
        return copy
    }
}

/// Protocol for views that support border color customization.
/// Uses copy-on-modify pattern (suitable for structs).
public protocol HasBorderColor: GuiView {
    var borderColor: GuiColor? { get set }
}

public extension HasBorderColor {
    func borderColor(_ color: GuiColor) -> Self {
        var copy = self
        copy.borderColor = color
        return copy
    }
}

/// Protocol for views that support active color customization.
/// Uses copy-on-modify pattern (suitable for structs).
public protocol HasActiveColor: GuiView {
    var activeColor: GuiColor? { get set }
}

public extension HasActiveColor {
    func activeColor(_ color: GuiColor) -> Self {
        var copy = self
        copy.activeColor = color
        return copy
    }
}

/// Protocol for views that support hovered color customization.
/// Uses copy-on-modify pattern (suitable for structs).
public protocol HasHoveredColor: GuiView {
    var hoveredColor: GuiColor? { get set }
}

public extension HasHoveredColor {
    func hoveredColor(_ color: GuiColor) -> Self {
        var copy = self
        copy.hoveredColor = color
        return copy
    }
}

/// Protocol for views that support selection color customization.
/// Uses copy-on-modify pattern (suitable for structs).
public protocol HasSelectionColor: GuiView {
    var selectionColor: GuiColor? { get set }
}

public extension HasSelectionColor {
    func selectionColor(_ color: GuiColor) -> Self {
        var copy = self
        copy.selectionColor = color
        return copy
    }
}

/// Protocol for views that support tint color customization.
/// Uses copy-on-modify pattern (suitable for structs).
public protocol HasTintColor: GuiView {
    var tintColor: GuiColor? { get set }
}

public extension HasTintColor {
    func tintColor(_ color: GuiColor) -> Self {
        var copy = self
        copy.tintColor = color
        return copy
    }
}

/// Protocol for views that support size customization.
/// Uses copy-on-modify pattern (suitable for structs).
public protocol HasSize: GuiView {
    var size: GuiSize? { get set }
}

public extension HasSize {
    func size(_ size: GuiSize) -> Self {
        var copy = self
        copy.size = size
        return copy
    }

    func size(width: Double, height: Double) -> Self {
        var copy = self
        copy.size = GuiSize(width: width, height: height)
        return copy
    }
}
