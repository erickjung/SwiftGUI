//
//  Attributes.swift
//  SwiftGui
//
//  Created by Erick Jung on 24/10/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import SwiftGUI_Core

public struct ImGuiConfigFlags: OptionSet {

    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    public static let none                    = ImGuiConfigFlags(rawValue: 0)
    public static let navEnableKeyboard       = ImGuiConfigFlags(rawValue: 1 << 0)
    public static let navEnableGamepad        = ImGuiConfigFlags(rawValue: 1 << 1)
    public static let navEnableSetMousePos    = ImGuiConfigFlags(rawValue: 1 << 2)
    public static let navNoCaptureKeyboard    = ImGuiConfigFlags(rawValue: 1 << 3)
    public static let noMouse                 = ImGuiConfigFlags(rawValue: 1 << 4)
    public static let noMouseCursorChange     = ImGuiConfigFlags(rawValue: 1 << 5)
    public static let dockingEnable           = ImGuiConfigFlags(rawValue: 1 << 6)
    public static let viewportsEnable         = ImGuiConfigFlags(rawValue: 1 << 10)
    public static let dpiEnableScaleViewports = ImGuiConfigFlags(rawValue: 1 << 14)
    public static let dpiEnableScaleFonts     = ImGuiConfigFlags(rawValue: 1 << 15)
    public static let isSRGB                  = ImGuiConfigFlags(rawValue: 1 << 20)
    public static let isTouchScreen           = ImGuiConfigFlags(rawValue: 1 << 21)
}


public struct ImGuiDockNodeFlags: OptionSet {

    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    public static let none                   = ImGuiDockNodeFlags(rawValue: 0)
    public static let keepAliveOnly          = ImGuiDockNodeFlags(rawValue: 1 << 0)
    public static let noDockingInCentralNode = ImGuiDockNodeFlags(rawValue: 1 << 2)
    public static let passthruCentralNode    = ImGuiDockNodeFlags(rawValue: 1 << 3)
    public static let noSplit                = ImGuiDockNodeFlags(rawValue: 1 << 4)
    public static let noResize               = ImGuiDockNodeFlags(rawValue: 1 << 5)
    public static let autoHideTabBar         = ImGuiDockNodeFlags(rawValue: 1 << 6)
}

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

public struct ImGuiCond: OptionSet {

    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    public static let always       = ImGuiCond(rawValue: 1 << 0)  // Set the variable
    public static let once         = ImGuiCond(rawValue: 1 << 1)  // Set the variable once per runtime session (only the first call with succeed)
    public static let firstUseEver = ImGuiCond(rawValue: 1 << 2)  // Set the variable if the object/window has no persistently saved data (no entry in .ini file)
    public static let appearing    = ImGuiCond(rawValue: 1 << 3)  // Set the variable if the object/window is appearing after being hidden/inactive (or the first time)
}

public struct ImGuiInputTextFlags: OptionSet {

    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    public static let none                = ImGuiInputTextFlags(rawValue: 0)
    public static let charsDecimal        = ImGuiInputTextFlags(rawValue: 1 << 0)   // Allow 0123456789.+-*/
    public static let charsHexadecimal    = ImGuiInputTextFlags(rawValue: 1 << 1)   // Allow 0123456789ABCDEFabcdef
    public static let charsUppercase      = ImGuiInputTextFlags(rawValue: 1 << 2)   // Turn a..z into A..Z
    public static let charsNoBlank        = ImGuiInputTextFlags(rawValue: 1 << 3)   // Filter out spaces, tabs
    public static let autoSelectAll       = ImGuiInputTextFlags(rawValue: 1 << 4)   // Select entire text when first taking mouse focus
    public static let enterReturnsTrue    = ImGuiInputTextFlags(rawValue: 1 << 5)   // Return 'true' when Enter is pressed (as opposed to every time the value was modified). Consider looking at the IsItemDeactivatedAfterEdit() function.
    public static let callbackCompletion  = ImGuiInputTextFlags(rawValue: 1 << 6)   // Callback on pressing TAB (for completion handling)
    public static let callbackHistory     = ImGuiInputTextFlags(rawValue: 1 << 7)   // Callback on pressing Up/Down arrows (for history handling)
    public static let callbackAlways      = ImGuiInputTextFlags(rawValue: 1 << 8)   // Callback on each iteration. User code may query cursor position, modify text buffer.
    public static let callbackCharFilter  = ImGuiInputTextFlags(rawValue: 1 << 9)   // Callback on character inputs to replace or discard them. Modify 'EventChar' to replace or discard, or return 1 in callback to discard.
    public static let allowTabInput       = ImGuiInputTextFlags(rawValue: 1 << 10)  // Pressing TAB input a '\t' character into the text field
    public static let ctrlEnterForNewLine = ImGuiInputTextFlags(rawValue: 1 << 11)  // In multi-line mode, unfocus with Enter, add new line with Ctrl+Enter (default is opposite: unfocus with Ctrl+Enter, add line with Enter).
    public static let noHorizontalScroll  = ImGuiInputTextFlags(rawValue: 1 << 12)  // Disable following the cursor horizontally
    public static let alwaysInsertMode    = ImGuiInputTextFlags(rawValue: 1 << 13)  // Insert mode
    public static let readOnly            = ImGuiInputTextFlags(rawValue: 1 << 14)  // Read-only mode
    public static let password            = ImGuiInputTextFlags(rawValue: 1 << 15)  // Password mode, display all characters as '*'
    public static let noUndoRedo          = ImGuiInputTextFlags(rawValue: 1 << 16)  // Disable undo/redo. Note that input text owns the text data while active, if you want to provide your own undo/redo stack you need e.g. to call ClearActiveID().
    public static let charsScientific     = ImGuiInputTextFlags(rawValue: 1 << 17)  // Allow 0123456789.+-*/eE (Scientific notation input)
    public static let callbackResize      = ImGuiInputTextFlags(rawValue: 1 << 18)  // Callback on buffer capacity changes request (beyond 'buf_size' parameter value), allowing the string to grow. Notify when the string wants to be resized (for string types which hold a cache of their Size). You will be provided a new BufSize in the callback and NEED to honor it. (see misc/cpp/imgui_stdlib.h for an example of using this)
}

public struct ImGuiTreeNodeFlags: OptionSet {

    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    public static let none                 = ImGuiTreeNodeFlags(rawValue: 0)
    public static let selected             = ImGuiTreeNodeFlags(rawValue: 1 << 0)   // Draw as selected
    public static let framed               = ImGuiTreeNodeFlags(rawValue: 1 << 1)   // Full colored frame (e.g. for CollapsingHeader)
    public static let allowItemOverlap     = ImGuiTreeNodeFlags(rawValue: 1 << 2)   // Hit testing to allow subsequent widgets to overlap this one
    public static let noTreePushOnOpen     = ImGuiTreeNodeFlags(rawValue: 1 << 3)   // Don't do a TreePush() when open (e.g. for CollapsingHeader) = no extra indent nor pushing on ID stack
    public static let noAutoOpenOnLog      = ImGuiTreeNodeFlags(rawValue: 1 << 4)   // Don't automatically and temporarily open node when Logging is active (by default logging will automatically open tree nodes)
    public static let defaultOpen          = ImGuiTreeNodeFlags(rawValue: 1 << 5)   // Default node to be open
    public static let openOnDoubleClick    = ImGuiTreeNodeFlags(rawValue: 1 << 6)   // Need double-click to open node
    public static let openOnArrow          = ImGuiTreeNodeFlags(rawValue: 1 << 7)   // Only open when clicking on the arrow part. If public static let OpenOnDoubleClick is also set, single-click arrow or double-click all box to open.
    public static let leaf                 = ImGuiTreeNodeFlags(rawValue: 1 << 8)   // No collapsing, no arrow (use as a convenience for leaf nodes).
    public static let bullet               = ImGuiTreeNodeFlags(rawValue: 1 << 9)   // Display a bullet instead of arrow
    public static let framePadding         = ImGuiTreeNodeFlags(rawValue: 1 << 10)  // Use FramePadding (even for an unframed text node) to vertically align text baseline to regular widget height. Equivalent to calling AlignTextToFramePadding().
    public static let spanAvailWidth       = ImGuiTreeNodeFlags(rawValue: 1 << 11)  // Extend hit box to the right-most edge, even if not framed. This is not the default in order to allow adding other items on the same line. In the future we may refactor the hit system to be front-to-back, allowing natural overlaps and then this can become the default.
    public static let spanFullWidth        = ImGuiTreeNodeFlags(rawValue: 1 << 12)  // Extend hit box to the left-most and right-most edges (bypass the indented area).
    public static let navLeftJumpsBackHere = ImGuiTreeNodeFlags(rawValue: 1 << 13)  // (WIP) Nav: left direction may move to this TreeNode() from any of its child (items submitted between TreeNode and TreePop)
//    public static let CollapsingHeader     = public static let Framed | public static let NoTreePushOnOpen | public static let NoAutoOpenOnLog
}

public struct ImGuiTabBarFlags: OptionSet {

    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    public static let none                         = ImGuiTabBarFlags(rawValue: 0)
    public static let reorderable                  = ImGuiTabBarFlags(rawValue: 1 << 0)
    public static let autoSelectNewTabs            = ImGuiTabBarFlags(rawValue: 1 << 1)
    public static let tabListPopupButton           = ImGuiTabBarFlags(rawValue: 1 << 2)
    public static let noCloseWithMiddleMouseButton = ImGuiTabBarFlags(rawValue: 1 << 3)
    public static let noTabListScrollingButtons    = ImGuiTabBarFlags(rawValue: 1 << 4)
    public static let noTooltip                    = ImGuiTabBarFlags(rawValue: 1 << 5)
    public static let fittingPolicyResizeDown      = ImGuiTabBarFlags(rawValue: 1 << 6)
    public static let fittingPolicyScroll          = ImGuiTabBarFlags(rawValue: 1 << 7)
//    public static let fittingPolicyMask
//    public static let fittingPolicyDefault
}

public struct ImGuiTabItemFlags: OptionSet {

    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    public static let none                         = ImGuiTabItemFlags(rawValue: 0)
    public static let unsavedDocument              = ImGuiTabItemFlags(rawValue: 1 << 0)
    public static let setSelected                  = ImGuiTabItemFlags(rawValue: 1 << 1)
    public static let noCloseWithMiddleMouseButton = ImGuiTabItemFlags(rawValue: 1 << 2)
    public static let noPushId                     = ImGuiTabItemFlags(rawValue: 1 << 3)
}

public struct ImGuiSelectableFlags: OptionSet {

    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    public static let none             = ImGuiSelectableFlags(rawValue: 0)
    public static let dontClosePopups  = ImGuiSelectableFlags(rawValue: 1 << 0)
    public static let spanAllColumns   = ImGuiSelectableFlags(rawValue: 1 << 1)
    public static let allowDoubleClick = ImGuiSelectableFlags(rawValue: 1 << 2)
    public static let disabled         = ImGuiSelectableFlags(rawValue: 1 << 3)
    public static let allowItemOverlap = ImGuiSelectableFlags(rawValue: 1 << 4)
}

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

public enum ImGuiStyleVar: Int32 {
    
    case alpha               // float
    case windowPadding       // ImVec2
    case windowRounding      // float
    case windowBorderSize    // float
    case windowMinSize       // ImVec2
    case windowTitleAlign    // ImVec2
    case childRounding       // float
    case childBorderSize     // float
    case popupRounding       // float
    case popupBorderSize     // float
    case framePadding        // ImVec2
    case frameRounding       // float
    case frameBorderSize     // float
    case itemSpacing         // ImVec2
    case itemInnerSpacing    // ImVec2
    case indentSpacing       // float
    case scrollbarSize       // float
    case scrollbarRounding   // float
    case grabMinSize         // float
    case grabRounding        // float
    case tabRounding         // float
    case buttonTextAlign     // ImVec2
    case selectableTextAlign // ImVec2
}

public enum ImGuiDir: Int32
{
    case none  = -1
    case left  = 0
    case right = 1
    case up    = 2
    case down  = 3
}


// SwiftGUI

public enum GUIEdge
{
    case all
    case top
    case leading
    case bottom
    case trailing
}
