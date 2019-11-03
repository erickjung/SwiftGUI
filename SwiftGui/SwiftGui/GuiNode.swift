//
//  GuiNode.swift
//  SwiftGui
//
//  Created by Erick Jung on 23/10/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import CImGui

public class GuiNode: GuiView, Hashable {

    private var onRender: ((GuiView?) -> Void)?

    private var child: GuiView?
    private var tag: String
    private var preAttributes: OrderedSet<GuiNode>?
    private var posAttributes: OrderedSet<GuiNode>?
    

    init(tag: String, child: GuiView? = nil) {
        self.tag = tag
        self.child = child
    }
    
    func insertPreAttribute(_ node: GuiNode) {
        
        if preAttributes == nil {
            preAttributes = OrderedSet<GuiNode>()
        }
        preAttributes?.append(node)
    }

    func insertPosAttribute(_ node: GuiNode) {
        
        if posAttributes == nil {
            posAttributes = OrderedSet<GuiNode>()
        }
        posAttributes?.append(node)
    }

    func onRender(_ callback: @escaping (GuiView?) -> Void) -> Self {
        self.onRender = callback
        return self
    }

    public func render() {
        
        if let onRender = self.onRender {
            
            self.preAttributes?.forEach { node in
                node.render()
            }
            
            onRender(child)
            
            self.posAttributes?.forEach { node in
                node.render()
            }
        }
    }
    
    public static func == (lhs: GuiNode, rhs: GuiNode) -> Bool {
        return lhs.tag == rhs.tag
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(tag)
    }
}

public extension GuiNode {

    func color(_ property: ImGuiCol, color: SGColor) -> GuiNode {
        
        let id = UUID().hashValue
        self.insertPreAttribute(GuiNode(tag: "\(#function)_\(id)").onRender { _ in
            
            igPushStyleColor(property.rawValue, color.convertToVec4())
        })
        self.insertPosAttribute(GuiNode(tag: "\(#function)_\(id)").onRender { _ in
            
            igPopStyleColor(1)
        })
        return self
    }

    func position(_ position: SGPoint, condition: ImGuiCond) -> GuiNode {
        
        self.insertPreAttribute(GuiNode(tag: #function).onRender { _ in

            igSetNextWindowPos(position.convertToVec2(), condition.rawValue, SGPoint.zero.convertToVec2())
        })
        return self
    }
    
    func size(_ size: SGSize, condition: ImGuiCond) -> GuiNode {
        
        self.insertPreAttribute(GuiNode(tag: #function).onRender { _ in

            igSetNextWindowSize(size.convertToVec2(), condition.rawValue)
        })
        return self
    }
    
    func property(_ property: ImGuiStyleVar, set number: Float) -> GuiNode {
        
        let id = UUID().hashValue
        self.insertPreAttribute(GuiNode(tag: "\(#function)_\(id)").onRender { _ in
            
            igPushStyleVarFloat(property.rawValue, number)
        })
        self.insertPosAttribute(GuiNode(tag: "\(#function)_\(id)").onRender { _ in
            
            igPopStyleVar(1)
        })
        return self
    }
}


struct GuiMultiNode: GuiView {

    let children: [GuiView]

    func render() {

        for child in children {
            child.render()
        }
    }
}
