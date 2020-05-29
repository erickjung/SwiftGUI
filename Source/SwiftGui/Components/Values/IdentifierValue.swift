//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public protocol IdentifierValue: class {

    var id: String? { get set }

    func identifier(_ value: String) -> Self
}

public extension IdentifierValue {

    func identifier(_ value: String) -> Self {

        self.id = value
        return self
    }
}
