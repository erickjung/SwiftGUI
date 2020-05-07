//
//  RadioButton.swift
//  SwiftGui
//
//  Created by Erick Jung on 25/10/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGuiCore

public func RadioButton(_ title: String,
                        active: Bool,
                        onChange: (() -> Void)? = nil) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        if igRadioButtonBool(title, active) {
            onChange?()
        }
    }
}

public func RadioButtonSequential(_ title: String,
                                  selectedState: Int,
                                  order: Int,
                                  onChange: ((Int) -> Void)? = nil) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        var _value = Int32(selectedState)
        if igRadioButtonIntPtr(title, &_value, Int32(order)) {
            
            if _value != selectedState {
                
                onChange?(Int(_value))
            }
        }
    }
}

public func RadioButtonGroup(_ values: [String],
                             selectedState: Int,
                             onChange: ((Int) -> Void)? = nil) -> GuiView {

    var list = [GuiView]()
    for (index, element) in values.enumerated() {
        
        list.append(RadioButtonSequential(element, selectedState: selectedState, order: index, onChange: onChange))
    }
    return GuiMultiNode(children: list)
}
