//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public protocol FontModifier: class {

    var fontIndex: Int? { get set }

    func font(_ index: Int) -> Self
}

public extension FontModifier {

    func font(_ index: Int) -> Self {

        self.fontIndex = index
        return self
    }
}
