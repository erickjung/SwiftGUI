//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A container view that renders multiple child views in sequence.
/// Used by GuiBuilder for multi-statement blocks and arrays.
public struct GuiNodeList: GuiView {

    let children: [any GuiView]

    init(children: [any GuiView]) {
        self.children = children
    }

    public func render() {
        self.children.forEach { $0.render() }
    }
}
