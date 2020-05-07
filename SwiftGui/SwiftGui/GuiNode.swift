//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import SwiftGuiCore

public class GuiNode: GuiView, Hashable {

    private var onHover: (() -> GuiView?)?
    
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
                    
            self.checkHovered()
            
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

// events
extension GuiNode {

    public func onHover(_ callback: @escaping () -> GuiView?) -> Self {
        self.onHover = callback
        return self
    }

    private func checkHovered() {
        
        if let onHover = self.onHover {
            
            if igIsItemHovered(0) {
                onHover()?.render()
            }
        }
    }
}
