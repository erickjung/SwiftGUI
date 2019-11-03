//
//  Drag.swift
//  SwiftGui
//
//  Created by Erick Jung on 27/10/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import CImGui

public func DragInt(_ title: String,
                    valueState: Int,
                    valueSpeed: Float = 1.0,
                    min: Int = 0,
                    max: Int = 0,
                    format: String = "%d",
                    onChange: ((Int) -> Void)? = nil) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        var _value = Int32(valueState)
        if igDragInt(title.cStr(), &_value, valueSpeed, Int32(min), Int32(max), format) {
            onChange?(Int(_value))
        }
    }
}
