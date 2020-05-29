//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class Popup: GuiView, IdentifierValue {

    public enum PopupType {
        case `default`
        case modal
    }

    public var id: String?
    public var options: GuiWindowConfig

    public private(set) var type: PopupType
    private let child: GuiView

    public init(type: PopupType = .default,
                options: GuiWindowConfig = .none,
                @GuiBuilder child: () -> GuiView) {

        self.type = type
        self.options = options
        self.child = child()
    }

    public func render() {

        switch self.type {

        case .default:
            if ImGuiWrapper.beginPopup(self.id ?? "##popup", flags: self.options.rawValue) {

                self.child.render()

                ImGuiWrapper.endPopup()
            }

        case .modal:
            var _value = true
            if ImGuiWrapper.beginPopupModal(self.id ?? "##popup", open: &_value, flags: self.options.rawValue) {

                self.child.render()

                ImGuiWrapper.endPopup()
            }
        }
    }
}

public extension Popup {

    static func open(_ id: String = "##popup") {

        ImGuiWrapper.openPopup(id)
    }

    /// PopupCloseCall function.
    /// NOTE: This will close any popup opened
    static func close() {

        ImGuiWrapper.closeCurrentPopup()
    }
}
