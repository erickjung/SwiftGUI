//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class LightTheme: Theme {

    public var colors: [GuiColorProperty : GuiColor] {

        return [
            .text: GuiColor(r: 0, g: 0, b: 0, a: 1),
            .textDisabled: GuiColor(r: 0.6, g: 0.6, b: 0.6, a: 1),
            .windowBg: GuiColor(r: 0.95, g: 0.95, b: 0.95, a: 1),
            .childBg: GuiColor(r: 0, g: 0, b: 0, a: 0),
            .popupBg: GuiColor(r: 0.92, g: 0.92, b: 0.92, a: 1),
            .border: GuiColor(r: 0.8, g: 0.8, b: 0.8, a: 1),
            .borderShadow: GuiColor(r: 0, g: 0, b: 0, a: 0),
            .frameBg: .white,
            .frameBgHovered: .white,
            .frameBgActive: GuiColor(r: 0.98, g: 0.98, b: 0.98, a: 1),
            .titleBg: GuiColor(r: 0.92, g: 0.92, b: 0.92, a: 1),
            .titleBgActive: GuiColor(r: 0.82, g: 0.82, b: 0.82, a: 1),
            .titleBgCollapsed: GuiColor(r: 1, g: 1, b: 1, a: 0.51),
            .menuBarBg: GuiColor(r: 0.90, g: 0.90, b: 0.90, a: 1),
            .scrollbarBg: GuiColor(r: 0.98, g: 0.98, b: 0.98, a: 0),
            .scrollbarGrab: GuiColor(r: 0.5, g: 0.5, b: 0.5, a: 1),
            .scrollbarGrabHovered: GuiColor(r: 0.5, g: 0.5, b: 0.5, a: 1),
            .scrollbarGrabActive: GuiColor(r: 0.5, g: 0.5, b: 0.5, a: 1),
            .checkMark: GuiColor(r: 0.26, g: 0.59, b: 0.98, a: 0.80),
            .sliderGrab: GuiColor(r: 0.26, g: 0.59, b: 0.98, a: 0.80),
            .sliderGrabActive: GuiColor(r: 0.26, g: 0.59, b: 0.98, a: 0.80),
            .button: .white,
            .buttonHovered: .white,
            .buttonActive: GuiColor(r: 0.22, g: 0.59, b: 0.98, a: 0.8),
            .header: GuiColor(r: 0.26, g: 0.59, b: 0.98, a: 0.31),
            .headerHovered: GuiColor(r: 0.26, g: 0.59, b: 0.98, a: 0.80),
            .headerActive: GuiColor(r: 0.26, g: 0.59, b: 0.98, a: 1),
            .separator: GuiColor(r: 0.8, g: 0.8, b: 0.8, a: 1),
            .separatorHovered: GuiColor(r: 0.8, g: 0.8, b: 0.8, a: 1),
            .separatorActive: GuiColor(r: 0.8, g: 0.8, b: 0.8, a: 1),
            .resizeGrip: GuiColor(r: 0.8, g: 0.8, b: 0.8, a: 1),
            .resizeGripHovered: .white,
            .resizeGripActive: .white,
            .tab: GuiColor(r: 0.26, g: 0.59, b: 0.98, a: 0.31),
            .tabHovered: GuiColor(r: 0.22, g: 0.59, b: 0.98, a: 1),
            .tabActive: GuiColor(r: 0.22, g: 0.59, b: 0.98, a: 1),
            .tabUnfocused: GuiColor(r: 0.22, g: 0.59, b: 0.98, a: 0.3),
            .tabUnfocusedActive: GuiColor(r: 0.22, g: 0.59, b: 0.98, a: 0.3),
            .dockingPreview: GuiColor(r: 0.14, g: 0.44, b: 0.80, a: 0.78),
            .dockingEmptyBg: GuiColor(r: 0.2, g: 0.2, b: 0.2, a: 1),
            .plotLines: GuiColor(r: 0.39, g: 0.39, b: 0.39, a: 1),
            .plotLinesHovered: GuiColor(r: 1, g: 0.43, b: 0.35, a: 1),
            .plotHistogram: GuiColor(r: 0.9, g: 0.7, b: 0, a: 1),
            .plotHistogramHovered: GuiColor(r: 1, g: 0.45, b: 0, a: 1),
            .textSelectedBg: GuiColor(r: 0.26, g: 0.59, b: 0.98, a: 0.35),
            .dragDropTarget: GuiColor(r: 0.26, g: 0.59, b: 0.98, a: 0.95),
            .navHighlight: GuiColor(r: 0.26, g: 0.59, b: 0.98, a: 0.80),
            .navWindowingHighlight: GuiColor(r: 0.7, g: 0.7, b: 0.7, a: 0.7),
            .navWindowingDimBg: GuiColor(r: 0.2, g: 0.2, b: 0.2, a: 0.2),
            .modalWindowDimBg: GuiColor(r: 0.2, g: 0.2, b: 0.2, a: 0.35)
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
