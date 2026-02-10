//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Testing
@testable import SwiftGUI

@Suite("Layout Views Tests")
struct LayoutViewsTests {

    // MARK: - HStack Tests

    @Test("HStack is a struct with fixed layout")
    func hstackIsStruct() {
        let size = MemoryLayout<HStack>.size
        #expect(size > 0)
    }

    @Test("HStack accepts @GuiBuilder closure")
    func hstackAcceptsBuilder() {
        let hstack = HStack {
            Empty()
            Empty()
        }

        #expect(hstack != nil)
    }

    @Test("HStack stores spacing value")
    func hstackWithSpacing() {
        let hstack = HStack(spacing: 10.0) {
            Empty()
            Empty()
        }

        #expect(hstack.spacing == 10.0)
    }

    @Test("HStack has default spacing of -1.0")
    func hstackWithDefaultSpacing() {
        let hstack = HStack {
            Empty()
        }

        #expect(hstack.spacing == -1.0)
    }

    // MARK: - NewLine Tests

    @Test("NewLine is a struct with fixed layout")
    func newLineIsStruct() {
        let size = MemoryLayout<NewLine>.size
        #expect(size >= 0)
    }

    @Test("NewLine can be created")
    func newLineCanBeCreated() {
        let newLine = NewLine()
        #expect(newLine != nil)
    }

    // MARK: - SameLine Tests

    @Test("SameLine is a struct with fixed layout")
    func sameLineIsStruct() {
        let size = MemoryLayout<SameLine>.size
        #expect(size > 0)
    }

    @Test("SameLine has correct default values")
    func sameLineWithDefaults() {
        let sameLine = SameLine()
        #expect(sameLine.offsetX == .zero)
        #expect(sameLine.spacing == -1.0)
    }

    @Test("SameLine stores custom values")
    func sameLineWithCustomValues() {
        let sameLine = SameLine(offsetX: CGPoint(x: 10, y: 0), spacing: 5.0)
        #expect(sameLine.offsetX.x == 10)
        #expect(sameLine.spacing == 5.0)
    }

    // MARK: - Spacing Tests

    @Test("Spacing is a struct with fixed layout")
    func spacingIsStruct() {
        let size = MemoryLayout<Spacing>.size
        #expect(size >= 0)
    }

    @Test("Spacing can be created")
    func spacingCanBeCreated() {
        let spacing = Spacing()
        #expect(spacing != nil)
    }

    // MARK: - Divider Tests

    @Test("Divider is a struct with fixed layout")
    func dividerIsStruct() {
        let size = MemoryLayout<Divider>.size
        #expect(size >= 0)
    }

    @Test("Divider can be created")
    func dividerCanBeCreated() {
        let divider = Divider()
        #expect(divider != nil)
    }

    // MARK: - ColumnNext Tests

    @Test("ColumnNext is a struct with fixed layout")
    func columnNextIsStruct() {
        let size = MemoryLayout<ColumnNext>.size
        #expect(size >= 0)
    }

    @Test("ColumnNext can be created")
    func columnNextCanBeCreated() {
        let columnNext = ColumnNext()
        #expect(columnNext != nil)
    }

    // MARK: - ColumnWidth Tests

    @Test("ColumnWidth is a struct with fixed layout")
    func columnWidthIsStruct() {
        let size = MemoryLayout<ColumnWidth>.size
        #expect(size > 0)
    }

    @Test("ColumnWidth stores index and width values")
    func columnWidthStoresValues() {
        let columnWidth = ColumnWidth(index: 2, width: 100.0)
        #expect(columnWidth.index == 2)
        #expect(columnWidth.width == 100.0)
    }

    // MARK: - Tooltip Tests

    @Test("Tooltip is a struct with fixed layout")
    func tooltipIsStruct() {
        let size = MemoryLayout<Tooltip>.size
        #expect(size > 0)
    }

    @Test("Tooltip accepts @GuiBuilder closure")
    func tooltipAcceptsBuilder() {
        let tooltip = Tooltip {
            Empty()
        }

        #expect(tooltip != nil)
    }

    @Test("Tooltip accepts multiple children via builder")
    func tooltipWithMultipleChildren() {
        let tooltip = Tooltip {
            Empty()
            NewLine()
            Spacing()
        }

        #expect(tooltip != nil)
    }
}
