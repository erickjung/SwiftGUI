//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

//import SwiftGuiCore

/// OptionSet with properties for dock configuration.
/// Represents: `ImGuiDockNodeFlags`.
public struct GuiDockConfig: OptionSet {

    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    public static let none                   = GuiDockConfig(rawValue: 0)
    public static let keepAliveOnly          = GuiDockConfig(rawValue: 1 << 0)
    public static let noDockingInCentralNode = GuiDockConfig(rawValue: 1 << 2)
    public static let passthruCentralNode    = GuiDockConfig(rawValue: 1 << 3)
    public static let noSplit                = GuiDockConfig(rawValue: 1 << 4)
    public static let noResize               = GuiDockConfig(rawValue: 1 << 5)
    public static let autoHideTabBar         = GuiDockConfig(rawValue: 1 << 6)
}
