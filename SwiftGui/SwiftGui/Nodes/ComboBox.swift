//
//  ComboBox.swift
//  SwiftGui
//
//  Created by Erick Jung on 25/10/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGUI_Core

public func ComboBox(_ title: String,
                     currentItemState: Int,
                     items: [String],
                     onChange: ((Int) -> Void)? = nil) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        var _currentItem = Int32(currentItemState)
        if igCombo(title.cStr(), &_currentItem, items.map { $0.cStr() }, Int32(items.count), -1) {
            
            if _currentItem != currentItemState {
                
                onChange?(Int(_currentItem))
            }
        }
    }
}
