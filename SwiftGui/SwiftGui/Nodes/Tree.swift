//
//  Tree.swift
//  SwiftGui
//
//  Created by Erick Jung on 24/10/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGUI_Core

public func Tree(_ title: String,
                 options: ImGuiTreeNodeFlags = .none,
                 @GuiBuilder child: () -> GuiView?) -> GuiNode {
    
    GuiNode(tag: #function, child: child()).onRender { child in
        
        if igTreeNodeExStr(title.cStr(), options.rawValue) {
            
            child?.render()
            igTreePop()
        }
    }
}

public func CollapsingHeader(title: String,
                             options: ImGuiTreeNodeFlags = .none,
                             @GuiBuilder child: () -> GuiView?) -> GuiNode {
    
    GuiNode(tag: #function, child: child()).onRender { child in
        
        if igCollapsingHeader(title.cStr(), options.rawValue) {
            
            child?.render()
        }
    }
}

public func CollapsingHeaderClosable(title: String,
                                     closeState: Bool = false,
                                     options: ImGuiTreeNodeFlags = .none,
                                     onClose: ((Bool) -> Void)? = nil,
                                     @GuiBuilder child: () -> GuiView?) -> GuiNode {
    
    GuiNode(tag: #function, child: child()).onRender { child in
        
        var _value = closeState
        if igCollapsingHeaderBoolPtr(title, &_value, options.rawValue) {
            
            child?.render()
        }
        onClose?(_value)
    }
}
