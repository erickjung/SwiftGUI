//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Testing
@testable import SwiftGUI

@Suite("Action Controls Tests")
struct ActionControlsTests {

    // MARK: - Button Tests

    @Test("Button is a struct with fixed layout")
    func buttonIsStruct() {
        let size = MemoryLayout<Button>.size
        #expect(size > 0)
    }

    @Test("Button supports all color and size modifiers")
    func buttonAllModifiers() {
        let button = Button("Click me")
            .backgroundColor(.red)
            .borderColor(.blue)
            .activeColor(.green)
            .hoveredColor(.yellow)
            .size(CGSize(width: 100, height: 30))

        #expect(button.backgroundColor == .red)
        #expect(button.borderColor == .blue)
        #expect(button.activeColor == .green)
        #expect(button.hoveredColor == .yellow)
        #expect(button.size?.width == 100)
        #expect(button.size?.height == 30)
    }

    @Test("Button stores onTap closure")
    func buttonOnTapStored() {
        var tapped = false
        let button = Button("Tap") {
            tapped = true
        }

        #expect(button != nil)
        #expect(!tapped)
    }

    @Test("Button stores small type")
    func buttonSmallType() {
        let button = Button("Small", type: .small)

        #expect(button.type == .small)
        #expect(button.text == "Small")
    }

    @Test("Button defaults to default type")
    func buttonDefaultType() {
        let button = Button("Default")

        #expect(button.type == .default)
    }

    @Test("Button supports Modifiable protocol")
    func buttonModifiable() {
        let button = Button("Test")
            .identifier("btn-1")
            .textColor(.red)

        #expect(button.modifiers.id == "btn-1")
        #expect(button.modifiers.textColor == .red)
    }

    @Test("Button supports chained modifiers")
    func buttonChainedModifiers() {
        let button = Button("Chain")
            .backgroundColor(.gray)
            .activeColor(.white)
            .size(width: 80, height: 25)
            .identifier("chain-btn")
            .padding(.all, value: 5)

        #expect(button.backgroundColor == .gray)
        #expect(button.activeColor == .white)
        #expect(button.size?.width == 80)
        #expect(button.modifiers.id == "chain-btn")
        #expect(button.modifiers.padding == .all)
        #expect(button.modifiers.paddingValue == 5)
    }

    // MARK: - MenuItem Tests

    @Test("MenuItem is a struct with fixed layout")
    func menuItemIsStruct() {
        let size = MemoryLayout<MenuItem>.size
        #expect(size > 0)
    }

    @Test("MenuItem stores all values")
    func menuItemStoresValues() {
        let item = MenuItem("Open", shortcut: "Cmd+O", selected: true, enabled: false)

        #expect(item.text == "Open")
        #expect(item.shortcut == "Cmd+O")
        #expect(item.selected)
        #expect(!item.enabled)
    }

    @Test("MenuItem stores action closure")
    func menuItemWithAction() {
        var actionCalled = false
        let item = MenuItem("Action") {
            actionCalled = true
        }

        #expect(item != nil)
        #expect(!actionCalled)
    }

    @Test("MenuItem supports modifiers")
    func menuItemModifiable() {
        let item = MenuItem("Test")
            .identifier("menu-item-1")
            .textColor(.blue)

        #expect(item.modifiers.id == "menu-item-1")
        #expect(item.modifiers.textColor == .blue)
    }

    // MARK: - MenuGroup Tests

    @Test("MenuGroup is a struct with fixed layout")
    func menuGroupIsStruct() {
        let size = MemoryLayout<MenuGroup>.size
        #expect(size > 0)
    }

    @Test("MenuGroup accepts @GuiBuilder")
    func menuGroupAcceptsBuilder() {
        let group = MenuGroup("File") {
            MenuItem("Open")
            MenuItem("Save")
        }

        #expect(group.text == "File")
        #expect(group.enabled)
    }

    @Test("MenuGroup stores disabled state")
    func menuGroupDisabled() {
        let group = MenuGroup("Edit", enabled: false) {
            MenuItem("Cut")
        }

        #expect(!group.enabled)
    }

    @Test("MenuGroup supports backgroundColor")
    func menuGroupBackgroundColor() {
        let group = MenuGroup("View") {
            MenuItem("Zoom In")
        }.backgroundColor(.darkGray)

        #expect(group.backgroundColor == .darkGray)
    }

    @Test("MenuGroup supports modifiers")
    func menuGroupModifiable() {
        let group = MenuGroup("Help") {
            MenuItem("About")
        }.identifier("help-menu")

        #expect(group.modifiers.id == "help-menu")
    }

    // MARK: - MenuBar Tests

    @Test("MenuBar is a struct with fixed layout")
    func menuBarIsStruct() {
        let size = MemoryLayout<MenuBar>.size
        #expect(size > 0)
    }

    @Test("MenuBar accepts @GuiBuilder with multiple groups")
    func menuBarAcceptsBuilder() {
        let menuBar = MenuBar {
            MenuGroup("File") {
                MenuItem("Open")
            }
            MenuGroup("Edit") {
                MenuItem("Cut")
            }
        }

        #expect(menuBar != nil)
    }

    @Test("MenuBar supports backgroundColor")
    func menuBarBackgroundColor() {
        let menuBar = MenuBar {
            MenuGroup("File") {
                MenuItem("Open")
            }
        }.backgroundColor(.lightGray)

        #expect(menuBar.backgroundColor == .lightGray)
    }

    @Test("MenuBar supports hoveredColor")
    func menuBarHoveredColor() {
        let menuBar = MenuBar {
            MenuGroup("File") {
                MenuItem("Open")
            }
        }.hoveredColor(.cyan)

        #expect(menuBar.hoveredColor == .cyan)
    }

    @Test("MenuBar supports chained modifiers")
    func menuBarChainedModifiers() {
        let menuBar = MenuBar {
            MenuGroup("File") {
                MenuItem("Open")
            }
        }
        .backgroundColor(.black)
        .hoveredColor(.white)
        .identifier("main-menu")

        #expect(menuBar.backgroundColor == .black)
        #expect(menuBar.hoveredColor == .white)
        #expect(menuBar.modifiers.id == "main-menu")
    }
}
