//
//  ImGuiDockNodeFlags.swift
//  SwiftGui
//
//  Created by Erick Jung on 07/05/2020.
//  Copyright © 2020 Erick Jung. All rights reserved.
//

import SwiftGuiCore

public struct ImGuiDockNodeFlags: OptionSet {

    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    public static let none                   = ImGuiDockNodeFlags(rawValue: 0)
    public static let keepAliveOnly          = ImGuiDockNodeFlags(rawValue: 1 << 0)
    public static let noDockingInCentralNode = ImGuiDockNodeFlags(rawValue: 1 << 2)
    public static let passthruCentralNode    = ImGuiDockNodeFlags(rawValue: 1 << 3)
    public static let noSplit                = ImGuiDockNodeFlags(rawValue: 1 << 4)
    public static let noResize               = ImGuiDockNodeFlags(rawValue: 1 << 5)
    public static let autoHideTabBar         = ImGuiDockNodeFlags(rawValue: 1 << 6)
}
