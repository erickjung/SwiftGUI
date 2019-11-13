//
//  LightTheme.swift
//  SwiftGui
//
//  Created by Erick Jung on 11/11/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation

public class LightTheme: Theme {
    
    public var colors: [ImGuiCol : SGColor] {
     
        return [
            .text: SGColor(r: 0, g: 0, b: 0, a: 1),
            .textDisabled: SGColor(r: 0.6, g: 0.6, b: 0.6, a: 1),
            .windowBg: SGColor(r: 0.95, g: 0.95, b: 0.95, a: 1),
            .childBg: SGColor(r: 0, g: 0, b: 0, a: 0),
            .popupBg: SGColor(r: 0.92, g: 0.92, b: 0.92, a: 1),
            .border: SGColor(r: 0.8, g: 0.8, b: 0.8, a: 1),
            .borderShadow: SGColor(r: 0, g: 0, b: 0, a: 0),
            .frameBg: .white,
            .frameBgHovered: .white,
            .frameBgActive: SGColor(r: 0.98, g: 0.98, b: 0.98, a: 1),
            .titleBg: SGColor(r: 0.92, g: 0.92, b: 0.92, a: 1),
            .titleBgActive: SGColor(r: 0.82, g: 0.82, b: 0.82, a: 1),
            .titleBgCollapsed: SGColor(r: 1, g: 1, b: 1, a: 0.51),
            .menuBarBg: SGColor(r: 0.90, g: 0.90, b: 0.90, a: 1),
            .scrollbarBg: SGColor(r: 0.98, g: 0.98, b: 0.98, a: 0),
            .scrollbarGrab: SGColor(r: 0.5, g: 0.5, b: 0.5, a: 1),
            .scrollbarGrabHovered: SGColor(r: 0.5, g: 0.5, b: 0.5, a: 1),
            .scrollbarGrabActive: SGColor(r: 0.5, g: 0.5, b: 0.5, a: 1),
            .checkMark: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 0.80),
            .sliderGrab: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 0.80),
            .sliderGrabActive: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 0.80),
            .button: .white,
            .buttonHovered: .white,
            .buttonActive: SGColor(r: 0.22, g: 0.59, b: 0.98, a: 0.8),
            .header: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 0.31),
            .headerHovered: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 0.80),
            .headerActive: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 1),
            .separator: SGColor(r: 0.8, g: 0.8, b: 0.8, a: 1),
            .separatorHovered: SGColor(r: 0.8, g: 0.8, b: 0.8, a: 1),
            .separatorActive: SGColor(r: 0.8, g: 0.8, b: 0.8, a: 1),
            .resizeGrip: SGColor(r: 0.8, g: 0.8, b: 0.8, a: 1),
            .resizeGripHovered: .white,
            .resizeGripActive: .white,
            .tab: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 0.31),
            .tabHovered: SGColor(r: 0.22, g: 0.59, b: 0.98, a: 1),
            .tabActive: SGColor(r: 0.22, g: 0.59, b: 0.98, a: 1),
            .tabUnfocused: SGColor(r: 0.22, g: 0.59, b: 0.98, a: 0.3),
            .tabUnfocusedActive: SGColor(r: 0.22, g: 0.59, b: 0.98, a: 0.3),
            .dockingPreview: SGColor(r: 0.14, g: 0.44, b: 0.80, a: 0.78),
            .dockingEmptyBg: SGColor(r: 0.2, g: 0.2, b: 0.2, a: 1),
            .plotLines: SGColor(r: 0.39, g: 0.39, b: 0.39, a: 1),
            .plotLinesHovered: SGColor(r: 1, g: 0.43, b: 0.35, a: 1),
            .plotHistogram: SGColor(r: 0.9, g: 0.7, b: 0, a: 1),
            .plotHistogramHovered: SGColor(r: 1, g: 0.45, b: 0, a: 1),
            .textSelectedBg: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 0.35),
            .dragDropTarget: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 0.95),
            .navHighlight: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 0.80),
            .navWindowingHighlight: SGColor(r: 0.7, g: 0.7, b: 0.7, a: 0.7),
            .navWindowingDimBg: SGColor(r: 0.2, g: 0.2, b: 0.2, a: 0.2),
            .modalWindowDimBg: SGColor(r: 0.2, g: 0.2, b: 0.2, a: 0.35),
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
