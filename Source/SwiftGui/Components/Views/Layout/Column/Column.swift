//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class Column: GuiView, IdentifierValue {

    public var id: String?
    public var count: Int
    public var border: Bool

    public init(count: Int = 1,
                border: Bool = true) {

        self.count = count
        self.border = border
    }

    public func render() {

        ImGuiWrapper.columns(Int32(self.count), strId: self.id ?? "##column", border: self.border)
    }
}
