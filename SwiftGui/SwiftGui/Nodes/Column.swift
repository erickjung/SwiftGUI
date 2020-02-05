//
//  Column.swift
//  SwiftGui
//
//  Created by Erick Jung on 05/02/2020.
//  Copyright © 2020 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGUI_Core

public func Column(id: String? = nil,
                   count: Int = 1,
                   border: Bool = true) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        igColumns(Int32(count), id?.cStr(), border)
    }
}

public func ColumnWidth(index: Int,
                        width: Float) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        igSetColumnWidth(Int32(index), width)
    }
}

public func ColumnOffset(index: Int,
                         offset: Float) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        igSetColumnOffset(Int32(index), offset)
    }
}

public func ColumnNext() -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        igNextColumn()
    }
}
