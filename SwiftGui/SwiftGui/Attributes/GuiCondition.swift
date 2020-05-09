//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

//import SwiftGuiCore

/// OptionSet with properties for condition flags.
/// Represents: `ImGuiCond`.
public struct GuiCondition: OptionSet {

    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    /// Set the variable always
    public static let always       = GuiCondition(rawValue: 1 << 0)

    /// Set the variable once per runtime session (only the first call with succeed)
    public static let once         = GuiCondition(rawValue: 1 << 1)

    /// Set the variable if the object/window has no persistently saved data (no entry in .ini file)
    public static let firstUseEver = GuiCondition(rawValue: 1 << 2)

    /// Set the variable if the object/window is appearing after being hidden/inactive (or the first time)
    public static let appearing    = GuiCondition(rawValue: 1 << 3)
}
