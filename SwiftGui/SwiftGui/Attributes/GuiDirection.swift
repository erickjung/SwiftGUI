//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A cardinal direction.
/// Represents: `ImGuiDir`.
public enum GuiDirection: Int32 {

    case none  = -1
    case left  = 0
    case right = 1
    case up    = 2
    case down  = 3
}
