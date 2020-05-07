//
//  Color.swift
//  SwiftGui
//
//  Created by Erick Jung on 24/10/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGuiCore

public func ColorEdit3(_ title: String,
                       color: SGColor,
                       onChange: ((SGColor) -> Void)? = nil) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in

        var _color = color.convertToFloats()
        if igColorEdit3(title.cStr(), &_color, 0) {
            
            if let onChange = onChange {

                onChange(SGColor(r: _color[0], g: _color[1], b: _color[2], a: 1.0))
            }
        }
    }
}
