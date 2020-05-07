//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A variable identifier for styling.
/// Represents: `ImGuiStyleVar`.
public enum GuiStyleProperty: Int32 {

    /// Expected float
    case alpha

    /// Expected ImVec2
    case windowPadding

    /// Expected float
    case windowRounding

    /// Expected float
    case windowBorderSize

    /// Expected ImVec2
    case windowMinSize

    /// Expected ImVec2
    case windowTitleAlign

    /// Expected float
    case childRounding

    /// Expected float
    case childBorderSize

    /// Expected float
    case popupRounding

    /// Expected float
    case popupBorderSize

    /// Expected ImVec2
    case framePadding

    /// Expected float
    case frameRounding

    /// Expected float
    case frameBorderSize

    /// Expected ImVec2
    case itemSpacing

    /// Expected ImVec2
    case itemInnerSpacing

    /// Expected float
    case indentSpacing

    /// Expected float
    case scrollbarSize

    /// Expected float
    case scrollbarRounding

    /// Expected float
    case grabMinSize

    /// Expected float
    case grabRounding

    /// Expected float
    case tabRounding

    /// Expected ImVec2
    case buttonTextAlign

    /// Expected ImVec2
    case selectableTextAlign
}
