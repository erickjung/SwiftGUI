//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation
import SwiftGuiCore

/// ListBox node.
/// NOTE: Use this for small/medium lists
/// - parameter title: Text for node
/// - parameter currentItemState: Current item selected state
/// - parameter items: List of text items
/// - parameter onChange: Callback for state changing
/// - returns: New node
public func ListBox(_ title: String,
                    currentItemState: Int,
                    items: [String],
                    onChange: ((Int) -> Void)? = nil) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        var _currentItem = Int32(currentItemState)
        if igListBoxStr_arr(title.cStr(), &_currentItem, items.map { $0.cStr() }, Int32(items.count), -1) {
            
            if _currentItem != currentItemState {
                
                onChange?(Int(_currentItem))
            }
        }
    }
}

/// List node.
/// NOTE: Use this for small/medium lists
/// - parameter id: Node id
/// - parameter size: List height
/// - parameter border: Show list border
/// - parameter options: Node options
/// - parameter child: List of child nodes
/// - returns: New node
public func List(id: String = "##list",
                 size: GuiSize = .zero,
                 border: Bool = false,
                 options: GuiWindowConfig = .none,
                 @GuiBuilder child: () -> GuiView?) -> GuiNode {
     
     GuiNode(tag: #function, child: child()).onRender { child in
         
        if igBeginChild(id.cStr(), size.convertToVec2(), border, options.rawValue) {
         
             child?.render()
        }
        igEndChild()
    }
}

/// List node.
/// NOTE: Use this for large lists as will clipper rendered data properly
/// - parameter id: Node id
/// - parameter itemHeight: Height for each item row
/// - parameter size: List height
/// - parameter border: Show list border
/// - parameter options: Node options
/// - parameter onLoop: Callback for data changing
/// - returns: New node
public func List<T>(id: String = "##list_buffer",
                    buffer: [T],
                    itemHeight: Float = -1,
                    size: GuiSize = .zero,
                    border: Bool = false,
                    options: GuiWindowConfig = .none,
                    onLoop: @escaping ((Int, T) -> GuiNode?)) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        if igBeginChild(id.cStr(), size.convertToVec2(), border, options.rawValue) {
            
            if let clipper = ImGuiListClipper_ImGuiListClipper(0, itemHeight) {
                
                ImGuiListClipper_Begin(clipper, Int32(buffer.count), itemHeight)
                
                while(ImGuiListClipper_Step(clipper)) {
                    
                    for i in (clipper.pointee.DisplayStart..<clipper.pointee.DisplayEnd) {
                      
                        onLoop(Int(i), buffer[Int(i)])?.render()
                    }
                }
                
                ImGuiListClipper_End(clipper)
                
                ImGuiListClipper_destroy(clipper)
            }
        }
        
        igEndChild()
    }
}
