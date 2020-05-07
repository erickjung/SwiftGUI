//
//  WindowFlags.swift
//  SwiftGui
//
//  Created by Erick Jung on 07/05/2020.
//  Copyright © 2020 Erick Jung. All rights reserved.
//

import SwiftGuiCore

public struct ImGuiWindowFlags: OptionSet {

    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    public static let none                      = ImGuiWindowFlags(rawValue: 0)
    public static let noTitleBar                = ImGuiWindowFlags(rawValue: 1 << 0)  // Disable title-bar
    public static let noResize                  = ImGuiWindowFlags(rawValue: 1 << 1)  // Disable user resizing with the lower-right grip
    public static let noMove                    = ImGuiWindowFlags(rawValue: 1 << 2)  // Disable user moving the window
    public static let noScrollbar               = ImGuiWindowFlags(rawValue: 1 << 3)  // Disable scrollbars (window can still scroll with mouse or programatically)
    public static let noScrollWithMouse         = ImGuiWindowFlags(rawValue: 1 << 4)  // Disable user vertically scrolling with mouse wheel
    public static let noCollapse                = ImGuiWindowFlags(rawValue: 1 << 5)  // Disable user collapsing window by double-clicking on it
    public static let alwaysAutoResize          = ImGuiWindowFlags(rawValue: 1 << 6)  // Resize every window to its content every frame
    public static let noBackground              = ImGuiWindowFlags(rawValue: 1 << 7)  // Disable drawing background color (WindowBg, etc.) and outside border. Similar as using SetNextWindowBgAlpha(0.0f).
    public static let noSavedSettings           = ImGuiWindowFlags(rawValue: 1 << 8)  // Never load/save settings in .ini file
    public static let noMouseInputs             = ImGuiWindowFlags(rawValue: 1 << 9)  // Disable catching mouse or keyboard inputs
    public static let menuBar                   = ImGuiWindowFlags(rawValue: 1 << 10) // Has a menu-bar
    public static let horizontalScrollbar       = ImGuiWindowFlags(rawValue: 1 << 11) // Allow horizontal scrollbar to appear (off by default). You may use SetNextWindowContentSize(ImVec2(width,0.0f)); prior to calling Begin() to specify width. Read code in imgui_demo in the "Horizontal Scrolling" section.
    public static let noFocusOnAppearing        = ImGuiWindowFlags(rawValue: 1 << 12) // Disable taking focus when transitioning from hidden to visible state
    public static let noBringToFrontOnFocus     = ImGuiWindowFlags(rawValue: 1 << 13) // Disable bringing window to front when taking focus (e.g. clicking on it or programatically giving it focus)
    public static let alwaysVerticalScrollbar   = ImGuiWindowFlags(rawValue: 1 << 14) // Always show vertical scrollbar (even if ContentSize.y < Size.y)
    public static let alwaysHorizontalScrollbar = ImGuiWindowFlags(rawValue: 1 << 15) // Always show horizontal scrollbar (even if ContentSize.x < Size.x)
    public static let alwaysUseWindowPadding    = ImGuiWindowFlags(rawValue: 1 << 16) // Ensure child windows without border uses style.WindowPadding (ignored by default for non-bordered child windows, because more convenient)
    public static let noNavInputs               = ImGuiWindowFlags(rawValue: 1 << 18) // No gamepad/keyboard navigation within the window
    public static let noNavFocus                = ImGuiWindowFlags(rawValue: 1 << 19) // No focusing toward this window with gamepad/keyboard navigation (e.g. skipped by CTRL+TAB)
    public static let unsavedDocument           = ImGuiWindowFlags(rawValue: 1 << 20) // Append '*' to title without affecting the ID, as a convenience to avoid using the ### operator. When used in a tab/docking context, tab is selected on closure and closure is deferred by one frame to allow code to cancel the closure (with a confirmation popup, etc.) without flicker.
    public static let noDocking                 = ImGuiWindowFlags(rawValue: 1 << 21) // Disable docking of this window
}
