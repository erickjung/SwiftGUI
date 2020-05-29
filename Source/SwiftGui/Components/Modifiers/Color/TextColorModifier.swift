//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public protocol TextColorModifier: class {

    var textColor: GuiColor? { get set }

    func textColor(_ color: GuiColor) -> Self
}

public extension TextColorModifier {

    func textColor(_ color: GuiColor) -> Self {

        self.textColor = color
        return self
    }
}
