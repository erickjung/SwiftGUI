//
//  RadioButton.swift
//  SwiftGui
//
//  Created by Erick Jung on 25/10/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGUI_Core

public func RadioButton(_ title: String,
                        active: Bool,
                        onSelect: (() -> Void)? = nil) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        if igRadioButtonBool(title, active) {
            onSelect?()
        }
    }
}

public func RadioButtonSequential(_ title: String,
                                  selectedState: Int,
                                  order: Int,
                                  onSelect: ((Int) -> Void)? = nil) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        var _value = Int32(selectedState)
        if igRadioButtonIntPtr(title, &_value, Int32(order)) {
            onSelect?(Int(_value))
        }
    }
}

public func RadioButtonGroup(_ values: [String],
                             selectedState: Int,
                             onSelect: ((Int) -> Void)? = nil) -> GuiView {

    var list = [GuiView]()
    for (index, element) in values.enumerated() {
        
        list.append(RadioButtonSequential(element, selectedState: selectedState, order: index, onSelect: onSelect))
    }
    return GuiMultiNode(children: list)
}
