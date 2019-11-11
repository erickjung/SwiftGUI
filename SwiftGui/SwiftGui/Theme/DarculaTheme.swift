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
            .windowBg: SGColor(r: 60/255, g: 63/255, b: 65/255, a: 1),
            .childBg: SGColor(r: 60/255, g: 63/255, b: 65/255, a: 1),
            .popupBg: SGColor(r: 60/255, g: 63/255, b: 65/255, a: 1),
            .border: SGColor(r: 94/255, g: 94/255, b: 94/255, a: 1),
            .borderShadow: SGColor(r: 0.15, g: 0.15, b: 0.15, a: 0),
            .frameBg: SGColor(r: 69/255, g: 73/255, b: 74/255, a: 1),
            .frameBgHovered: SGColor(r: 69/255, g: 73/255, b: 74/255, a: 1),
            .frameBgActive: SGColor(r: 0.47, g: 0.47, b: 0.47, a: 0.67),
            .titleBg: SGColor(r: 0.04, g: 0.04, b: 0.04, a: 1),
            .titleBgActive: SGColor(r: 0, g: 0, b: 0, a: 0.51),
            .titleBgCollapsed: SGColor(r: 0.16, g: 0.29, b: 0.48, a: 1),
            .menuBarBg: SGColor(r: 0.27, g: 0.28, b: 0.29, a: 0.8),
            .scrollbarBg: SGColor(r: 100/255, g: 102/255, b: 102/255, a: 0),
            .scrollbarGrab: SGColor(r: 100/255, g: 102/255, b: 102/255, a: 1),
            .scrollbarGrabHovered: SGColor(r: 100/255, g: 102/255, b: 102/255, a: 1),
            .scrollbarGrabActive: SGColor(r: 100/255, g: 102/255, b: 102/255, a: 1),
            .checkMark: SGColor(r: 167/255, g: 167/255, b: 167/255, a: 1),
            .sliderGrab: SGColor(r: 0.7, g: 0.7, b: 0.7, a: 0.62),
            .sliderGrabActive: SGColor(r: 0.3, g: 0.3, b: 0.3, a: 0.84),
            .button: SGColor(r: 76/255, g: 80/255, b: 82/255, a: 1),
            .buttonHovered: SGColor(r: 76/255, g: 80/255, b: 82/255, a: 1),
            .buttonActive: SGColor(r: 54/255, g: 88/255, b: 128/255, a: 1),
            .header: SGColor(r: 82/255, g: 85/255, b: 87/255, a: 1),
            .headerHovered: SGColor(r: 79/255, g: 82/255, b: 84/255, a: 1),
            .headerActive: SGColor(r: 0.47, g: 0.47, b: 0.47, a: 0.67),
            .separator: SGColor(r: 81/255, g: 81/255, b: 81/255, a: 1),
            .separatorHovered: SGColor(r: 81/255, g: 81/255, b: 81/255, a: 1),
            .separatorActive: SGColor(r: 81/255, g: 81/255, b: 81/255, a: 1),
            .resizeGrip: SGColor(r: 1, g: 1, b: 1, a: 0.85),
            .resizeGripHovered: SGColor(r: 1, g: 1, b: 1, a: 0.6),
            .resizeGripActive: SGColor(r: 0.47, g: 0.47, b: 0.47, a: 0.67),
            .tab: SGColor(r: 82/255, g: 85/255, b: 87/255, a: 1),
            .tabHovered: SGColor(r: 54/255, g: 88/255, b: 128/255, a: 1),
            .tabActive: SGColor(r: 54/255, g: 88/255, b: 128/255, a: 1),
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
            .modalWindowDimBg: SGColor(r: 47/255, g: 101/255, b: 202/255, a: 1),
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
