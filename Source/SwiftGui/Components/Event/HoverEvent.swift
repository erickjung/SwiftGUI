//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public protocol HoverEvent: class {

    var onHover: (() -> GuiView?)? { get set }

    func onHover(_ callback: (() -> GuiView?)?) -> Self
}

public extension HoverEvent {

    func onHover(_ callback: (() -> GuiView?)?) -> Self {
        self.onHover = callback
        return self
    }
}
