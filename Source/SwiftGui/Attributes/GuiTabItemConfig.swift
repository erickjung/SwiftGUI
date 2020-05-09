//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

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
