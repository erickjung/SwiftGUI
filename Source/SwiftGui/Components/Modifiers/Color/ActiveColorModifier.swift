//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public protocol ActiveColorModifier: class {

    var activeColor: GuiColor? { get set }

    func activeColor(_ color: GuiColor) -> Self
}

public extension ActiveColorModifier {

    func activeColor(_ color: GuiColor) -> Self {

        self.activeColor = color
        return self
    }
}
