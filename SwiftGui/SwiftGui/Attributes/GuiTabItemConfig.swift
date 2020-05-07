//
//  TabItemFlags.swift
//  SwiftGui
//
//  Created by Erick Jung on 07/05/2020.
//  Copyright © 2020 Erick Jung. All rights reserved.
//

import SwiftGuiCore

/// OptionSet with properties for tab item configuration.
/// Represents: `ImGuiTabItemFlags`.
public struct GuiTabItemConfig: OptionSet {

    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    public static let none                         = GuiTabItemConfig(rawValue: 0)
    public static let unsavedDocument              = GuiTabItemConfig(rawValue: 1 << 0)
    public static let setSelected                  = GuiTabItemConfig(rawValue: 1 << 1)
    public static let noCloseWithMiddleMouseButton = GuiTabItemConfig(rawValue: 1 << 2)
    public static let noPushId                     = GuiTabItemConfig(rawValue: 1 << 3)
}
