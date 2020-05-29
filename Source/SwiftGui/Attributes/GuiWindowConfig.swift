//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// OptionSet with properties for window configuration.
/// Represents: `ImGuiWindowFlags`.
public struct GuiWindowConfig: OptionSet {

    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    public static let none                      = GuiWindowConfig([])

    /// Disable title-bar
    public static let noTitleBar                = GuiWindowConfig(rawValue: 1 << 0)

    /// Disable user resizing with the lower-right grip
    public static let noResize                  = GuiWindowConfig(rawValue: 1 << 1)

    /// Disable user moving the window
    public static let noMove                    = GuiWindowConfig(rawValue: 1 << 2)

    /// Disable scrollbars (window can still scroll with mouse or programatically)
    public static let noScrollbar               = GuiWindowConfig(rawValue: 1 << 3)

    /// Disable user vertically scrolling with mouse wheel
    public static let noScrollWithMouse         = GuiWindowConfig(rawValue: 1 << 4)

    /// Disable user collapsing window by double-clicking on it
    public static let noCollapse                = GuiWindowConfig(rawValue: 1 << 5)

    /// Resize every window to its content every frame
    public static let alwaysAutoResize          = GuiWindowConfig(rawValue: 1 << 6)

    /// Disable drawing background color (WindowBg, etc.) and outside border. Similar as using SetNextWindowBgAlpha(0.0f).
    public static let noBackground              = GuiWindowConfig(rawValue: 1 << 7)

    /// Never load/save settings in .ini file
    public static let noSavedSettings           = GuiWindowConfig(rawValue: 1 << 8)

    /// Disable catching mouse or keyboard inputs
    public static let noMouseInputs             = GuiWindowConfig(rawValue: 1 << 9)

    /// Has a menu-bar
    public static let menuBar                   = GuiWindowConfig(rawValue: 1 << 10)

    /// Allow horizontal scrollbar to appear (off by default). You may use SetNextWindowContentSize(ImVec2(width,0.0f));
    /// prior to calling Begin() to specify width. Read code in imgui_demo in the "Horizontal Scrolling" section.
    public static let horizontalScrollbar       = GuiWindowConfig(rawValue: 1 << 11)

    /// Disable taking focus when transitioning from hidden to visible state
    public static let noFocusOnAppearing        = GuiWindowConfig(rawValue: 1 << 12)

    /// Disable bringing window to front when taking focus (e.g. clicking on it or programatically giving it focus)
    public static let noBringToFrontOnFocus     = GuiWindowConfig(rawValue: 1 << 13)

    /// Always show vertical scrollbar (even if ContentSize.y < Size.y)
    public static let alwaysVerticalScrollbar   = GuiWindowConfig(rawValue: 1 << 14)

    /// Always show horizontal scrollbar (even if ContentSize.x < Size.x)
    public static let alwaysHorizontalScrollbar = GuiWindowConfig(rawValue: 1 << 15)

    /// Ensure child windows without border uses style.WindowPadding
    /// (ignored by default for non-bordered child windows, because more convenient)
    public static let alwaysUseWindowPadding    = GuiWindowConfig(rawValue: 1 << 16)

    /// No gamepad/keyboard navigation within the window
    public static let noNavInputs               = GuiWindowConfig(rawValue: 1 << 18)

    /// No focusing toward this window with gamepad/keyboard navigation (e.g. skipped by CTRL+TAB)
    public static let noNavFocus                = GuiWindowConfig(rawValue: 1 << 19)

    /// Append '*' to title without affecting the ID, as a convenience to avoid using the ### operator.
    /// When used in a tab/docking context, tab is selected on closure and closure is deferred by one
    /// frame to allow code to cancel the closure (with a confirmation popup, etc.) without flicker.
    public static let unsavedDocument           = GuiWindowConfig(rawValue: 1 << 20)

    /// Disable docking of this window
    public static let noDocking                 = GuiWindowConfig(rawValue: 1 << 21)
}
