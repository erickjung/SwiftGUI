//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class ForEach<T:Sequence>: GuiView {

    private var data: T
    private var onLoop: (T.Element) -> GuiView?

    public init(_ data: T,
                onLoop: @escaping (T.Element) -> GuiView?) {

        self.data = data
        self.onLoop = onLoop
    }

    public func render() {

        data.forEach {

            onLoop($0)?.render()
        }
    }
}
