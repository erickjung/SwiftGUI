//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class SameLine: GuiView {

    public var offsetX: GuiPoint
    public var spacing: Float

    public init(offsetX: GuiPoint = .zero,
                spacing: Float = -1.0) {

        self.offsetX = offsetX
        self.spacing = spacing
    }

    public func render() {

        ImGuiWrapper.sameLine(Float(self.offsetX.x), spacing: self.spacing)
    }
}
