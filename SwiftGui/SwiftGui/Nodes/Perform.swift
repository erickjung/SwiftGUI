//
//  Perform.swift
//  SwiftGui
//
//  Created by Erick Jung on 06/11/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation

public func Perform(onPerform: (() -> GuiView?)? = nil) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in

        if let child = onPerform?() {
            
            child.render()
        }
    }
}
