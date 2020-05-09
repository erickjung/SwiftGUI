//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A color identifier for styling.
/// Represents: `ImGuiCol`.
public enum GuiColorProperty: Int32 {

    case text
    case textDisabled

    /// Background of normal windows
    case windowBg

    /// Background of child windows
    case childBg

    /// Background of popups menus tooltips windows
    case popupBg
    case border
    case borderShadow

    /// Background of checkbox radio button plot slider text input
    case frameBg
    case frameBgHovered
    case frameBgActive
    case titleBg
    case titleBgActive
    case titleBgCollapsed
    case menuBarBg
    case scrollbarBg
    case scrollbarGrab
    case scrollbarGrabHovered
    case scrollbarGrabActive
    case checkMark
    case sliderGrab
    case sliderGrabActive
    case button
    case buttonHovered
    case buttonActive

    /// Header* colors are used for CollapsingHeader TreeNode Selectable MenuItem
    case header
    case headerHovered
    case headerActive
    case separator
    case separatorHovered
    case separatorActive
    case resizeGrip
    case resizeGripHovered
    case resizeGripActive
    case tab
    case tabHovered
    case tabActive
    case tabUnfocused
    case tabUnfocusedActive
    case dockingPreview

    /// Background color for empty node (eg CentralNode with no window docked into it)
    case dockingEmptyBg
    case plotLines
    case plotLinesHovered
    case plotHistogram
    case plotHistogramHovered
    case textSelectedBg
    case dragDropTarget

    /// Gamepad/keyboard: current highlighted item
    case navHighlight

    /// Highlight window when using CTRL+TAB
    case navWindowingHighlight

    /// Darken/colorize entire screen behind the CTRL+TAB window list when active
    case navWindowingDimBg

    /// Darken/colorize entire screen behind a modal window when one is active
    case modalWindowDimBg
}
