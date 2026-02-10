//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A layout view that draws a horizontal separator line.
public struct Divider: GuiView {

    public init() {}

    public func render() {
        ImGuiWrapper.separator()
    }
}
