//
//  CheckBox.swift
//  SwiftGui
//
//  Created by Erick Jung on 24/10/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGUI_Core

public func CheckBox(_ title: String = "",
                     id: String? = nil,
                     selectedState: Bool,
                     onChange: ((Bool) -> Void)? = nil) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        var _value = selectedState
        
        if let id = id {
            
            igPushIDStr(id.cStr())
            
            if igCheckbox(title.cStr(), &_value) {
                
                if _value != selectedState {
                    
                    onChange?(_value)
                }
            }
            
            igPopID()

        } else {
            
            if igCheckbox(title.cStr(), &_value) {
                
                if _value != selectedState {
                    
                    onChange?(_value)
                }
            }
        }
    }
}
