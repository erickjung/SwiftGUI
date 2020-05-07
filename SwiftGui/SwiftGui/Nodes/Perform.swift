//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// Perform node.
/// NOTE: This can be usefull to execute arbitrary code on UI loop
/// - parameter onPerform: Callback for arbitrary code execution. Can return a new node.
/// - returns: New node
public func Perform(onPerform: (() -> GuiView?)? = nil) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in

        if let child = onPerform?() {
            
            child.render()
        }
    }
}
