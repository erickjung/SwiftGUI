//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public protocol WindowSizeModifier: class {

    var size: GuiSize? { get set }
    var sizeCondition: GuiCondition? { get set }

    func size(_ size: GuiSize, condition: GuiCondition) -> Self
}

public extension WindowSizeModifier {

    func size(_ size: GuiSize, condition: GuiCondition) -> Self {

        self.size = size
        self.sizeCondition = condition
        return self
    }
}
