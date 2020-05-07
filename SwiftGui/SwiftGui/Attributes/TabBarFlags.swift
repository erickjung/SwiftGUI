//
//  TabBarFlags.swift
//  SwiftGui
//
//  Created by Erick Jung on 07/05/2020.
//  Copyright © 2020 Erick Jung. All rights reserved.
//

import SwiftGuiCore

public struct ImGuiTabBarFlags: OptionSet {

    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    public static let none                         = ImGuiTabBarFlags(rawValue: 0)
    public static let reorderable                  = ImGuiTabBarFlags(rawValue: 1 << 0)
    public static let autoSelectNewTabs            = ImGuiTabBarFlags(rawValue: 1 << 1)
    public static let tabListPopupButton           = ImGuiTabBarFlags(rawValue: 1 << 2)
    public static let noCloseWithMiddleMouseButton = ImGuiTabBarFlags(rawValue: 1 << 3)
    public static let noTabListScrollingButtons    = ImGuiTabBarFlags(rawValue: 1 << 4)
    public static let noTooltip                    = ImGuiTabBarFlags(rawValue: 1 << 5)
    public static let fittingPolicyResizeDown      = ImGuiTabBarFlags(rawValue: 1 << 6)
    public static let fittingPolicyScroll          = ImGuiTabBarFlags(rawValue: 1 << 7)
//    public static let fittingPolicyMask
//    public static let fittingPolicyDefault
}
