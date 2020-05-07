//
//  GuiCol.swift
//  SwiftGui
//
//  Created by Erick Jung on 07/05/2020.
//  Copyright © 2020 Erick Jung. All rights reserved.
//

import Foundation

public enum ImGuiCol: Int32 {
    
    case text
    case textDisabled
    case windowBg              // Background of normal windows
    case childBg               // Background of child windows
    case popupBg               // Background of popups menus tooltips windows
    case border
    case borderShadow
    case frameBg               // Background of checkbox radio button plot slider text input
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
    case header                // Header* colors are used for CollapsingHeader TreeNode Selectable MenuItem
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
    case dockingEmptyBg        // Background color for empty node (eg CentralNode with no window docked into it)
    case plotLines
    case plotLinesHovered
    case plotHistogram
    case plotHistogramHovered
    case textSelectedBg
    case dragDropTarget
    case navHighlight          // Gamepad/keyboard: current highlighted item
    case navWindowingHighlight // Highlight window when using CTRL+TAB
    case navWindowingDimBg     // Darken/colorize entire screen behind the CTRL+TAB window list when active
    case modalWindowDimBg      // Darken/colorize entire screen behind a modal window when one is active
}
