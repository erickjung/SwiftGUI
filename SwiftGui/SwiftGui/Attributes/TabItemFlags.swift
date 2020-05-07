//
//  TabItemFlags.swift
//  SwiftGui
//
//  Created by Erick Jung on 07/05/2020.
//  Copyright © 2020 Erick Jung. All rights reserved.
//

import SwiftGuiCore

public struct ImGuiTabItemFlags: OptionSet {

    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    public static let none                         = ImGuiTabItemFlags(rawValue: 0)
    public static let unsavedDocument              = ImGuiTabItemFlags(rawValue: 1 << 0)
    public static let setSelected                  = ImGuiTabItemFlags(rawValue: 1 << 1)
    public static let noCloseWithMiddleMouseButton = ImGuiTabItemFlags(rawValue: 1 << 2)
    public static let noPushId                     = ImGuiTabItemFlags(rawValue: 1 << 3)
}
