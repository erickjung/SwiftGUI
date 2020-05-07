//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import SwiftGuiCore

public extension GuiNode {

    func color(_ property: GuiColorProperty, color: GuiColor) -> GuiNode {
        
        let id = UUID().hashValue
        self.insertPreAttribute(GuiNode(tag: "\(#function)_\(id)").onRender { _ in
            
            igPushStyleColor(property.rawValue, color.convertToVec4())
        })
        self.insertPosAttribute(GuiNode(tag: "\(#function)_\(id)").onRender { _ in
            
            igPopStyleColor(1)
        })
        return self
    }

    func position(_ position: GuiPoint, condition: GuiCondition) -> GuiNode {
        
        self.insertPreAttribute(GuiNode(tag: #function).onRender { _ in

            igSetNextWindowPos(position.convertToVec2(), condition.rawValue, GuiPoint.zero.convertToVec2())
        })
        return self
    }
    
    func size(_ size: GuiSize, condition: GuiCondition) -> GuiNode {
        
        self.insertPreAttribute(GuiNode(tag: #function).onRender { _ in

            igSetNextWindowSize(size.convertToVec2(), condition.rawValue)
        })
        return self
    }
    
    func property(_ property: GuiStyleProperty, set number: Float) -> GuiNode {
        
        let id = UUID().hashValue
        self.insertPreAttribute(GuiNode(tag: "\(#function)_\(id)").onRender { _ in
            
            igPushStyleVarFloat(property.rawValue, number)
        })
        self.insertPosAttribute(GuiNode(tag: "\(#function)_\(id)").onRender { _ in
            
            igPopStyleVar(1)
        })
        return self
    }
    
    func width(_ width: Float) -> GuiNode {
        
        self.insertPreAttribute(GuiNode(tag: #function).onRender { _ in
            
            igPushItemWidth(width)
        })
        self.insertPosAttribute(GuiNode(tag: #function).onRender { _ in
            
            igPopItemWidth()
        })
        return self
    }

    func font(_ type: Int) -> GuiNode {

        if let io = igGetIO() {

            if let fonts = io.pointee.Fonts,
            type < fonts.pointee.Fonts.Size {
                
                let font = fonts.pointee.Fonts.Data[type]
                self.insertPreAttribute(GuiNode(tag: #function).onRender { _ in
                    
                    igPushFont(font)
                })
                
                self.insertPosAttribute(GuiNode(tag: #function).onRender { _ in
                    
                    igPopFont()
                })
            }
        }
        
        return self
    }
    
    func padding(_ edge: GuiEdge = .all,
                 value: Float) -> GuiNode {
        
        if edge != .bottom && edge != .trailing {
            
            self.insertPreAttribute(GuiNode(tag: #function).onRender { _ in
                
                switch edge {
                case .all:
                    igDummy(ImVec2(x: 0, y: value))
                    igDummy(ImVec2(x: value, y: 0))
                    igSameLine(0, -1)
                case .top:
                    igDummy(ImVec2(x: 0, y: value))
                case .leading:
                    igDummy(ImVec2(x: value, y: 0))
                    igSameLine(0, -1)
                default:
                    break
                }
            })
            
        }
        
        if edge != .top && edge != .leading {
            
            self.insertPosAttribute(GuiNode(tag: #function).onRender { _ in
                
                switch edge {
                case .all:
                    igSameLine(0, -1)
                    igDummy(ImVec2(x: value, y: 0))
                    igDummy(ImVec2(x: 0, y: value))
                case .bottom:
                    igDummy(ImVec2(x: 0, y: value))
                case .trailing:
                    igSameLine(0, -1)
                    igDummy(ImVec2(x: value, y: 0))
                default:
                    break
                }
            })
        }

        return self
    }
}
