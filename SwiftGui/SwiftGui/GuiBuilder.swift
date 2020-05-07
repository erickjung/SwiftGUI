//
//  Builder.swift
//  SwiftGui
//
//  Created by Erick Jung on 23/10/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

@_functionBuilder
public struct GuiBuilder {

    public static func buildBlock() -> GuiView {
        return Empty()
    }

    public static func buildBlock(_ content: GuiView) -> GuiView {
        return content
    }

    public static func buildBlock(_ content: GuiView...) -> GuiView {
        GuiMultiNode(children: content)
    }

    public static func buildIf(_ content: GuiView?) -> GuiView {
        if let content = content { return content }
        return GuiMultiNode(children: [])
    }

    public static func buildEither(first: GuiView) -> GuiView {
        first
    }

    public static func buildEither(second: GuiView) -> GuiView {
        second
    }
}
