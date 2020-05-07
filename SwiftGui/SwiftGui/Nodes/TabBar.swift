//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation
import SwiftGuiCore

/// TabBar node.
/// - parameter id: Node id
/// - parameter options: Node options
/// - parameter child: List of child nodes
/// - returns: New node
public func TabBar(id: String,
                   options: GuiTabBarConfig = .none,
                   @GuiBuilder child: () -> GuiView?) -> GuiNode {
    
    GuiNode(tag: #function, child: child()).onRender { child in
        
        if igBeginTabBar(id.cStr(), options.rawValue) {
            
            child?.render()
            igEndTabBar()
        }
    }
}

/// TabItem node.
/// - parameter title: Text for node
/// - parameter options: Node options
/// - parameter child: List of child nodes
/// - returns: New node
public func TabItem(_ title: String,
                    options: GuiTabItemConfig = .none,
                    @GuiBuilder child: () -> GuiView?) -> GuiNode {
    
    GuiNode(tag: #function, child: child()).onRender { child in
        
        if igBeginTabItem(title.cStr(), nil, options.rawValue) {
            
            child?.render()
            igEndTabItem()
        }
    }
}
