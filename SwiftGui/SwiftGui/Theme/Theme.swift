//
//  Theme.swift
//  SwiftGui
//
//  Created by Erick Jung on 11/11/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGuiCore

public protocol Theme {
 
    var colors: [ImGuiCol: SGColor] { get }
    
    /// Global alpha applies to everything in ImGui
    var alpha: Float { get }

    /// Padding within a window
    var windowPadding: SGPoint { get }

    /// Radius of window corners rounding. Set to 0.0f to have rectangular windows
    var windowRounding: Float { get }

    /// Thickness of border around windows. Generally set to 0.0f or 1.0f. Other values not well tested.
    var windowBorderSize: Float { get }

    /// Minimum window size
    var windowMinSize: SGSize { get }

    /// Alignment for title bar text
    var windowTitleAlign: SGPoint { get }

    /// Position of the collapsing/docking button in the title bar (left/right). Defaults to ImGuiDir_Left.
    var windowMenuButtonPosition: ImGuiDir { get }

    /// Radius of child window corners rounding. Set to 0.0f to have rectangular child windows
    var childRounding: Float { get }

    /// Thickness of border around child windows. Generally set to 0.0f or 1.0f. Other values not well tested.
    var childBorderSize: Float { get }

    /// Radius of popup window corners rounding. Set to 0.0f to have rectangular child windows
    var popupRounding: Float { get }

    /// Thickness of border around popup or tooltip windows. Generally set to 0.0f or 1.0f. Other values not well tested.
    var popupBorderSize: Float { get }
    
    /// Padding within a framed rectangle (used by most widgets)
    var framePadding: SGPoint { get }

    /// Radius of frame corners rounding. Set to 0.0f to have rectangular frames (used by most widgets).
    var frameRounding: Float { get }

    /// Thickness of border around frames. Generally set to 0.0f or 1.0f. Other values not well tested.
    var frameBorderSize: Float { get }

    /// Horizontal and vertical spacing between widgets/lines
    var itemSpacing: SGPoint { get }

    /// Horizontal and vertical spacing between within elements of a composed widget (e.g. a slider and its label)
    var itemInnerSpacing: SGPoint { get }

    /// Expand reactive bounding box for touch-based system where touch position is not accurate enough. Unfortunately we don't sort widgets so priority on overlap will always be given to the first widget. So don't grow this too much!
    var touchExtraPadding: SGPoint { get }

    /// Horizontal spacing when e.g. entering a tree node. Generally == (FontSize + FramePadding.x*2).
    var indentSpacing: Float { get }

    /// Minimum horizontal spacing between two columns. Preferably > (FramePadding.x + 1).
    var columnsMinSpacing: Float { get }

    /// Width of the vertical scrollbar, Height of the horizontal scrollbar
    var scrollbarSize: Float { get }

    /// Radius of grab corners rounding for scrollbar
    var scrollbarRounding: Float { get }

    /// Minimum width/height of a grab box for slider/scrollbar
    var grabMinSize: Float { get }

    /// Radius of grabs corners rounding. Set to 0.0f to have rectangular slider grabs.
    var grabRounding: Float { get }

    /// Radius of upper corners of a tab. Set to 0.0f to have rectangular tabs.
    var tabRounding: Float { get }

    /// Thickness of border around tabs.
    var tabBorderSize: Float { get }

    /// Side of the color button in the ColorEdit4 widget (left/right). Defaults to ImGuiDir_Right.
    var colorButtonPosition: ImGuiDir { get }
    
    /// Alignment of button text when button is larger than text.
    var buttonTextAlign: SGPoint { get }

    /// Alignment of selectable text when button is larger than text.
    var selectableTextAlign: SGPoint { get }

    /// Window position are clamped to be visible within the display area or monitors by at least this amount. Only applies to regular windows.
    var displayWindowPadding: SGPoint { get }

    /// If you cannot see the edge of your screen (e.g. on a TV) increase the safe area padding. Covers popups/tooltips as well regular windows.
    var displaySafeAreaPadding: SGPoint { get }
    
    /// Scale software rendered mouse cursor (when io.MouseDrawCursor is enabled). May be removed later.
    var mouseCursorScale: Float { get }

    /// Enable anti-aliasing on lines/borders. Disable if you are really short on CPU/GPU.
    var antiAliasedLines: Bool { get }

    /// Enable anti-aliasing on filled shapes (rounded rectangles, circles, etc.)
    var antiAliasedFill: Bool { get }

    /// Tessellation tolerance when using PathBezierCurveTo() without a specific number of segments. Decrease for highly tessellated curves (higher quality, more polygons), increase to reduce quality.
    var curveTessellationTol: Float { get }
}

extension Theme {
    
    public var alpha: Float {
        return 1
    }

    public var windowPadding: SGPoint {
        return SGPoint(x: 8, y: 8)
    }

    public var windowRounding: Float {
        return 7
    }

    public var windowBorderSize: Float {
        return 1
    }

    public var windowMinSize: SGSize {
        return SGSize(width: 32, height: 32)
    }

    public var windowTitleAlign: SGPoint {
        return SGPoint(x: 0, y: 0.5)
    }

    public var windowMenuButtonPosition: ImGuiDir {
        return .left
    }

    public var childRounding: Float {
        return 0
    }

    public var childBorderSize: Float {
        return 1
    }

    public var popupRounding: Float {
        return 0
    }

    public var popupBorderSize: Float {
        return 1
    }
    
    public var framePadding: SGPoint {
        return SGPoint(x: 4, y: 3)
    }

    public var frameRounding: Float {
        return 0
    }

    public var frameBorderSize: Float {
        return 0
    }

    public var itemSpacing: SGPoint {
        return SGPoint(x: 8, y: 4)
    }

    public var itemInnerSpacing: SGPoint {
        return SGPoint(x: 4, y: 4)
    }

    public var touchExtraPadding: SGPoint {
        return .zero
    }

    public var indentSpacing: Float {
        return 21
    }

    public var columnsMinSpacing: Float {
        return 6
    }

    public var scrollbarSize: Float {
        return 14
    }

    public var scrollbarRounding: Float {
        return 9
    }

    public var grabMinSize: Float {
        return 10
    }

    public var grabRounding: Float {
        return 0
    }

    public var tabRounding: Float {
        return 4
    }

    public var tabBorderSize: Float {
        return 0
    }

    public var colorButtonPosition: ImGuiDir {
        return .right
    }

    public var buttonTextAlign: SGPoint {
        return SGPoint(x: 0.5, y: 0.5)
    }

    public var selectableTextAlign: SGPoint {
        return .zero
    }

    public var displayWindowPadding: SGPoint {
        return SGPoint(x: 19, y: 19)
    }

    public var displaySafeAreaPadding: SGPoint {
        return SGPoint(x: 3, y: 3)
    }
    
    public var mouseCursorScale: Float {
        return 1
    }

    public var antiAliasedLines: Bool {
        return true
    }

    public var antiAliasedFill: Bool {
        return true
    }

    public var curveTessellationTol: Float {
        return 1.25
    }
    
    public func apply() {
     
        if let style = igGetStyle() {

            style.pointee.Alpha = self.alpha
            style.pointee.WindowPadding = self.windowPadding.convertToVec2()
            style.pointee.WindowRounding = self.windowRounding
            style.pointee.WindowBorderSize = self.windowBorderSize
            style.pointee.WindowMinSize = self.windowMinSize.convertToVec2()
            style.pointee.WindowTitleAlign = self.windowTitleAlign.convertToVec2()
            style.pointee.WindowMenuButtonPosition = self.windowMenuButtonPosition.rawValue
            style.pointee.ChildRounding = self.childRounding
            style.pointee.ChildBorderSize = self.childBorderSize
            style.pointee.PopupRounding = self.popupRounding
            style.pointee.PopupBorderSize = self.popupBorderSize
            style.pointee.FramePadding = self.framePadding.convertToVec2()
            style.pointee.FrameRounding = self.frameRounding
            style.pointee.FrameBorderSize = self.frameBorderSize
            style.pointee.ItemSpacing = self.itemSpacing.convertToVec2()
            style.pointee.ItemInnerSpacing = self.itemInnerSpacing.convertToVec2()
            style.pointee.TouchExtraPadding = self.touchExtraPadding.convertToVec2()
            style.pointee.IndentSpacing = self.indentSpacing
            style.pointee.ColumnsMinSpacing = self.columnsMinSpacing
            style.pointee.ScrollbarSize = self.scrollbarSize
            style.pointee.ScrollbarRounding = self.scrollbarRounding
            style.pointee.GrabMinSize = self.grabMinSize
            style.pointee.GrabRounding = self.grabRounding
            style.pointee.TabRounding = self.tabRounding
            style.pointee.TabBorderSize = self.tabBorderSize
            style.pointee.ColorButtonPosition = self.colorButtonPosition.rawValue
            style.pointee.ButtonTextAlign = self.buttonTextAlign.convertToVec2()
            style.pointee.SelectableTextAlign = self.selectableTextAlign.convertToVec2()
            style.pointee.DisplayWindowPadding = self.displayWindowPadding.convertToVec2()
            style.pointee.DisplaySafeAreaPadding = self.displaySafeAreaPadding.convertToVec2()
            style.pointee.MouseCursorScale = self.mouseCursorScale
            style.pointee.AntiAliasedLines = self.antiAliasedLines
            style.pointee.AntiAliasedFill = self.antiAliasedFill
            style.pointee.CurveTessellationTol = self.curveTessellationTol

            colors.forEach { data in
                
                switch data.key {
                    
                case .text: style.pointee.Colors.0 = data.value.convertToVec4()
                case .textDisabled: style.pointee.Colors.1 = data.value.convertToVec4()
                case .windowBg: style.pointee.Colors.2 = data.value.convertToVec4()
                case .childBg: style.pointee.Colors.3 = data.value.convertToVec4()
                case .popupBg: style.pointee.Colors.4 = data.value.convertToVec4()
                case .border: style.pointee.Colors.5 = data.value.convertToVec4()
                case .borderShadow: style.pointee.Colors.6 = data.value.convertToVec4()
                case .frameBg: style.pointee.Colors.7 = data.value.convertToVec4()
                case .frameBgHovered: style.pointee.Colors.8 = data.value.convertToVec4()
                case .frameBgActive: style.pointee.Colors.9 = data.value.convertToVec4()
                case .titleBg: style.pointee.Colors.10 = data.value.convertToVec4()
                case .titleBgActive: style.pointee.Colors.11 = data.value.convertToVec4()
                case .titleBgCollapsed: style.pointee.Colors.12 = data.value.convertToVec4()
                case .menuBarBg: style.pointee.Colors.13 = data.value.convertToVec4()
                case .scrollbarBg: style.pointee.Colors.14 = data.value.convertToVec4()
                case .scrollbarGrab: style.pointee.Colors.15 = data.value.convertToVec4()
                case .scrollbarGrabHovered: style.pointee.Colors.16 = data.value.convertToVec4()
                case .scrollbarGrabActive: style.pointee.Colors.17 = data.value.convertToVec4()
                case .checkMark: style.pointee.Colors.18 = data.value.convertToVec4()
                case .sliderGrab: style.pointee.Colors.19 = data.value.convertToVec4()
                case .sliderGrabActive: style.pointee.Colors.20 = data.value.convertToVec4()
                case .button: style.pointee.Colors.21 = data.value.convertToVec4()
                case .buttonHovered: style.pointee.Colors.22 = data.value.convertToVec4()
                case .buttonActive: style.pointee.Colors.23 = data.value.convertToVec4()
                case .header: style.pointee.Colors.24 = data.value.convertToVec4()
                case .headerHovered: style.pointee.Colors.25 = data.value.convertToVec4()
                case .headerActive: style.pointee.Colors.26 = data.value.convertToVec4()
                case .separator: style.pointee.Colors.27 = data.value.convertToVec4()
                case .separatorHovered: style.pointee.Colors.28 = data.value.convertToVec4()
                case .separatorActive: style.pointee.Colors.29 = data.value.convertToVec4()
                case .resizeGrip: style.pointee.Colors.30 = data.value.convertToVec4()
                case .resizeGripHovered: style.pointee.Colors.31 = data.value.convertToVec4()
                case .resizeGripActive: style.pointee.Colors.32 = data.value.convertToVec4()
                case .tab: style.pointee.Colors.33 = data.value.convertToVec4()
                case .tabHovered: style.pointee.Colors.34 = data.value.convertToVec4()
                case .tabActive: style.pointee.Colors.35 = data.value.convertToVec4()
                case .tabUnfocused: style.pointee.Colors.36 = data.value.convertToVec4()
                case .tabUnfocusedActive: style.pointee.Colors.37 = data.value.convertToVec4()
                case .dockingPreview: style.pointee.Colors.38 = data.value.convertToVec4()
                case .dockingEmptyBg: style.pointee.Colors.39 = data.value.convertToVec4()
                case .plotLines: style.pointee.Colors.40 = data.value.convertToVec4()
                case .plotLinesHovered: style.pointee.Colors.41 = data.value.convertToVec4()
                case .plotHistogram: style.pointee.Colors.42 = data.value.convertToVec4()
                case .plotHistogramHovered: style.pointee.Colors.43 = data.value.convertToVec4()
                case .textSelectedBg: style.pointee.Colors.44 = data.value.convertToVec4()
                case .dragDropTarget: style.pointee.Colors.45 = data.value.convertToVec4()
                case .navHighlight: style.pointee.Colors.46 = data.value.convertToVec4()
                case .navWindowingHighlight: style.pointee.Colors.47 = data.value.convertToVec4()
                case .navWindowingDimBg: style.pointee.Colors.48 = data.value.convertToVec4()
                case .modalWindowDimBg: style.pointee.Colors.49 = data.value.convertToVec4()
                }
            }
        }
    }
}
