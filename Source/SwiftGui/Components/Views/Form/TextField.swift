//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class TextField: GuiNode,
                        SizeModifier,
                        BackgroundColorModifier {

    public enum TextFieldType {
        case `default`
        case multiline
    }

    public var size: GuiSize?
    public var backgroundColor: GuiColor?

    public var label: String
    public var textState: String
    public var placeHolder: String?
    public var maxLength: Int
    public var options: GuiInputTextConfig

    public private(set) var type: TextFieldType
    private let onChange: ((String) -> Void)?

    public init(type: TextFieldType = .default,
                label: String = "",
                textState: String,
                placeHolder: String? = nil,
                maxLength: Int = 2048,
                options: GuiInputTextConfig = .none,
                onChange: ((String) -> Void)? = nil) {

        self.label = label
        self.textState = textState
        self.placeHolder = placeHolder
        self.maxLength = maxLength
        self.options = options
        self.type = type
        self.onChange = onChange
    }

    public override func drawComponent() {

        if let color = self.backgroundColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.frameBg.rawValue, colorRef: color.cgColor)
        }

        switch self.type {

        case .default:
            self.renderDefaultField()

        case .multiline:
            self.renderMultilineField()

        }

        if self.backgroundColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }
    }

    private func renderDefaultField() {

        var _value = textState.cChars(with: self.maxLength)

        if let placeHolder = placeHolder {

            if ImGuiWrapper.inputText(withHint: self.label,
                                      hint: placeHolder,
                                      buffer: &_value,
                                      bufferSize: Int32(self.maxLength),
                                      flags: self.options.rawValue) {

                onChange?(String(cString: _value))
            }

        } else {

            if ImGuiWrapper.inputText(self.label,
                                      buffer: &_value,
                                      bufferSize: Int32(self.maxLength),
                                      flags: self.options.rawValue) {

                onChange?(String(cString: _value))
            }
        }
    }

    private func renderMultilineField() {

        var _value = self.textState.cChars(with: self.textState.count + self.maxLength)
        if ImGuiWrapper.inputTextMultiline(self.id ?? "##textfield",
                                           buffer: &_value,
                                           bufferSize: Int32(_value.count + self.maxLength),
                                           size: self.size ?? .zero,
                                           flags: self.options.rawValue) {

            onChange?(String(cString: _value))
        }
    }
}
