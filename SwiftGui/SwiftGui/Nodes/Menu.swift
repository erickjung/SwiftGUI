//
//  Menu.swift
//  SwiftGui
//
//  Created by Erick Jung on 24/10/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGuiCore

public func MenuBar(@GuiBuilder child: () -> GuiView?) -> GuiNode {
    
    GuiNode(tag: #function, child: child()).onRender { child in
        
        if igBeginMenuBar() {
            
            child?.render()
            igEndMenuBar()
        }
    }
}

public func MenuGroup(_ title: String,
                      enabled: Bool = true,
                      @GuiBuilder child: () -> GuiView?) -> GuiNode {
    
    GuiNode(tag: #function, child: child()).onRender { child in
        
        if igBeginMenu(title.cStr(), enabled) {
            
            child?.render()
            igEndMenu()
        }
    }
}

public func MenuItem(_ title: String,
                     shortcut: String? = nil,
                     selected: Bool = false,
                     enabled: Bool = true,
                     onTap: (() -> Void)? = nil) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        if igMenuItemBool(title.cStr(), shortcut, selected, enabled) {
            onTap?()
        }
    }
}
