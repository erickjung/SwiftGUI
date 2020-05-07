//
//  DarculaTheme.swift
//  SwiftGui
//
//  Created by Erick Jung on 11/11/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation

public class DarculaTheme: Theme {
    
    public var colors: [GuiColorProperty : GuiColor] {
     
        return [
            .text: .white,
            .textDisabled: GuiColor(r: 0.54, g: 0.54, b: 0.54, a: 1),
            .windowBg: GuiColor(r: 0.23, g: 0.24, b: 0.25, a: 1),
            .childBg: GuiColor(r: 0.23, g: 0.24, b: 0.25, a: 1),
            .popupBg: GuiColor(r: 0.23, g: 0.24, b: 0.25, a: 1),
            .border: GuiColor(r: 0.36, g: 0.36, b: 0.36, a: 1),
            .borderShadow: GuiColor(r: 0.15, g: 0.15, b: 0.15, a: 0),
            .frameBg: GuiColor(r: 0.27, g: 0.28, b: 0.29, a: 1),
            .frameBgHovered: GuiColor(r: 0.27, g: 0.28, b: 0.29, a: 1),
            .frameBgActive: GuiColor(r: 0.47, g: 0.47, b: 0.47, a: 0.67),
            .titleBg: GuiColor(r: 0.04, g: 0.04, b: 0.04, a: 1),
            .titleBgActive: GuiColor(r: 0, g: 0, b: 0, a: 0.51),
            .titleBgCollapsed: GuiColor(r: 0.16, g: 0.29, b: 0.48, a: 1),
            .menuBarBg: GuiColor(r: 0.27, g: 0.28, b: 0.29, a: 0.8),
            .scrollbarBg: GuiColor(r: 0.39, g: 0.4, b: 0.4, a: 0),
            .scrollbarGrab: GuiColor(r: 0.39, g: 0.4, b: 0.4, a: 1),
            .scrollbarGrabHovered: GuiColor(r: 0.39, g: 0.4, b: 0.4, a: 1),
            .scrollbarGrabActive: GuiColor(r: 0.39, g: 0.4, b: 0.4, a: 1),
            .checkMark: GuiColor(r: 0.65, g: 0.65, b: 0.65, a: 1),
            .sliderGrab: GuiColor(r: 0.7, g: 0.7, b: 0.7, a: 0.62),
            .sliderGrabActive: GuiColor(r: 0.3, g: 0.3, b: 0.3, a: 0.84),
            .button: GuiColor(r: 0.29, g: 0.31, b: 0.32, a: 1),
            .buttonHovered: GuiColor(r: 0.29, g: 0.31, b: 0.32, a: 1),
            .buttonActive: GuiColor(r: 0.21, g: 0.34, b: 0.5, a: 1),
            .header: GuiColor(r: 0.32, g: 0.33, b: 0.34, a: 1),
            .headerHovered: GuiColor(r: 0.30, g: 0.32, b: 0.32, a: 1),
            .headerActive: GuiColor(r: 0.47, g: 0.47, b: 0.47, a: 0.67),
            .separator: GuiColor(r: 0.31, g: 0.31, b: 0.31, a: 1),
            .separatorHovered: GuiColor(r: 0.31, g: 0.31, b: 0.31, a: 1),
            .separatorActive: GuiColor(r: 0.31, g: 0.31, b: 0.31, a: 1),
            .resizeGrip: GuiColor(r: 1, g: 1, b: 1, a: 0.85),
            .resizeGripHovered: GuiColor(r: 1, g: 1, b: 1, a: 0.6),
            .resizeGripActive: GuiColor(r: 0.47, g: 0.47, b: 0.47, a: 0.67),
            .tab: GuiColor(r: 0.32, g: 0.33, b: 0.34, a: 1),
            .tabHovered: GuiColor(r: 0.21, g: 0.34, b: 0.5, a: 1),
            .tabActive: GuiColor(r: 0.21, g: 0.34, b: 0.5, a: 1),
            .tabUnfocused: GuiColor(r: 0.06, g: 0.53, b: 0.98, a: 0.8),
            .tabUnfocusedActive: GuiColor(r: 0.06, g: 0.53, b: 0.98, a: 0.4),
//            .dockingPreview: SGColor(r: 0.14, g: 0.44, b: 0.80, a: 0.78),
//            .dockingEmptyBg: SGColor(r: 0.2, g: 0.2, b: 0.2, a: 1),
            .plotLines: GuiColor(r: 0.61, g: 0.61, b: 0.61, a: 1),
            .plotLinesHovered: GuiColor(r: 1, g: 0.43, b: 0.35, a: 1),
            .plotHistogram: GuiColor(r: 0.9, g: 0.7, b: 0, a: 1),
            .plotHistogramHovered: GuiColor(r: 1, g: 0.6, b: 0, a: 1),
            .textSelectedBg: GuiColor(r: 0.18, g: 0.39, b: 0.79, a: 0.9),
//            .dragDropTarget: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 0.95),
//            .navHighlight: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 0.80),
//            .navWindowingHighlight: SGColor(r: 0.7, g: 0.7, b: 0.7, a: 0.7),
//            .navWindowingDimBg: SGColor(r: 0.2, g: 0.2, b: 0.2, a: 0.2),
            .modalWindowDimBg: GuiColor(r: 0.18, g: 0.39, b: 0.79, a: 1),
        ]
    }
    
    public var windowRounding: Float {
        return 5.3
    }

    public var grabRounding: Float {
        return 2.3
    }

    public var frameRounding: Float {
        return 2.3
    }

    public var scrollbarRounding: Float {
        return 5
    }

    public var frameBorderSize: Float {
        return 1
    }

    public var itemSpacing: GuiPoint {
        return GuiPoint(x: 8, y: 6.5)
    }

    public init() {}
}
