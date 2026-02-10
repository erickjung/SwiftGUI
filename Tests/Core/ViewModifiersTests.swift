//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Testing
@testable import SwiftGUI

@Suite("ViewModifiers Tests")
struct ViewModifiersTests {

    @Test("ViewModifiers defaults all properties to nil")
    func defaultsNil() {
        let modifiers = ViewModifiers()

        #expect(modifiers.id == nil)
        #expect(modifiers.snapWidth == nil)
        #expect(modifiers.padding == nil)
        #expect(modifiers.paddingValue == nil)
        #expect(modifiers.fontIndex == nil)
        #expect(modifiers.textColor == nil)
        #expect(modifiers.onHover == nil)
    }

    @Test("id can be assigned")
    func assignId() {
        var modifiers = ViewModifiers()
        modifiers.id = "test-id"

        #expect(modifiers.id == "test-id")
    }

    @Test("padding can be assigned")
    func assignPadding() {
        var modifiers = ViewModifiers()
        modifiers.padding = .top
        modifiers.paddingValue = 10.0

        #expect(modifiers.padding == .top)
        #expect(modifiers.paddingValue == 10.0)
    }

    @Test("snapWidth can be assigned")
    func assignSnapWidth() {
        var modifiers = ViewModifiers()
        modifiers.snapWidth = true

        #expect(modifiers.snapWidth == true)
    }

    @Test("fontIndex can be assigned")
    func assignFontIndex() {
        var modifiers = ViewModifiers()
        modifiers.fontIndex = 2

        #expect(modifiers.fontIndex == 2)
    }

    @Test("textColor can be assigned")
    func assignTextColor() {
        var modifiers = ViewModifiers()
        let color = GuiColor.red
        modifiers.textColor = color

        #expect(modifiers.textColor == color)
    }

    @Test("onHover callback can be assigned and invoked")
    func assignOnHover() {
        var modifiers = ViewModifiers()
        var called = false

        modifiers.onHover = {
            called = true
            return nil
        }

        #expect(modifiers.onHover != nil)
        _ = modifiers.onHover?()
        #expect(called)
    }
}
