//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation
import SwiftGuiCore

/// Image node.
/// - parameter imageId: A Texture handler
/// - parameter size: Image size
/// - parameter uv0: UV0 size position
/// - parameter uv1: UV1 size position
/// - parameter tintColor: Image tint color
/// - parameter borderColor: Image border color
/// - returns: New node
public func Image(imageId: GuiImage?,
                  size: GuiSize,
                  uv0: GuiSize = .zero,
                  uv1: GuiSize = GuiSize(width: 1, height: 1),
                  tintColor: GuiColor = .white,
                  borderColor: GuiColor = GuiColor(r: 0, g: 0, b: 0, a: 0)) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        if let imageId = imageId {

            igImage(Unmanaged.passUnretained(imageId).toOpaque(),
                    size.convertToVec2(),
                    uv0.convertToVec2(),
                    uv1.convertToVec2(),
                    tintColor.convertToVec4(),
                    borderColor.convertToVec4())
        }
    }
}
