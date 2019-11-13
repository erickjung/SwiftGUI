//
//  GuiNode+Extensions.swift
//  SwiftGui
//
//  Created by Erick Jung on 07/11/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import SwiftGUI_Core

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
    
    func padding(_ edge: GUIEdge = .all,
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
