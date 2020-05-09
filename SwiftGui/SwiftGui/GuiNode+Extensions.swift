//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

//import SwiftGuiCore

public extension GuiNode {

    func color(_ property: GuiColorProperty, color: GuiColor) -> GuiNode {

        let id = UUID().hashValue
        self.insertPreAttribute(GuiNode(tag: "\(#function)_\(id)").onRender { _ in

            ImGuiWrapper.pushStyleColor(property.rawValue, colorRef: color.cgColor)
        })
        self.insertPosAttribute(GuiNode(tag: "\(#function)_\(id)").onRender { _ in

            ImGuiWrapper.popStyleColor(1)
        })
        return self
    }

    func position(_ position: GuiPoint, condition: GuiCondition) -> GuiNode {

        self.insertPreAttribute(GuiNode(tag: #function).onRender { _ in

            ImGuiWrapper.setNextWindowPos(position, cond: condition.rawValue, pivot: GuiPoint.zero)
        })
        return self
    }

    func size(_ size: GuiSize, condition: GuiCondition) -> GuiNode {

        self.insertPreAttribute(GuiNode(tag: #function).onRender { _ in

            ImGuiWrapper.setNextWindowSize(size, cond: condition.rawValue)
        })
        return self
    }

    func property(_ property: GuiStyleProperty, set number: Float) -> GuiNode {

        let id = UUID().hashValue
        self.insertPreAttribute(GuiNode(tag: "\(#function)_\(id)").onRender { _ in

            ImGuiWrapper.pushStyleVar(property.rawValue, valNumber: number)
        })
        self.insertPosAttribute(GuiNode(tag: "\(#function)_\(id)").onRender { _ in

            ImGuiWrapper.popStyleVar(1)
        })
        return self
    }

    func width(_ width: Float) -> GuiNode {

        self.insertPreAttribute(GuiNode(tag: #function).onRender { _ in

            ImGuiWrapper.pushItemWidth(width)
        })
        self.insertPosAttribute(GuiNode(tag: #function).onRender { _ in

            ImGuiWrapper.popItemWidth()
        })
        return self
    }

    func font(_ type: Int) -> GuiNode {

        guard let font = ImGuiWrapper.getFontWithType(Int32(type)) else { return self }

        self.insertPreAttribute(GuiNode(tag: #function).onRender { _ in

            ImGuiWrapper.pushFont(font)
        })

        self.insertPosAttribute(GuiNode(tag: #function).onRender { _ in

            ImGuiWrapper.popFont()
        })

        return self
    }

    func padding(_ edge: GuiEdge = .all,
                 value: Float) -> GuiNode {

        if edge != .bottom && edge != .trailing {

            self.insertPreAttribute(GuiNode(tag: #function).onRender { _ in

                switch edge {
                case .all:
                    ImGuiWrapper.dummy(GuiSize(width: 0, height: Int(value)))
                    ImGuiWrapper.dummy(GuiSize(width: Int(value), height: 0))
                    ImGuiWrapper.sameLine(0, spacing: -1)
                case .top:
                    ImGuiWrapper.dummy(GuiSize(width: 0, height: Int(value)))
                case .leading:
                    ImGuiWrapper.dummy(GuiSize(width: Int(value), height: 0))
                    ImGuiWrapper.sameLine(0, spacing: -1)
                default:
                    break
                }
            })

        }

        if edge != .top && edge != .leading {

            self.insertPosAttribute(GuiNode(tag: #function).onRender { _ in

                switch edge {
                case .all:
                    ImGuiWrapper.sameLine(0, spacing: -1)
                    ImGuiWrapper.dummy(GuiSize(width: Int(value), height: 0))
                    ImGuiWrapper.dummy(GuiSize(width: 0, height: Int(value)))
                case .bottom:
                    ImGuiWrapper.dummy(GuiSize(width: 0, height: Int(value)))
                case .trailing:
                    ImGuiWrapper.sameLine(0, spacing: -1)
                    ImGuiWrapper.dummy(GuiSize(width: Int(value), height: 0))

                default:
                    break
                }
            })
        }

        return self
    }
}
