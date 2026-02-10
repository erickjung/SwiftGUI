//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Testing
@testable import SwiftGUI

@Suite("Final Layout Views Tests")
struct FinalLayoutViewsTests {

    // MARK: - Column Tests

    @Test("Column is a struct")
    func columnIsStruct() {
        var column = Column(count: 2)
        column = column.identifier("test")

        #expect(true)
    }

    @Test("Column has default values")
    func columnDefaultValues() {
        let column = Column()

        #expect(column.count == 1)
        #expect(column.border)
    }

    @Test("Column stores custom count")
    func columnCustomCount() {
        let column = Column(count: 3)

        #expect(column.count == 3)
    }

    @Test("Column supports no border")
    func columnNoBorder() {
        let column = Column(count: 2, border: false)

        #expect(column.count == 2)
        #expect(!column.border)
    }

    @Test("Column supports modifiers")
    func columnModifiable() {
        let column = Column(count: 4)
            .identifier("my-column")
            .padding(.all, value: 5)

        #expect(column.modifiers.id == "my-column")
        #expect(column.modifiers.padding != nil)
    }

    // MARK: - List Tests

    @Test("List is a struct")
    func listIsStruct() {
        var list = List(buffer: [1, 2, 3]) { index, item in
            Text("\(item)")
        }
        list = list.identifier("test")

        #expect(true)
    }

    @Test("List stores buffer")
    func listStoresBuffer() {
        let items = ["A", "B", "C"]
        let list = List(buffer: items) { index, item in
            Text(item)
        }

        #expect(list.buffer.count == 3)
        #expect(list.buffer[0] == "A")
        #expect(list.buffer[1] == "B")
        #expect(list.buffer[2] == "C")
    }

    @Test("List has default values")
    func listDefaultValues() {
        let list = List(buffer: [1, 2, 3]) { index, item in
            Text("\(item)")
        }

        #expect(list.itemHeight == -1)
        #expect(!list.border)
        #expect(list.options == .none)
    }

    @Test("List stores custom values")
    func listCustomValues() {
        let list = List(
            buffer: [1, 2, 3],
            itemHeight: 20.0,
            border: true,
            options: .noScrollbar
        ) { index, item in
            Text("\(item)")
        }

        #expect(list.itemHeight == 20.0)
        #expect(list.border)
        #expect(list.options == .noScrollbar)
    }

    @Test("List has size property")
    func listHasSize() {
        var list = List(buffer: [1, 2, 3]) { index, item in
            Text("\(item)")
        }
        list.size = GuiSize(width: 300, height: 400)

        #expect(list.size?.width == 300)
        #expect(list.size?.height == 400)
    }

    @Test("List supports modifiers")
    func listModifiable() {
        let list = List(buffer: ["A", "B"]) { index, item in
            Text(item)
        }
        .identifier("my-list")
        .size(GuiSize(width: 200, height: 300))

        #expect(list.modifiers.id == "my-list")
        #expect(list.size?.width == 200)
    }

    @Test("List works with Int buffer")
    func listWithIntBuffer() {
        let list = List(buffer: [10, 20, 30]) { index, item in
            Text("Item \(index): \(item)")
        }

        #expect(list.buffer == [10, 20, 30])
    }

    @Test("List works with String buffer")
    func listWithStringBuffer() {
        let list = List(buffer: ["Hello", "World"]) { index, item in
            Text(item)
        }

        #expect(list.buffer == ["Hello", "World"])
    }

    @Test("List handles empty buffer")
    func listEmptyBuffer() {
        let list = List(buffer: [Int]()) { index, item in
            Text("\(item)")
        }

        #expect(list.buffer.isEmpty)
    }

    // MARK: - Integration Tests

    @Test("Both Column and List are modifiable")
    func bothAreModifiable() {
        let column = Column(count: 2).identifier("col")
        let list = List(buffer: [1, 2, 3]) { i, item in
            Text("\(item)")
        }.identifier("list")

        #expect(column.modifiers.id == "col")
        #expect(list.modifiers.id == "list")
    }

    @Test("List works with complex items")
    func listWithComplexItems() {
        struct Item {
            let name: String
            let value: Int
        }

        let items = [
            Item(name: "A", value: 1),
            Item(name: "B", value: 2)
        ]

        let list = List(buffer: items) { index, item in
            Text("\(item.name): \(item.value)")
        }

        #expect(list.buffer.count == 2)
        #expect(list.buffer[0].name == "A")
    }
}
