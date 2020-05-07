//
//  Dir.swift
//  SwiftGui
//
//  Created by Erick Jung on 07/05/2020.
//  Copyright © 2020 Erick Jung. All rights reserved.
//

import Foundation

/// A cardinal direction.
/// Represents: `ImGuiDir`.
public enum GuiDirection: Int32
{
    case none  = -1
    case left  = 0
    case right = 1
    case up    = 2
    case down  = 3
}
