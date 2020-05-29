//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public protocol SizeModifier: class {

    var size: GuiSize? { get set }

    func size(_ size: GuiSize) -> Self
}

public extension SizeModifier {

    func size(_ size: GuiSize) -> Self {

        self.size = size
        return self
    }
}
