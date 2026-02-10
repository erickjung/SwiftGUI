//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A view that iterates over a sequence and renders views for each element.
public struct ForEach<T: Sequence>: GuiView {

    private let data: T
    private let onLoop: (T.Element) -> (any GuiView)?

    public init(_ data: T,
                onLoop: @escaping (T.Element) -> (any GuiView)?) {
        self.data = data
        self.onLoop = onLoop
    }

    public func render() {
        data.forEach {
            onLoop($0)?.render()
        }
    }
}
