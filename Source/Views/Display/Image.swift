//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A view that displays an image texture.
public struct Image: GuiView, Modifiable, HasSize, HasBorderColor, HasTintColor {

    public var modifiers = ViewModifiers()
    public var size: GuiSize?
    public var borderColor: GuiColor?
    public var tintColor: GuiColor?

    public let texture: GuiTexture?
    public let uv0: GuiSize
    public let uv1: GuiSize

    public init(texture: GuiTexture?,
                uv0: GuiSize = .zero,
                uv1: GuiSize = GuiSize(width: 1, height: 1)) {
        self.texture = texture
        self.uv0 = uv0
        self.uv1 = uv1
        self.size = GuiSize(width: 50, height: 50)
        self.tintColor = .white
        self.borderColor = GuiColor(r: 0, g: 0, b: 0, a: 0)
    }

    public func render() {
        withModifiers(modifiers) {
            if let texture = texture,
               let size = size,
               let tintColor = tintColor,
               let borderColor = borderColor {
                ImGuiWrapper.image(texture.pointer,
                                   size: size,
                                   uv0: uv0,
                                   uv1: uv1,
                                   tintColor: tintColor.cgColor,
                                   borderColor: borderColor.cgColor)
            }
        }
    }
}
