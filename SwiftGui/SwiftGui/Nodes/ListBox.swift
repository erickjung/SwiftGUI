//
//  ListBox.swift
//  SwiftGui
//
//  Created by Erick Jung on 27/10/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGUI_Core

public func ListBox(_ title: String,
                    currentItemState: Int,
                    items: [String],
                    onSelect: ((Int) -> Void)? = nil) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        var _currentItem = Int32(currentItemState)
        if igListBoxStr_arr(title.cStr(), &_currentItem, items.map { $0.cStr() }, Int32(items.count), -1) {
            onSelect?(Int(_currentItem))
        }
    }
}

