//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation
//import SwiftGuiCore

/// ColorEdit node.
/// This is an editable node with 3 floats fields.
/// - parameter title: Text for node
/// - parameter colorState: Color state
/// - parameter onChange: Callback for state changing
/// - returns: New node
public func ColorEdit(_ title: String,
                       colorState: GuiColor,
                       onChange: ((GuiColor) -> Void)? = nil) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        var _color = colorState.convertToFloats()
        if ImGuiWrapper.colorEdit3(title, color: &_color, flags: 0) {

            if let onChange = onChange {

                onChange(GuiColor(r: _color[0], g: _color[1], b: _color[2], a: 1.0))
            }
        }
    }
}
