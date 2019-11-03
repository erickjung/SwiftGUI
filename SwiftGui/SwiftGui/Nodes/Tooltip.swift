//
//  Tooltip.swift
//  SwiftGui
//
//  Created by Erick Jung on 24/10/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import CImGui

public func Tooltip(@GuiBuilder child: () -> GuiView?) -> GuiNode {
    
    GuiNode(tag: #function, child: child()).onRender { child in
        
        igBeginTooltip()
        child?.render()
        igEndTooltip()
    }
}
