//
//  TabBar.swift
//  SwiftGui
//
//  Created by Erick Jung on 27/11/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGUI_Core

public func TabBar(id: String,
                   flags: ImGuiTabBarFlags = .none,
                   @GuiBuilder child: () -> GuiView?) -> GuiNode {
    
    GuiNode(tag: #function, child: child()).onRender { child in
        
        if igBeginTabBar(id.cStr(), flags.rawValue) {
            
            child?.render()
            igEndTabBar()
        }
    }
}

public func TabItem(_ title: String,
                    flags: ImGuiTabItemFlags = .none,
                    @GuiBuilder child: () -> GuiView?) -> GuiNode {
    
    GuiNode(tag: #function, child: child()).onRender { child in
        
        if igBeginTabItem(title.cStr(), nil, flags.rawValue) {
            
            child?.render()
            igEndTabItem()
        }
    }
}
