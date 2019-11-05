//
//  Common.swift
//  SwiftGui
//
//  Created by Erick Jung on 24/10/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGUI_Core

public func Empty() -> GuiNode {
    
    GuiNode(tag: #function)
}

public func Group(@GuiBuilder child: () -> GuiView?) -> GuiNode {
    
    GuiNode(tag: #function, child: child()).onRender { child in
        
        child?.render()
    }
}

public func HStack(@GuiBuilder child: () -> GuiView?) -> GuiNode {
    
    GuiNode(tag: #function, child: child()).onRender { child in
        
        if let multi = child as? GuiMultiNode {
            
            for child in multi.children {
                
                igBeginGroup()
                child.render()
                igEndGroup()
                igSameLine(0.0, -1.0)
            }
            igNewLine()
        }
    }
}

public func ForEach<T:Sequence>(_ data: T,
                                @GuiBuilder child: (T.Element) -> GuiNode?) -> GuiView {
    
    var list = [GuiView]()
    for (index, element) in data.enumerated() {
        list.append(GuiNode(tag: "ForEach_\(index)", child: child(element)).onRender { child in
            
            child?.render()
        })
    }
    return GuiMultiNode(children: list)
}

public func Separator() -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in

        igSeparator()
    }
}

public func SameLine(offsetX: Float = 0.0,
                     spacing: Float = -1.0) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in

        igSameLine(offsetX, spacing)
    }
}

public func NewLine() -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in

        igNewLine()
    }
}

public func Spacing() -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in

        igSpacing()
    }
}

public func Indent(indentW: Float = 0,
                   @GuiBuilder child: () -> GuiView?) -> GuiNode {
    
    GuiNode(tag: #function, child: child()).onRender { child in
        
        igIndent(indentW)
        child?.render()
        igUnindent(indentW)
    }
}

public func IsItemHovered(@GuiBuilder child: () -> GuiView?) -> GuiNode {
    
    GuiNode(tag: #function, child: child()).onRender { child in
        
        if igIsItemHovered(0) {
            child?.render()
        }
    }
}
