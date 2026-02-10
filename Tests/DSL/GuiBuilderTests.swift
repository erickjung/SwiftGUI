//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Testing
@testable import SwiftGUI

@Suite("GuiBuilder Tests")
struct GuiBuilderTests {

    // MARK: - buildBlock tests

    @Test("buildBlock returns Empty when called with no arguments")
    func buildBlockEmpty() {
        let result = GuiBuilder.buildBlock()
        #expect(result is Empty)
    }

    @Test("buildBlock returns single view when called with one argument")
    func buildBlockSingle() {
        let text = Text("Hello")
        let result = GuiBuilder.buildBlock(text)
        #expect(result is Text)
    }

    @Test("buildBlock returns GuiNodeList when called with multiple views")
    func buildBlockVariadic() {
        let text1 = Text("First")
        let text2 = Text("Second")
        let result = GuiBuilder.buildBlock(text1, text2)

        #expect(result is GuiNodeList)
        if let nodeList = result as? GuiNodeList {
            #expect(nodeList.children.count == 2)
        }
    }

    // MARK: - buildOptional tests

    @Test("buildOptional returns view when non-nil")
    func buildOptionalSome() {
        let text = Text("Hello")
        let result = GuiBuilder.buildOptional(text)
        #expect(result is Text)
    }

    @Test("buildOptional returns Empty when nil")
    func buildOptionalNone() {
        let result = GuiBuilder.buildOptional(nil)
        #expect(result is Empty)
    }

    // MARK: - buildEither tests

    @Test("buildEither first returns first view")
    func buildEitherFirst() {
        let text = Text("First")
        let result = GuiBuilder.buildEither(first: text)
        #expect(result is Text)
    }

    @Test("buildEither second returns second view")
    func buildEitherSecond() {
        let text = Text("Second")
        let result = GuiBuilder.buildEither(second: text)
        #expect(result is Text)
    }

    // MARK: - buildArray tests

    @Test("buildArray returns GuiNodeList with correct number of children")
    func buildArray() {
        let views: [GuiView] = [Text("a"), Text("b"), Text("c")]
        let result = GuiBuilder.buildArray(views)

        #expect(result is GuiNodeList)
        if let nodeList = result as? GuiNodeList {
            #expect(nodeList.children.count == 3)
        }
    }

    // MARK: - buildLimitedAvailability tests

    @Test("buildLimitedAvailability returns view unchanged")
    func buildLimitedAvailability() {
        let text = Text("Available")
        let result = GuiBuilder.buildLimitedAvailability(text)
        #expect(result is Text)
    }

    // MARK: - Integration tests

    @Test("Builder closure with multiple statements creates GuiNodeList")
    func builderClosureCompiles() {
        func buildTestView(@GuiBuilder content: () -> GuiView) -> GuiView {
            content()
        }

        let result = buildTestView {
            Text("Line 1")
            Text("Line 2")
        }

        #expect(result is GuiNodeList)
        if let nodeList = result as? GuiNodeList {
            #expect(nodeList.children.count == 2)
        }
    }

    @Test("Builder closure with conditional produces correct view")
    func builderClosureWithConditional() {
        func buildTestView(@GuiBuilder content: () -> GuiView) -> GuiView {
            content()
        }

        let showText = true
        let result = buildTestView {
            if showText {
                Text("Visible")
            }
        }

        #expect(result is Text)
    }

    @Test("Builder closure with if-else produces correct view")
    func builderClosureWithIfElse() {
        func buildTestView(@GuiBuilder content: () -> GuiView) -> GuiView {
            content()
        }

        let condition = true
        let result = buildTestView {
            if condition {
                Text("True branch")
            } else {
                Text("False branch")
            }
        }

        #expect(result is Text)
    }

    @Test("Builder closure with for-in loop uses buildArray")
    func builderClosureWithForLoop() {
        func buildTestView(@GuiBuilder content: () -> GuiView) -> GuiView {
            content()
        }

        let result = buildTestView {
            for i in 1...3 {
                Text("Item \(i)")
            }
        }

        #expect(result is GuiNodeList)
        if let nodeList = result as? GuiNodeList {
            #expect(nodeList.children.count == 3)
        }
    }
}
