//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class Text: GuiNode {

    public enum TextType {
        case `default`
        case wrapped
        case bullet
    }

    public var text: String

    public private(set) var type: TextType

    public init(_ text: String, type: TextType = .default) {
        self.text = text
        self.type = type
    }

    public override func drawComponent() {

        switch self.type {

        case .wrapped:
            ImGuiWrapper.textWrapped(self.text)
        case .bullet:
            ImGuiWrapper.bulletText(self.text)
        default:
            ImGuiWrapper.text(self.text)
        }
    }
}
