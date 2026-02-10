//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A layout view that sets the width of a specific column.
public struct ColumnWidth: GuiView {

    public let index: Int
    public let width: Float

    public init(index: Int,
                width: Float) {
        self.index = index
        self.width = width
    }

    public func render() {
        ImGuiWrapper.setColumnWidth(Int32(self.index), width: self.width)
    }
}
