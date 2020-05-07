//
//  GuiConfig.swift
//  SwiftGui
//
//  Created by Erick Jung on 07/05/2020.
//  Copyright © 2020 Erick Jung. All rights reserved.
//

import SwiftGuiCore

/// OptionSet with properties for global configuration.
/// Represents: `ImGuiConfigFlags`.
public struct GuiConfig: OptionSet {

    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    public static let none                    = GuiConfig(rawValue: 0)
    
    /// Master keyboard navigation enable flag.
    public static let navEnableKeyboard       = GuiConfig(rawValue: 1 << 0)
    
    /// Master gamepad navigation enable flag.
    public static let navEnableGamepad        = GuiConfig(rawValue: 1 << 1)
    
    /// Instruct navigation to move the mouse cursor. May be useful on TV/console systems where moving a virtual mouse is awkward.
    public static let navEnableSetMousePos    = GuiConfig(rawValue: 1 << 2)
    
    /// Instruct navigation to not set the want_capture_keyboard flag when nav_active is set.
    public static let navNoCaptureKeyboard    = GuiConfig(rawValue: 1 << 3)
    
    /// Instruct imgui to clear mouse position/buttons on a new frame. This allows ignoring the mouse information set by the back-end.
    public static let noMouse                 = GuiConfig(rawValue: 1 << 4)
    
    /// Instruct back-end to not alter mouse cursor shape and visibility.
    public static let noMouseCursorChange     = GuiConfig(rawValue: 1 << 5)
    
    // TODO
    public static let dockingEnable           = GuiConfig(rawValue: 1 << 6)
    public static let viewportsEnable         = GuiConfig(rawValue: 1 << 10)
    public static let dpiEnableScaleViewports = GuiConfig(rawValue: 1 << 14)
    public static let dpiEnableScaleFonts     = GuiConfig(rawValue: 1 << 15)
    
    /// Application is SRGB-aware.
    public static let isSRGB                  = GuiConfig(rawValue: 1 << 20)
    
    /// Application is using a touch screen instead of a mouse.
    public static let isTouchScreen           = GuiConfig(rawValue: 1 << 21)
}
