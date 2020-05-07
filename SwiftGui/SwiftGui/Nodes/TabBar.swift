//
//  TabBar.swift
//  SwiftGui
//
//  Created by Erick Jung on 27/11/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGuiCore

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
