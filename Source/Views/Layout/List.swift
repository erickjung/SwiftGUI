//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A layout view that efficiently renders a large list of items using clipping.
public struct List<T>: GuiView, Modifiable, HasSize {

    public var modifiers = ViewModifiers()
    public var size: GuiSize?

    public var itemHeight: Float
    public var border: Bool
    public var options: GuiWindowConfig
    public let buffer: [T]
    private let onLoop: (Int, T) -> (any GuiView)?

    public init(
        buffer: [T],
        itemHeight: Float = -1,
        border: Bool = false,
        options: GuiWindowConfig = .none,
        onLoop: @escaping (Int, T) -> (any GuiView)?
    ) {
        self.buffer = buffer
        self.itemHeight = itemHeight
        self.border = border
        self.options = options
        self.onLoop = onLoop
    }

    public func render() {
        withModifiers(modifiers) {
            if ImGuiWrapper.beginChild(
                modifiers.id ?? "##list",
                size: size ?? .zero,
                border: border,
                flags: options.rawValue
            ) {
                if let clipper = ImGuiWrapper.listClipperCreate(0, itemsHeight: itemHeight) {
                    ImGuiWrapper.listClipperBegin(
                        clipper,
                        itemsCount: Int32(buffer.count),
                        itemsHeight: itemHeight
                    )

                    ImGuiWrapper.listClipperLoop(clipper) { index in
                        onLoop(Int(index), buffer[Int(index)])?.render()
                    }

                    ImGuiWrapper.listClipperEnd(clipper)
                    ImGuiWrapper.listClipperDestroy(clipper)
                }
            }

            ImGuiWrapper.endChild()
        }
    }
}
