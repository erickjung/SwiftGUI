//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// Wraps a rendering body with pre/post modifier logic.
/// Replicates the behavior of GuiNode.preRendering() and GuiNode.posRendering().
///
/// This function applies modifiers in the correct push/pop order:
/// - Pre: ID → Padding (leading/top/all) → TextColor → Font → Snap
/// - Body: (user rendering code)
/// - Post: Hover → Snap → Font → TextColor → Padding (trailing/bottom/all) → ID
public func withModifiers(_ modifiers: ViewModifiers, body: () -> Void) {
    // Pre-rendering: push modifiers and track what was pushed
    let pushState = preRendering(modifiers)

    // Execute the component's rendering logic
    body()

    // Post-rendering: pop modifiers and check hover
    postRendering(modifiers, pushState: pushState)
}

/// Tracks which modifiers were actually pushed (for proper pop order)
private struct PushState {
    var didPushFont: Bool = false
}

// MARK: - Private Helpers

private func preRendering(_ modifiers: ViewModifiers) -> PushState {
    var state = PushState()

    // Push ID
    if let id = modifiers.id {
        ImGuiWrapper.pushID(id)
    }

    // Push padding (leading, top, all - done before content)
    paddingPreRendering(modifiers)

    // Push text color
    if let color = modifiers.textColor {
        ImGuiWrapper.pushStyleColor(GuiColorProperty.text.rawValue, colorRef: color.cgColor)
    }

    // Push font (only if it exists)
    if let fontIndex = modifiers.fontIndex,
       let font = ImGuiWrapper.getFontWithType(Int32(fontIndex)) {
        ImGuiWrapper.pushFont(font)
        state.didPushFont = true
    }

    // Push snap width
    if modifiers.snapWidth != nil {
        ImGuiWrapper.pushItemWidth(-1)
    }

    return state
}

private func postRendering(_ modifiers: ViewModifiers, pushState: PushState) {
    // Check hover callback
    checkHovered(modifiers)

    // Pop snap width
    if modifiers.snapWidth != nil {
        ImGuiWrapper.popItemWidth()
    }

    // Pop font (only if we actually pushed it)
    if pushState.didPushFont {
        ImGuiWrapper.popFont()
    }

    // Pop text color
    if modifiers.textColor != nil {
        ImGuiWrapper.popStyleColor(1)
    }

    // Pop padding (trailing, bottom, all - done after content)
    paddingPostRendering(modifiers)

    // Pop ID
    if modifiers.id != nil {
        ImGuiWrapper.popID()
    }
}

private func checkHovered(_ modifiers: ViewModifiers) {
    guard let onHover = modifiers.onHover else { return }

    if ImGuiWrapper.isItemHovered() {
        onHover()?.render()
    }
}

private func paddingPreRendering(_ modifiers: ViewModifiers) {
    // Skip if padding is bottom or trailing (those are applied post-rendering)
    guard modifiers.padding != .bottom && modifiers.padding != .trailing,
          let padding = modifiers.padding,
          let paddingValue = modifiers.paddingValue else {
        return
    }

    switch padding {
    case .all:
        ImGuiWrapper.dummy(GuiSize(width: 0.0, height: paddingValue))
        ImGuiWrapper.dummy(GuiSize(width: paddingValue, height: 0.0))
        ImGuiWrapper.sameLine(0.0, spacing: -1)
    case .top:
        ImGuiWrapper.dummy(GuiSize(width: 0.0, height: paddingValue))
    case .leading:
        ImGuiWrapper.dummy(GuiSize(width: paddingValue, height: 0.0))
        ImGuiWrapper.sameLine(0.0, spacing: -1)
    default:
        break
    }
}

private func paddingPostRendering(_ modifiers: ViewModifiers) {
    // Skip if padding is top or leading (those were applied pre-rendering)
    guard modifiers.padding != .top && modifiers.padding != .leading,
          let padding = modifiers.padding,
          let paddingValue = modifiers.paddingValue else {
        return
    }

    switch padding {
    case .all:
        ImGuiWrapper.sameLine(0.0, spacing: -1)
        ImGuiWrapper.dummy(GuiSize(width: paddingValue, height: 0.0))
        ImGuiWrapper.dummy(GuiSize(width: 0.0, height: paddingValue))
    case .bottom:
        ImGuiWrapper.dummy(GuiSize(width: 0.0, height: paddingValue))
    case .trailing:
        ImGuiWrapper.sameLine(0.0, spacing: -1)
        ImGuiWrapper.dummy(GuiSize(width: paddingValue, height: 0.0))
    default:
        break
    }
}
