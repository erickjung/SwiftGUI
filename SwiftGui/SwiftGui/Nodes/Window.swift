//
//  Window.swift
//  SwiftGui
//
//  Created by Erick Jung on 24/10/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGUI_Core

public func Window(_ title: String,
                   flags: ImGuiWindowFlags = .none,
                   @GuiBuilder child: () -> GuiView?) -> GuiNode {
    
    GuiNode(tag: #function, child: child()).onRender { child in
        
        if igBegin(title.cStr(), nil, flags.rawValue) {
        
            child?.render()
        }
        igEnd()
    }
}
