//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Testing
@testable import SwiftGUI

// MARK: - Test Helpers

/// Minimal test struct conforming to HasBackgroundColor
private struct TestBackgroundView: HasBackgroundColor {
    var backgroundColor: GuiColor?

    func render() {
        // No-op for testing
    }
}

/// Minimal test struct conforming to HasSize
private struct TestSizableView: HasSize {
    var size: GuiSize?

    func render() {
        // No-op for testing
    }
}

/// Test struct conforming to multiple component modifiers
private struct TestMultiModifierView: HasBackgroundColor, HasBorderColor, HasSize {
    var backgroundColor: GuiColor?
    var borderColor: GuiColor?
    var size: GuiSize?

    func render() {
        // No-op for testing
    }
}

// MARK: - Tests

@Suite("Component Modifiers Tests")
struct ComponentModifiersTests {

    // MARK: - HasBackgroundColor Tests

    @Test("backgroundColor returns copy with backgroundColor set")
    func backgroundColorReturnsCopy() {
        let original = TestBackgroundView()
        let color = GuiColor.red
        let modified = original.backgroundColor(color)

        #expect(modified.backgroundColor == color)
        #expect(original.backgroundColor == nil)
    }

    // MARK: - HasSize Tests

    @Test("size returns copy with size set")
    func sizeReturnsCopy() {
        let original = TestSizableView()
        let size = GuiSize(width: 100, height: 50)
        let modified = original.size(size)

        #expect(modified.size == size)
        #expect(original.size == nil)
    }

    @Test("size with width and height returns copy")
    func sizeWidthHeightReturnsCopy() {
        let original = TestSizableView()
        let modified = original.size(width: 200, height: 100)

        #expect(modified.size?.width == 200)
        #expect(modified.size?.height == 100)
        #expect(original.size == nil)
    }

    // MARK: - Multiple Modifiers Tests

    @Test("Multiple component modifiers are chainable")
    func multipleComponentModifiersChainable() {
        let original = TestMultiModifierView()
        let bgColor = GuiColor.blue
        let borderColor = GuiColor.red
        let size = GuiSize(width: 150, height: 75)

        let modified = original
            .backgroundColor(bgColor)
            .borderColor(borderColor)
            .size(size)

        #expect(modified.backgroundColor == bgColor)
        #expect(modified.borderColor == borderColor)
        #expect(modified.size == size)

        // Verify original is unchanged
        #expect(original.backgroundColor == nil)
        #expect(original.borderColor == nil)
        #expect(original.size == nil)
    }

    // MARK: - Other Component Modifiers Tests

    @Test("HasActiveColor works correctly")
    func hasActiveColor() {
        struct TestView: HasActiveColor {
            var activeColor: GuiColor?
            func render() {}
        }

        let original = TestView()
        let modified = original.activeColor(.green)

        #expect(modified.activeColor == .green)
        #expect(original.activeColor == nil)
    }

    @Test("HasHoveredColor works correctly")
    func hasHoveredColor() {
        struct TestView: HasHoveredColor {
            var hoveredColor: GuiColor?
            func render() {}
        }

        let original = TestView()
        let modified = original.hoveredColor(.yellow)

        #expect(modified.hoveredColor == .yellow)
        #expect(original.hoveredColor == nil)
    }

    @Test("HasSelectionColor works correctly")
    func hasSelectionColor() {
        struct TestView: HasSelectionColor {
            var selectionColor: GuiColor?
            func render() {}
        }

        let original = TestView()
        let modified = original.selectionColor(.cyan)

        #expect(modified.selectionColor == .cyan)
        #expect(original.selectionColor == nil)
    }

    @Test("HasTintColor works correctly")
    func hasTintColor() {
        struct TestView: HasTintColor {
            var tintColor: GuiColor?
            func render() {}
        }

        let original = TestView()
        let modified = original.tintColor(.magenta)

        #expect(modified.tintColor == .magenta)
        #expect(original.tintColor == nil)
    }

    @Test("HasBorderColor works correctly")
    func hasBorderColor() {
        struct TestView: HasBorderColor {
            var borderColor: GuiColor?
            func render() {}
        }

        let original = TestView()
        let modified = original.borderColor(.orange)

        #expect(modified.borderColor == .orange)
        #expect(original.borderColor == nil)
    }
}
