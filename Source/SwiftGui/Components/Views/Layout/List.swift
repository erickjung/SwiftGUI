//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class List<T>: GuiNode, SizeModifier {

    public var size: GuiSize?

    public var itemHeight: Float
    public var border: Bool
    public var options: GuiWindowConfig

    public private(set) var buffer: [T]
    private let onLoop: ((Int, T) -> GuiView?)

    public init(buffer: [T],
                itemHeight: Float = -1,
                border: Bool = false,
                options: GuiWindowConfig = .none,
                onLoop: @escaping ((Int, T) -> GuiView?)) {

        self.buffer = buffer
        self.itemHeight = itemHeight
        self.border = border
        self.options = options
        self.onLoop = onLoop
    }

    public override func drawComponent() {

        if ImGuiWrapper.beginChild(self.id ?? "##list", size: self.size ?? .zero, border: self.border, flags: self.options.rawValue) {

            if let clipper = ImGuiWrapper.listClipperCreate(0, itemsHeight: self.itemHeight) {

                ImGuiWrapper.listClipperBegin(clipper, itemsCount: Int32(self.buffer.count), itemsHeight: self.itemHeight)

                ImGuiWrapper.listClipperLoop(clipper) { index in

                    self.onLoop(Int(index), self.buffer[Int(index)])?.render()
                }

                ImGuiWrapper.listClipperEnd(clipper)

                ImGuiWrapper.listClipperDestroy(clipper)
            }
        }

        ImGuiWrapper.endChild()
    }
}
