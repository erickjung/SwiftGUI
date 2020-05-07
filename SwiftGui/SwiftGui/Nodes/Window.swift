//
//  Window.swift
//  SwiftGui
//
//  Created by Erick Jung on 24/10/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGuiCore

public func Window(_ title: String,
                   options: GuiWindowConfig = .none,
                   @GuiBuilder child: () -> GuiView?) -> GuiNode {
    
    GuiNode(tag: #function, child: child()).onRender { child in
        
        if igBegin(title.cStr(), nil, options.rawValue) {
        
            child?.render()
        }
        igEnd()
    }
}

public func SubWindow(_ id: String,
                      size: GuiSize = .zero,
                      border: Bool = false,
                      options: GuiWindowConfig = .none,
                      @GuiBuilder child: () -> GuiView?) -> GuiNode {
    
    GuiNode(tag: #function, child: child()).onRender { child in
        
        if igBeginChild(id.cStr(), size.convertToVec2(), border, options.rawValue) {
        
            child?.render()
        }
        igEndChild()
    }
}
