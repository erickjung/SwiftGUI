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
            .windowBg: SGColor(r: 0.94, g: 0.94, b: 0.94, a: 1),
            .childBg: SGColor(r: 0, g: 0, b: 0, a: 0),
            .popupBg: SGColor(r: 1, g: 1, b: 1, a: 0.98),
            .border: SGColor(r: 0, g: 0, b: 0, a: 0.3),
            .borderShadow: SGColor(r: 0, g: 0, b: 0, a: 0),
            .frameBg: SGColor(r: 1, g: 1, b: 1, a: 1),
            .frameBgHovered: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 0.4),
            .frameBgActive: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 0.67),
            .titleBg: SGColor(r: 0.96, g: 0.96, b: 0.96, a: 1),
            .titleBgActive: SGColor(r: 0.82, g: 0.82, b: 0.82, a: 1),
            .titleBgCollapsed: SGColor(r: 1, g: 1, b: 1, a: 0.51),
            .menuBarBg: SGColor(r: 0.86, g: 0.86, b: 0.86, a: 1),
            .scrollbarBg: SGColor(r: 0.98, g: 0.98, b: 0.98, a: 0.53),
            .scrollbarGrab: SGColor(r: 0.69, g: 0.69, b: 0.69, a: 0.80),
            .scrollbarGrabHovered: SGColor(r: 0.49, g: 0.49, b: 0.49, a: 0.80),
            .scrollbarGrabActive: SGColor(r: 0.49, g: 0.49, b: 0.49, a: 1),
            .checkMark: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 1),
            .sliderGrab: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 0.78),
            .sliderGrabActive: SGColor(r: 0.46, g: 0.54, b: 0.80, a: 0.6),
            .button: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 0.4),
            .buttonHovered: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 1),
            .buttonActive: SGColor(r: 0.06, g: 0.53, b: 0.98, a: 1),
            .header: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 0.31),
            .headerHovered: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 0.80),
            .headerActive: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 1),
            .separator: SGColor(r: 0.39, g: 0.39, b: 0.39, a: 0.62),
            .separatorHovered: SGColor(r: 0.14, g: 0.44, b: 0.8, a: 0.78),
            .separatorActive: SGColor(r: 0.14, g: 0.44, b: 0.8, a: 1),
            .resizeGrip: SGColor(r: 0.8, g: 0.8, b: 0.8, a: 0.56),
            .resizeGripHovered: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 0.67),
            .resizeGripActive: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 0.95),
            .tab: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 0.9),
            .tabHovered: SGColor(r: 0.26, g: 0.59, b: 0.98, a: 0.9),
            .tabActive: SGColor(r: 0.06, g: 0.53, b: 0.98, a: 0.6),
            .tabUnfocused: SGColor(r: 0.06, g: 0.53, b: 0.98, a: 0.8),
            .tabUnfocusedActive: SGColor(r: 0.06, g: 0.53, b: 0.98, a: 0.4),
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
    
    public init() {}
}
