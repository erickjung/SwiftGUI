//
//  SelectableFlags.swift
//  SwiftGui
//
//  Created by Erick Jung on 07/05/2020.
//  Copyright © 2020 Erick Jung. All rights reserved.
//

import SwiftGuiCore

/// OptionSet with flags for selectables.
/// Represents: `ImGuiSelectableFlags`.
public struct GuiSelectable: OptionSet {

    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    public static let none             = GuiSelectable(rawValue: 0)
    
    /// Clicking this don't close parent popup window
    public static let dontClosePopups  = GuiSelectable(rawValue: 1 << 0)
    
    /// Selectable frame can span all columns (text will still fit in current column)
    public static let spanAllColumns   = GuiSelectable(rawValue: 1 << 1)
    
    /// Generate press events on double clicks too
    public static let allowDoubleClick = GuiSelectable(rawValue: 1 << 2)
    
    /// Cannot be selected, display greyed out text
    public static let disabled         = GuiSelectable(rawValue: 1 << 3)
    public static let allowItemOverlap = GuiSelectable(rawValue: 1 << 4)
}
