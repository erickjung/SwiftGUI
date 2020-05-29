//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public protocol PaddingModifier: class {

    var padding: GuiEdge? { get set }
    var paddingValue: Double? { get set }

    func padding(_ edge: GuiEdge, value: Double) -> Self
}

public extension PaddingModifier {

    func padding(_ edge: GuiEdge = .all, value: Double) -> Self {

        self.padding = edge
        self.paddingValue = value
        return self
    }
}
