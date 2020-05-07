//
//  SelectableFlags.swift
//  SwiftGui
//
//  Created by Erick Jung on 07/05/2020.
//  Copyright © 2020 Erick Jung. All rights reserved.
//

import SwiftGuiCore

public struct ImGuiSelectableFlags: OptionSet {

    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    public static let none             = ImGuiSelectableFlags(rawValue: 0)
    public static let dontClosePopups  = ImGuiSelectableFlags(rawValue: 1 << 0)
    public static let spanAllColumns   = ImGuiSelectableFlags(rawValue: 1 << 1)
    public static let allowDoubleClick = ImGuiSelectableFlags(rawValue: 1 << 2)
    public static let disabled         = ImGuiSelectableFlags(rawValue: 1 << 3)
    public static let allowItemOverlap = ImGuiSelectableFlags(rawValue: 1 << 4)
}
