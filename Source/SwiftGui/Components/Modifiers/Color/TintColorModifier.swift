//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public protocol TintColorModifier: class {

    var tintColor: GuiColor? { get set }

    func tintColor(_ color: GuiColor) -> Self
}

public extension TintColorModifier {

    func tintColor(_ color: GuiColor) -> Self {

        self.tintColor = color
        return self
    }
}
