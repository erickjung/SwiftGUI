//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
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
        GuiNodeList(children: content)
    }

    public static func buildIf(_ content: GuiView?) -> GuiView {
        if let content = content { return content }
        return GuiNodeList(children: [])
    }

    public static func buildEither(first: GuiView) -> GuiView {
        first
    }

    public static func buildEither(second: GuiView) -> GuiView {
        second
    }
}
