//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation
import SwiftGuiCore


/// Column node.
/// - parameter id: Node id
/// - parameter count: Number of columns
/// - parameter border: Show border
/// - returns: New node
public func Column(id: String? = nil,
                   count: Int = 1,
                   border: Bool = true) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        igColumns(Int32(count), id?.cStr(), border)
    }
}

/// Column width node.
/// - parameter index: Column index
/// - parameter width: Width size
/// - returns: New node
public func ColumnWidth(index: Int,
                        width: Float) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        igSetColumnWidth(Int32(index), width)
    }
}

/// Column offset node.
/// - parameter index: Column index
/// - parameter offset: Offset number
/// - returns: New node
public func ColumnOffset(index: Int,
                         offset: Float) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        igSetColumnOffset(Int32(index), offset)
    }
}

/// Column next node.
/// This will move to next active column
/// - returns: New node
public func ColumnNext() -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        igNextColumn()
    }
}
