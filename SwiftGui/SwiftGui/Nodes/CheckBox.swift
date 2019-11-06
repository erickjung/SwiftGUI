//
//  CheckBox.swift
//  SwiftGui
//
//  Created by Erick Jung on 24/10/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGUI_Core

public func CheckBox(_ title: String,
                     selectedState: Bool,
                     onChange: ((Bool) -> Void)? = nil) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        var _value = selectedState
        if igCheckbox(title.cStr(), &_value) {
            
            if _value != selectedState {
                
                onChange?(_value)
            }
        }
    }
}
