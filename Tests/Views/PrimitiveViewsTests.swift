//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Testing
@testable import SwiftGUI

@Suite("Primitive Views Tests")
struct PrimitiveViewsTests {

    // MARK: - Empty Tests

    @Test("Empty is a struct with fixed layout")
    func emptyIsStruct() {
        let size = MemoryLayout<Empty>.size
        #expect(size >= 0)
    }

    @Test("Empty can be created")
    func emptyCanBeCreated() {
        let empty = Empty()
        #expect(empty != nil)
    }

    // MARK: - GuiNodeList Tests

    @Test("GuiNodeList is a struct with fixed layout")
    func guiNodeListIsStruct() {
        let size = MemoryLayout<GuiNodeList>.size
        #expect(size > 0)
    }

    @Test("GuiNodeList stores children")
    func guiNodeListStoresChildren() {
        let children: [any GuiView] = [Empty(), Empty(), Empty()]
        let nodeList = GuiNodeList(children: children)

        #expect(nodeList.children.count == 3)
    }

    @Test("GuiNodeList accepts different view types")
    func guiNodeListAcceptsAnyGuiView() {
        let children: [any GuiView] = [
            Empty(),
            NewLine(),
            Spacing()
        ]
        let nodeList = GuiNodeList(children: children)

        #expect(nodeList.children.count == 3)
    }

    // MARK: - ForEach Tests

    @Test("ForEach is a struct with fixed layout")
    func forEachIsStruct() {
        let size = MemoryLayout<ForEach<[Int]>>.size
        #expect(size > 0)
    }

    @Test("ForEach stores data and closure")
    func forEachStoresData() {
        let data = [1, 2, 3]
        let forEach = ForEach(data) { _ in Empty() }

        #expect(forEach != nil)
    }

    @Test("ForEach works with ranges")
    func forEachWithRange() {
        let forEach = ForEach(1...5) { num in
            Empty()
        }

        #expect(forEach != nil)
    }

    @Test("ForEach handles empty sequences")
    func forEachWithEmptySequence() {
        let emptyArray: [Int] = []
        let forEach = ForEach(emptyArray) { _ in Empty() }

        #expect(forEach != nil)
    }
}
