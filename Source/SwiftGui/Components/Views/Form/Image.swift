//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class Image: GuiNode,
                    SizeModifier,
                    BorderColorModifier,
                    TintColorModifier {

    public var size: GuiSize?
    public var borderColor: GuiColor?
    public var tintColor: GuiColor?

    public var imageId: GuiImage?
    public var uv0: GuiSize
    public var uv1: GuiSize

    public init(imageId: GuiImage?,
                uv0: GuiSize = .zero,
                uv1: GuiSize = GuiSize(width: 1, height: 1)) {

        self.imageId = imageId
        self.uv0 = uv0
        self.uv1 = uv1
        self.size = GuiSize(width: 50, height: 50)
        self.tintColor = .white
        self.borderColor = GuiColor(r: 0, g: 0, b: 0, a: 0)
    }

    public override func drawComponent() {

        if let imageId = self.imageId,
            let size = self.size,
            let tintColor = self.tintColor,
            let borderColor = self.borderColor {

            ImGuiWrapper.image(Unmanaged.passUnretained(imageId).toOpaque(),
                               size: size,
                               uv0: self.uv0,
                               uv1: self.uv1,
                               tintColor: tintColor.cgColor,
                               borderColor: borderColor.cgColor)
        }
    }
}
