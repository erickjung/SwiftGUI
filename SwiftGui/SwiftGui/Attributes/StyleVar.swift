//
//  StyleVar.swift
//  SwiftGui
//
//  Created by Erick Jung on 07/05/2020.
//  Copyright © 2020 Erick Jung. All rights reserved.
//

import Foundation

public enum ImGuiStyleVar: Int32 {
    
    case alpha               // float
    case windowPadding       // ImVec2
    case windowRounding      // float
    case windowBorderSize    // float
    case windowMinSize       // ImVec2
    case windowTitleAlign    // ImVec2
    case childRounding       // float
    case childBorderSize     // float
    case popupRounding       // float
    case popupBorderSize     // float
    case framePadding        // ImVec2
    case frameRounding       // float
    case frameBorderSize     // float
    case itemSpacing         // ImVec2
    case itemInnerSpacing    // ImVec2
    case indentSpacing       // float
    case scrollbarSize       // float
    case scrollbarRounding   // float
    case grabMinSize         // float
    case grabRounding        // float
    case tabRounding         // float
    case buttonTextAlign     // ImVec2
    case selectableTextAlign // ImVec2
}
