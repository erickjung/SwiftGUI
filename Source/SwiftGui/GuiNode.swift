//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

public class GuiNode: GuiView,
                      IdentifierValue,
                      HoverEvent,
                      PaddingModifier,
                      FontModifier,
                      TextColorModifier {

    public var onHover: (() -> GuiView?)?

    public var id: String?
    public var padding: GuiEdge?
    public var paddingValue: Double?
    public var fontIndex: Int?
    public var textColor: GuiColor?

    public func drawComponent() {}

    final public func render() {

        self.preRendering()

        self.drawComponent()

        self.posRendering()
    }
}

private extension GuiNode {

    func checkHovered() {

        guard let onHover = self.onHover else { return }

        if ImGuiWrapper.isItemHovered() {
            onHover()?.render()
        }
    }

    func preRendering() {

        if let id = self.id {
            ImGuiWrapper.pushID(id)
        }

        self.paddingPreRendering()

        if let color = self.textColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.text.rawValue, colorRef: color.cgColor)
        }

        if let fontIndex = self.fontIndex,
            let font = ImGuiWrapper.getFontWithType(Int32(fontIndex)) {

            ImGuiWrapper.pushFont(font)
        }
    }

    func posRendering() {

        self.checkHovered()

        if self.fontIndex != nil {
            ImGuiWrapper.popFont()
        }

        if self.textColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }

        self.paddingPosRendering()

        if self.id != nil {
            ImGuiWrapper.popID()
        }
    }

    func paddingPreRendering() {

        guard padding != .bottom && padding != .trailing,
            let padding = self.padding,
            let paddingValue = self.paddingValue else {

            return
        }

        switch padding {
        case .all:
            ImGuiWrapper.dummy(GuiSize(width: 0.0, height: paddingValue))
            ImGuiWrapper.dummy(GuiSize(width: paddingValue, height: 0.0))
            ImGuiWrapper.sameLine(0.0, spacing: -1)
        case .top:
            ImGuiWrapper.dummy(GuiSize(width: 0.0, height: paddingValue))
        case .leading:
            ImGuiWrapper.dummy(GuiSize(width: paddingValue, height: 0.0))
            ImGuiWrapper.sameLine(0.0, spacing: -1)
        default:
            break
        }
    }

    func paddingPosRendering() {

        guard padding != .top && padding != .leading,
            let padding = self.padding,
            let paddingValue = self.paddingValue else {

            return
        }

        switch padding {
        case .all:
            ImGuiWrapper.sameLine(0.0, spacing: -1)
            ImGuiWrapper.dummy(GuiSize(width: paddingValue, height: 0.0))
            ImGuiWrapper.dummy(GuiSize(width: 0.0, height: paddingValue))
        case .bottom:
            ImGuiWrapper.dummy(GuiSize(width: 0.0, height: paddingValue))
        case .trailing:
            ImGuiWrapper.sameLine(0.0, spacing: -1)
            ImGuiWrapper.dummy(GuiSize(width: paddingValue, height: 0.0))

        default:
            break
        }
    }
}
