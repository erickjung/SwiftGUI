//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A control that displays an editable text interface.
public struct TextField: GuiView, Modifiable, HasSize, HasBackgroundColor {

    public enum TextFieldType {
        case `default`
        case multiline
    }

    public var modifiers = ViewModifiers()
    public var size: GuiSize?
    public var backgroundColor: GuiColor?

    public var label: String
    public let text: Binding<String>
    public var placeHolder: String?
    public var maxLength: Int
    public var options: GuiInputTextConfig
    public let type: TextFieldType

    public init(
        type: TextFieldType = .default,
        label: String = "",
        text: Binding<String>,
        placeHolder: String? = nil,
        maxLength: Int = 2048,
        options: GuiInputTextConfig = .none
    ) {
        self.type = type
        self.label = label
        self.text = text
        self.placeHolder = placeHolder
        self.maxLength = maxLength
        self.options = options
    }

    public func render() {
        withModifiers(modifiers) {
            var styleScope = StyleScope()
            styleScope.push(.frameBg, color: backgroundColor)

            switch type {
            case .default:
                renderDefaultField()
            case .multiline:
                renderMultilineField()
            }

            styleScope.pop()
        }
    }

    private func renderDefaultField() {
        var buffer = text.wrappedValue.cChars(with: maxLength)

        let changed: Bool
        if let placeHolder = placeHolder {
            changed = ImGuiWrapper.inputText(
                withHint: label,
                hint: placeHolder,
                buffer: &buffer,
                bufferSize: Int32(maxLength),
                flags: options.rawValue
            )
        } else {
            changed = ImGuiWrapper.inputText(
                label,
                buffer: &buffer,
                bufferSize: Int32(maxLength),
                flags: options.rawValue
            )
        }

        // Always update the binding, not just when changed is true
        // ImGui modifies the buffer on every frame, changed just indicates completion
        if let nullIndex = buffer.firstIndex(of: 0) {
            let validBuffer = Array(buffer[..<nullIndex]) + [0]
            let newText = String(cString: validBuffer)
            if newText != text.wrappedValue {
                text.wrappedValue = newText
            }
        }
    }

    private func renderMultilineField() {
        let bufferSize = text.wrappedValue.count + maxLength
        var buffer = text.wrappedValue.cChars(with: bufferSize)

        _ = ImGuiWrapper.inputTextMultiline(
            modifiers.id ?? "##textfield",
            buffer: &buffer,
            bufferSize: Int32(buffer.count + maxLength),
            size: size ?? .zero,
            flags: options.rawValue
        )

        // Always update the binding, not just when changed is true
        if let nullIndex = buffer.firstIndex(of: 0) {
            let validBuffer = Array(buffer[..<nullIndex]) + [0]
            let newText = String(cString: validBuffer)
            if newText != text.wrappedValue {
                text.wrappedValue = newText
            }
        }
    }
}
