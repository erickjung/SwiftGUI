//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public protocol SelectionColorModifier: class {

    var selectionColor: GuiColor? { get set }

    func selectionColor(_ color: GuiColor) -> Self
}

public extension SelectionColorModifier {

    func selectionColor(_ color: GuiColor) -> Self {

        self.selectionColor = color
        return self
    }
}
