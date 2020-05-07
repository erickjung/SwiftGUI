//
//  Common.swift
//  SwiftGui
//
//  Created by Erick Jung on 24/10/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGuiCore

public func Empty() -> GuiNode {
    
    GuiNode(tag: #function)
}

public func Group(id: String? = nil, @GuiBuilder child: () -> GuiView?) -> GuiNode {
    
    GuiNode(tag: #function, child: child()).onRender { child in
        
        if let id = id {

            igPushIDStr(id.cStr())
                child?.render()
            igPopID()
            
        } else {
            
            child?.render()
        }
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
            
        } else {
            
            child?.render()
        }
    }
}

public func ForEach<T:Sequence>(_ data: T,
                                 onLoop: @escaping (T.Element) -> GuiNode?) -> GuiView {
    
    GuiNode(tag: #function).onRender { _ in

        for (_, element) in data.enumerated() {
            
            onLoop(element)?.render()
        }
    }
}

public func Separator() -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in

        igSeparator()
    }
}

public func SameLine(offsetX: GuiPoint = .zero,
                     spacing: Float = -1.0) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in

        igSameLine(Float(offsetX.x), spacing)
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
