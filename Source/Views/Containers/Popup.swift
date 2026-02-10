//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A container that displays content in a popup window.
public struct Popup: GuiView, Modifiable {

    public enum PopupType {
        case `default`
        case modal
    }

    public var modifiers = ViewModifiers()

    public var options: GuiWindowConfig
    public let type: PopupType
    private let child: any GuiView

    public init(
        type: PopupType = .default,
        options: GuiWindowConfig = .none,
        @GuiBuilder child: () -> any GuiView
    ) {
        self.type = type
        self.options = options
        self.child = child()
    }

    public func render() {
        // Extract popup ID but don't push it onto the ID stack
        let popupId = modifiers.id ?? "##popup"

        // Create modifiers without the ID (so withModifiers won't push it)
        var modifiersWithoutId = modifiers
        modifiersWithoutId.id = nil

        switch type {
        case .default:
            if ImGuiWrapper.beginPopup(popupId, flags: options.rawValue) {
                withModifiers(modifiersWithoutId) {
                    child.render()
                }
                ImGuiWrapper.endPopup()
            }

        case .modal:
            var open = true
            if ImGuiWrapper.beginPopupModal(popupId, open: &open, flags: options.rawValue) {
                withModifiers(modifiersWithoutId) {
                    child.render()
                }
                ImGuiWrapper.endPopup()
            }
        }
    }
}

// MARK: - Static Methods
public extension Popup {

    /// Opens a popup with the specified identifier.
    static func open(_ id: String = "##popup") {
        ImGuiWrapper.openPopup(id)
    }

    /// Closes the current popup.
    /// NOTE: This will close any popup opened.
    static func close() {
        ImGuiWrapper.closeCurrentPopup()
    }
}
