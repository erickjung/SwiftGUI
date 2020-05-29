//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public protocol BackgroundColorModifier: class {

    var backgroundColor: GuiColor? { get set }

    func backgroundColor(_ color: GuiColor) -> Self
}

public extension BackgroundColorModifier {

    func backgroundColor(_ color: GuiColor) -> Self {

        self.backgroundColor = color
        return self
    }
}
