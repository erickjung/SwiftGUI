//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public protocol BorderColorModifier: class {

    var borderColor: GuiColor? { get set }

    func borderColor(_ color: GuiColor) -> Self
}

public extension BorderColorModifier {

    func borderColor(_ color: GuiColor) -> Self {

        self.borderColor = color
        return self
    }
}
