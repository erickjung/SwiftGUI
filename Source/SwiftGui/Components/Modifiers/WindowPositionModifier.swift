//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public protocol WindowPositionModifier: class {

    var position: GuiPoint? { get set }
    var positionCondition: GuiCondition? { get set }

    func position(_ position: GuiPoint, condition: GuiCondition) -> Self
}

public extension WindowPositionModifier {

    func position(_ position: GuiPoint, condition: GuiCondition) -> Self {

        self.position = position
        self.positionCondition = condition
        return self
    }
}
