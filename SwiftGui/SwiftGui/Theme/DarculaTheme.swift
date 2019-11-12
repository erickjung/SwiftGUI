//
//  DarculaTheme.swift
//  SwiftGui
//
//  Created by Erick Jung on 11/11/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation

public class DarculaTheme: Theme {
    
    public var colors: [ImGuiCol : SGColor] {
     
        return [
            .text: .white,
            .textDisabled: SGColor(r: 0.54, g: 0.54, b: 0.54, a: 1),
            .windowBg: SGColor(r: 0.23, g: 0.24, b: 0.25, a: 1),
            .childBg: SGColor(r: 0.23, g: 0.24, b: 0.25, a: 1),
            .popupBg: SGColor(r: 0.23, g: 0.24, b: 0.25, a: 1),
            .border: SGColor(r: 0.36, g: 0.36, b: 0.36, a: 1),
            .borderShadow: SGColor(r: 0.15, g: 0.15, b: 0.15, a: 0),
            .frameBg: SGColor(r: 0.27, g: 0.28, b: 0.29, a: 1),
            .frameBgHovered: SGColor(r: 0.27, g: 0.28, b: 0.29, a: 1),
            .frameBgActive: SGColor(r: 0.47, g: 0.47, b: 0.47, a: 0.67),
            .titleBg: SGColor(r: 0.04, g: 0.04, b: 0.04, a: 1),
            .titleBgActive: SGColor(r: 0, g: 0, b: 0, a: 0.51),
            .titleBgCollapsed: SGColor(r: 0.16, g: 0.29, b: 0.48, a: 1),
            .menuBarBg: SGColor(r: 0.27, g: 0.28, b: 0.29, a: 0.8),
            .scrollbarBg: SGColor(r: 0.39, g: 0.4, b: 0.4, a: 0),
            .scrollbarGrab: SGColor(r: 0.39, g: 0.4, b: 0.4, a: 1),
            .scrollbarGrabHovered: SGColor(r: 0.39, g: 0.4, b: 0.4, a: 1),
            .scrollbarGrabActive: SGColor(r: 0.39, g: 0.4, b: 0.4, a: 1),
            .checkMark: SGColor(r: 0.65, g: 0.65, b: 0.65, a: 1),
            .sliderGrab: SGColor(r: 0.7, g: 0.7, b: 0.7, a: 0.62),
            .sliderGrabActive: SGColor(r: 0.3, g: 0.3, b: 0.3, a: 0.84),
            .button: SGColor(r: 0.29, g: 0.31, b: 0.32, a: 1),
            .buttonHovered: SGColor(r: 0.29, g: 0.31, b: 0.32, a: 1),
            .buttonActive: SGColor(r: 0.21, g: 0.34, b: 0.5, a: 1),
            .header: SGColor(r: 0.32, g: 0.33, b: 0.34, a: 1),
            .headerHovered: SGColor(r: 0.30, g: 0.32, b: 0.32, a: 1),
            .headerActive: SGColor(r: 0.47, g: 0.47, b: 0.47, a: 0.67),
            .separator: SGColor(r: 0.31, g: 0.31, b: 0.31, a: 1),
            .separatorHovered: SGColor(r: 0.31, g: 0.31, b: 0.31, a: 1),
            .separatorActive: SGColor(r: 0.31, g: 0.31, b: 0.31, a: 1),
            .resizeGrip: SGColor(r: 1, g: 1, b: 1, a: 0.85),
            .resizeGripHovered: SGColor(r: 1, g: 1, b: 1, a: 0.6),
            .resizeGripActive: SGColor(r: 0.47, g: 0.47, b: 0.47, a: 0.67),
            .tab: SGColor(r: 0.32, g: 0.33, b: 0.34, a: 1),
            .tabHovered: SGColor(r: 0.21, g: 0.34, b: 0.5, a: 1),
            .tabActive: SGColor(r: 0.21, g: 0.34, b: 0.5, a: 1),
            .tabUnfocused: SGColor(r: 0.06, g: 0.53, b: 0.98, a: 0.8),
            .tabUnfocusedActive: SGColor(r: 0.06, g: 0.53, b: 0.98, a: 0.4),
//            .dockingPreview: SGColor(r: 0.14, g: 0.44, b: 0.80, a: 0.78),
//            .dockingEmptyBg: SGColor(r: 0.2, g: 0.2, b: 0.2, a: 1),
            .plotLines: SGColor(r: 0.61, g: 0.61, b: 0.61, a: 1),
            .plotLinesHovered: SGColor(r: 1, g: 0.43, b: 0.35, a: 1),
            .plotHistogram: SGColor(r: 0.9, g: 0.7, b: 0, a: 1),
            .plotHistogramHovered: SGColor(r: 1, g: 0.6, b: 0, a: 1),
            .textSelectedBg: SGColor(r: 0.18, g: 0.39, b: 0.79, a: 0.9),
//            .dragDropTarget: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 0.95),
//            .navHighlight: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 0.80),
//            .navWindowingHighlight: SGColor(r: 0.7, g: 0.7, b: 0.7, a: 0.7),
//            .navWindowingDimBg: SGColor(r: 0.2, g: 0.2, b: 0.2, a: 0.2),
            .modalWindowDimBg: SGColor(r: 0.18, g: 0.39, b: 0.79, a: 1),
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

    public var itemSpacing: SGPoint {
        return SGPoint(x: 8, y: 6.5)
    }

    public init() {}
}
