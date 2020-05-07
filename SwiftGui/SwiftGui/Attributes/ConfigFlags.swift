//
//  ImGuiConfigFlags.swift
//  SwiftGuiMac
//
//  Created by Erick Jung on 07/05/2020.
//  Copyright © 2020 Erick Jung. All rights reserved.
//

import SwiftGuiCore

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
