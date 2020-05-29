//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public protocol HoveredColorModifier: class {

    var hoveredColor: GuiColor? { get set }

    func hoveredColor(_ color: GuiColor) -> Self
}

public extension HoveredColorModifier {

    func hoveredColor(_ color: GuiColor) -> Self {

        self.hoveredColor = color
        return self
    }
}
