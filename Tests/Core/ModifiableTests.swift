//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Testing
@testable import SwiftGUI

// MARK: - Test Helper

/// Minimal test struct conforming to GuiView + Modifiable
private struct TestModifiableView: Modifiable {
    var modifiers = ViewModifiers()

    func render() {
        // No-op for testing
    }
}

// MARK: - Tests

@Suite("Modifiable Tests")
struct ModifiableTests {

    @Test("identifier returns copy with id set")
    func identifierReturnsCopyWithId() {
        let original = TestModifiableView()
        let modified = original.identifier("test-id")

        #expect(modified.modifiers.id == "test-id")
        #expect(original.modifiers.id == nil)
    }

    @Test("textColor returns copy with textColor set")
    func textColorReturnsCopy() {
        let original = TestModifiableView()
        let color = GuiColor.red
        let modified = original.textColor(color)

        #expect(modified.modifiers.textColor == color)
        #expect(original.modifiers.textColor == nil)
    }

    @Test("padding sets both edge and value")
    func paddingSetsBothFields() {
        let original = TestModifiableView()
        let modified = original.padding(.top, value: 10.0)

        #expect(modified.modifiers.padding == .top)
        #expect(modified.modifiers.paddingValue == 10.0)
        #expect(original.modifiers.padding == nil)
        #expect(original.modifiers.paddingValue == nil)
    }

    @Test("font returns copy with fontIndex set")
    func fontReturnsCopy() {
        let original = TestModifiableView()
        let modified = original.font(2)

        #expect(modified.modifiers.fontIndex == 2)
        #expect(original.modifiers.fontIndex == nil)
    }

    @Test("snap returns copy with snapWidth set to true")
    func snapReturnsCopy() {
        let original = TestModifiableView()
        let modified = original.snap()

        #expect(modified.modifiers.snapWidth == true)
        #expect(original.modifiers.snapWidth == nil)
    }

    @Test("onHover returns copy with callback set")
    func onHoverReturnsCopy() {
        let original = TestModifiableView()
        var called = false

        let modified = original.onHover {
            called = true
            return nil
        }

        #expect(modified.modifiers.onHover != nil)
        #expect(original.modifiers.onHover == nil)

        _ = modified.modifiers.onHover?()
        #expect(called)
    }

    @Test("Chained modifiers preserve all values")
    func chainedModifiersPreservesAllValues() {
        let original = TestModifiableView()
        let color = GuiColor.blue

        let modified = original
            .identifier("chained-id")
            .textColor(color)
            .padding(.leading, value: 5.0)
            .font(1)
            .snap()

        #expect(modified.modifiers.id == "chained-id")
        #expect(modified.modifiers.textColor == color)
        #expect(modified.modifiers.padding == .leading)
        #expect(modified.modifiers.paddingValue == 5.0)
        #expect(modified.modifiers.fontIndex == 1)
        #expect(modified.modifiers.snapWidth == true)

        // Verify original is unchanged
        #expect(original.modifiers.id == nil)
        #expect(original.modifiers.textColor == nil)
        #expect(original.modifiers.padding == nil)
        #expect(original.modifiers.paddingValue == nil)
        #expect(original.modifiers.fontIndex == nil)
        #expect(original.modifiers.snapWidth == nil)
    }
}
