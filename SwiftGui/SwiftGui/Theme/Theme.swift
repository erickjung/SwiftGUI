//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public protocol Theme {

    var colors: [GuiColorProperty: GuiColor] { get }

    /// Global alpha applies to everything in ImGui
    var alpha: Float { get }

    /// Padding within a window
    var windowPadding: GuiPoint { get }

    /// Radius of window corners rounding. Set to 0.0f to have rectangular windows
    var windowRounding: Float { get }

    /// Thickness of border around windows. Generally set to 0.0f or 1.0f. Other values not well tested.
    var windowBorderSize: Float { get }

    /// Minimum window size
    var windowMinSize: GuiSize { get }

    /// Alignment for title bar text
    var windowTitleAlign: GuiPoint { get }

    /// Position of the collapsing/docking button in the title bar (left/right). Defaults to GuiDirection Left.
    var windowMenuButtonPosition: GuiDirection { get }

    /// Radius of child window corners rounding. Set to 0.0f to have rectangular child windows
    var childRounding: Float { get }

    /// Thickness of border around child windows. Generally set to 0.0f or 1.0f. Other values not well tested.
    var childBorderSize: Float { get }

    /// Radius of popup window corners rounding. Set to 0.0f to have rectangular child windows
    var popupRounding: Float { get }

    /// Thickness of border around popup or tooltip windows. Generally set to 0.0f or 1.0f. Other values not well tested.
    var popupBorderSize: Float { get }

    /// Padding within a framed rectangle (used by most widgets)
    var framePadding: GuiPoint { get }

    /// Radius of frame corners rounding. Set to 0.0f to have rectangular frames (used by most widgets).
    var frameRounding: Float { get }

    /// Thickness of border around frames. Generally set to 0.0f or 1.0f. Other values not well tested.
    var frameBorderSize: Float { get }

    /// Horizontal and vertical spacing between widgets/lines
    var itemSpacing: GuiPoint { get }

    /// Horizontal and vertical spacing between within elements of a composed widget (e.g. a slider and its label)
    var itemInnerSpacing: GuiPoint { get }

    /// Expand reactive bounding box for touch-based system where touch position is not accurate enough. Unfortunately we don't sort widgets so priority on overlap will always be given to the first widget. So don't grow this too much!
    var touchExtraPadding: GuiPoint { get }

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

    /// Side of the color button in the ColorEdit4 widget (left/right). Defaults to GuiDirection Right.
    var colorButtonPosition: GuiDirection { get }

    /// Alignment of button text when button is larger than text.
    var buttonTextAlign: GuiPoint { get }

    /// Alignment of selectable text when button is larger than text.
    var selectableTextAlign: GuiPoint { get }

    /// Window position are clamped to be visible within the display area or monitors by at least this amount. Only applies to regular windows.
    var displayWindowPadding: GuiPoint { get }

    /// If you cannot see the edge of your screen (e.g. on a TV) increase the safe area padding. Covers popups/tooltips as well regular windows.
    var displaySafeAreaPadding: GuiPoint { get }

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

    public var windowPadding: GuiPoint {
        return GuiPoint(x: 8, y: 8)
    }

    public var windowRounding: Float {
        return 7
    }

    public var windowBorderSize: Float {
        return 1
    }

    public var windowMinSize: GuiSize {
        return GuiSize(width: 32, height: 32)
    }

    public var windowTitleAlign: GuiPoint {
        return GuiPoint(x: 0, y: 0.5)
    }

    public var windowMenuButtonPosition: GuiDirection {
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

    public var framePadding: GuiPoint {
        return GuiPoint(x: 4, y: 3)
    }

    public var frameRounding: Float {
        return 0
    }

    public var frameBorderSize: Float {
        return 0
    }

    public var itemSpacing: GuiPoint {
        return GuiPoint(x: 8, y: 4)
    }

    public var itemInnerSpacing: GuiPoint {
        return GuiPoint(x: 4, y: 4)
    }

    public var touchExtraPadding: GuiPoint {
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

    public var colorButtonPosition: GuiDirection {
        return .right
    }

    public var buttonTextAlign: GuiPoint {
        return GuiPoint(x: 0.5, y: 0.5)
    }

    public var selectableTextAlign: GuiPoint {
        return .zero
    }

    public var displayWindowPadding: GuiPoint {
        return GuiPoint(x: 19, y: 19)
    }

    public var displaySafeAreaPadding: GuiPoint {
        return GuiPoint(x: 3, y: 3)
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

        ImGuiStyleWrapper.alpha(self.alpha)
        ImGuiStyleWrapper.windowPadding(self.windowPadding)
        ImGuiStyleWrapper.windowRounding(self.windowRounding)
        ImGuiStyleWrapper.windowMinSize(self.windowMinSize)
        ImGuiStyleWrapper.windowTitleAlign(self.windowTitleAlign)
        ImGuiStyleWrapper.windowMenuButtonPosition(self.windowMenuButtonPosition.rawValue)
        ImGuiStyleWrapper.childRounding(self.childRounding)
        ImGuiStyleWrapper.childBorderSize(self.childBorderSize)
        ImGuiStyleWrapper.popupRounding(self.popupRounding)
        ImGuiStyleWrapper.popupBorderSize(self.popupBorderSize)
        ImGuiStyleWrapper.framePadding(self.framePadding)
        ImGuiStyleWrapper.frameRounding(self.frameRounding)
        ImGuiStyleWrapper.frameBorderSize(self.frameBorderSize)
        ImGuiStyleWrapper.itemSpacing(self.itemSpacing)
        ImGuiStyleWrapper.itemInnerSpacing(self.itemInnerSpacing)
        ImGuiStyleWrapper.touchExtraPadding(self.touchExtraPadding)
        ImGuiStyleWrapper.indentSpacing(self.indentSpacing)
        ImGuiStyleWrapper.columnsMinSpacing(self.columnsMinSpacing)
        ImGuiStyleWrapper.scrollbarSize(self.scrollbarSize)
        ImGuiStyleWrapper.scrollbarRounding(self.scrollbarRounding)
        ImGuiStyleWrapper.grabMinSize(self.grabMinSize)
        ImGuiStyleWrapper.grabRounding(self.grabRounding)
        ImGuiStyleWrapper.tabRounding(self.tabRounding)
        ImGuiStyleWrapper.tabBorderSize(self.tabBorderSize)
        ImGuiStyleWrapper.colorButtonPosition(self.colorButtonPosition.rawValue)
        ImGuiStyleWrapper.buttonTextAlign(self.buttonTextAlign)
        ImGuiStyleWrapper.selectableTextAlign(self.selectableTextAlign)
        ImGuiStyleWrapper.displayWindowPadding(self.displayWindowPadding)
        ImGuiStyleWrapper.displaySafeAreaPadding(self.displaySafeAreaPadding)
        ImGuiStyleWrapper.mouseCursorScale(self.mouseCursorScale)
        ImGuiStyleWrapper.antiAliasedLines(self.antiAliasedLines)
        ImGuiStyleWrapper.antiAliasedFill(self.antiAliasedFill)
        ImGuiStyleWrapper.curveTessellationTol(self.curveTessellationTol)

        colors.forEach { data in

            switch data.key {

            case .text: ImGuiStyleWrapper.colorText(data.value.cgColor)
            case .textDisabled: ImGuiStyleWrapper.colorTextDisabled(data.value.cgColor)
            case .windowBg: ImGuiStyleWrapper.colorWindowBg(data.value.cgColor)
            case .childBg: ImGuiStyleWrapper.colorChildBg(data.value.cgColor)
            case .popupBg: ImGuiStyleWrapper.colorPopupBg(data.value.cgColor)
            case .border: ImGuiStyleWrapper.colorBorder(data.value.cgColor)
            case .borderShadow: ImGuiStyleWrapper.colorBorderShadow(data.value.cgColor)
            case .frameBg: ImGuiStyleWrapper.colorFrameBg(data.value.cgColor)
            case .frameBgHovered: ImGuiStyleWrapper.colorFrameBgHovered(data.value.cgColor)
            case .frameBgActive: ImGuiStyleWrapper.colorFrameBgActive(data.value.cgColor)
            case .titleBg: ImGuiStyleWrapper.colorTitleBg(data.value.cgColor)
            case .titleBgActive: ImGuiStyleWrapper.colorTitleBgActive(data.value.cgColor)
            case .titleBgCollapsed: ImGuiStyleWrapper.colorTitleBgCollapsed(data.value.cgColor)
            case .menuBarBg: ImGuiStyleWrapper.colorMenuBarBg(data.value.cgColor)
            case .scrollbarBg: ImGuiStyleWrapper.colorScrollbarBg(data.value.cgColor)
            case .scrollbarGrab: ImGuiStyleWrapper.colorScrollbarGrab(data.value.cgColor)
            case .scrollbarGrabHovered: ImGuiStyleWrapper.colorScrollbarGrabHovered(data.value.cgColor)
            case .scrollbarGrabActive: ImGuiStyleWrapper.colorScrollbarGrabActive(data.value.cgColor)
            case .checkMark: ImGuiStyleWrapper.colorCheckMark(data.value.cgColor)
            case .sliderGrab: ImGuiStyleWrapper.colorSliderGrab(data.value.cgColor)
            case .sliderGrabActive: ImGuiStyleWrapper.colorSliderGrabActive(data.value.cgColor)
            case .button: ImGuiStyleWrapper.colorButton(data.value.cgColor)
            case .buttonHovered: ImGuiStyleWrapper.colorButtonHovered(data.value.cgColor)
            case .buttonActive: ImGuiStyleWrapper.colorButtonActive(data.value.cgColor)
            case .header: ImGuiStyleWrapper.colorHeader(data.value.cgColor)
            case .headerHovered: ImGuiStyleWrapper.colorHeaderHovered(data.value.cgColor)
            case .headerActive: ImGuiStyleWrapper.colorHeaderActive(data.value.cgColor)
            case .separator: ImGuiStyleWrapper.colorSeparator(data.value.cgColor)
            case .separatorHovered: ImGuiStyleWrapper.colorSeparatorHovered(data.value.cgColor)
            case .separatorActive: ImGuiStyleWrapper.colorSeparatorActive(data.value.cgColor)
            case .resizeGrip: ImGuiStyleWrapper.colorResizeGrip(data.value.cgColor)
            case .resizeGripHovered: ImGuiStyleWrapper.colorResizeGripHovered(data.value.cgColor)
            case .resizeGripActive: ImGuiStyleWrapper.colorResizeGripActive(data.value.cgColor)
            case .tab: ImGuiStyleWrapper.colorTab(data.value.cgColor)
            case .tabHovered: ImGuiStyleWrapper.colorTabHovered(data.value.cgColor)
            case .tabActive: ImGuiStyleWrapper.colorTabActive(data.value.cgColor)
            case .tabUnfocused: ImGuiStyleWrapper.colorTabUnfocused(data.value.cgColor)
            case .tabUnfocusedActive: ImGuiStyleWrapper.colorTabUnfocusedActive(data.value.cgColor)
            case .dockingPreview: ImGuiStyleWrapper.colorDockingPreview(data.value.cgColor)
            case .dockingEmptyBg: ImGuiStyleWrapper.colorDockingEmptyBg(data.value.cgColor)
            case .plotLines: ImGuiStyleWrapper.colorPlotLines(data.value.cgColor)
            case .plotLinesHovered: ImGuiStyleWrapper.colorPlotLinesHovered(data.value.cgColor)
            case .plotHistogram: ImGuiStyleWrapper.colorPlotHistogram(data.value.cgColor)
            case .plotHistogramHovered: ImGuiStyleWrapper.colorPlotHistogramHovered(data.value.cgColor)
            case .textSelectedBg: ImGuiStyleWrapper.colorTextSelectedBg(data.value.cgColor)
            case .dragDropTarget: ImGuiStyleWrapper.colorDragDropTarget(data.value.cgColor)
            case .navHighlight: ImGuiStyleWrapper.colorNavHighlight(data.value.cgColor)
            case .navWindowingHighlight: ImGuiStyleWrapper.colorNavWindowingHighlight(data.value.cgColor)
            case .navWindowingDimBg: ImGuiStyleWrapper.colorNavWindowingDimBg(data.value.cgColor)
            case .modalWindowDimBg: ImGuiStyleWrapper.colorModalWindowDimBg(data.value.cgColor)
            }
        }
    }
}
