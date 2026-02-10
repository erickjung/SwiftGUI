//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A view that displays text.
public struct Text: GuiView, Modifiable {

    public enum TextType {
        case `default`
        case wrapped
        case bullet
    }

    public var modifiers = ViewModifiers()

    public var text: String
    public let type: TextType

    public init(_ text: String, type: TextType = .default) {
        self.text = text
        self.type = type
    }

    public func render() {
        withModifiers(modifiers) {
            switch type {
            case .wrapped:
                ImGuiWrapper.textWrapped(text)
            case .bullet:
                ImGuiWrapper.bulletText(text)
            default:
                ImGuiWrapper.text(text)
            }
        }
    }
}
