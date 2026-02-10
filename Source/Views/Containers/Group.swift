//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A container that groups multiple views together without adding visual styling.
public struct Group: GuiView, Modifiable {

    public var modifiers = ViewModifiers()

    private let child: any GuiView

    public init(@GuiBuilder child: () -> any GuiView) {
        self.child = child()
    }

    public func render() {
        withModifiers(modifiers) {
            child.render()
        }
    }
}
