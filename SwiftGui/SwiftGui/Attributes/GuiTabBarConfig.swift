//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import SwiftGuiCore

/// OptionSet with properties for tabbar configuration.
/// Represents: `ImGuiTabBarFlags`.
public struct GuiTabBarConfig: OptionSet {

    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    public static let none                         = GuiTabBarConfig(rawValue: 0)
    public static let reorderable                  = GuiTabBarConfig(rawValue: 1 << 0)
    public static let autoSelectNewTabs            = GuiTabBarConfig(rawValue: 1 << 1)
    public static let tabListPopupButton           = GuiTabBarConfig(rawValue: 1 << 2)
    public static let noCloseWithMiddleMouseButton = GuiTabBarConfig(rawValue: 1 << 3)
    public static let noTabListScrollingButtons    = GuiTabBarConfig(rawValue: 1 << 4)
    public static let noTooltip                    = GuiTabBarConfig(rawValue: 1 << 5)
    public static let fittingPolicyResizeDown      = GuiTabBarConfig(rawValue: 1 << 6)
    public static let fittingPolicyScroll          = GuiTabBarConfig(rawValue: 1 << 7)
    public static let fittingPolicyMask            = [fittingPolicyResizeDown, fittingPolicyResizeDown]
    public static let fittingPolicyDefault         = fittingPolicyResizeDown
}
