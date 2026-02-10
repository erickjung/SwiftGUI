//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Testing
@testable import SwiftGUI

@Suite("Container Views Tests")
struct ContainerViewsTests {

    // MARK: - Window Tests

    @Test("Window is a struct")
    func windowIsStruct() {
        var window = Window {
            Text("Content")
        }
        window = window.identifier("test")

        #expect(true)
    }

    @Test("Window accepts @GuiBuilder with multiple children")
    func windowAcceptsBuilder() {
        let window = Window("Test Window") {
            Text("Line 1")
            Text("Line 2")
        }

        #expect(window.text == "Test Window")
        #expect(window.options == .none)
    }

    @Test("Window supports modifiers")
    func windowModifiable() {
        let window = Window("Main") {
            Text("Content")
        }
        .identifier("main-window")
        .textColor(.white)

        #expect(window.modifiers.id == "main-window")
        #expect(window.modifiers.textColor != nil)
    }

    @Test("Window supports position modifier")
    func windowPositionModifier() {
        let window = Window {
            Text("Test")
        }
        .position(GuiPoint(x: 100, y: 200), condition: .always)

        #expect(window.position?.x == 100)
        #expect(window.position?.y == 200)
        #expect(window.positionCondition == .always)
    }

    @Test("Window supports size modifier")
    func windowSizeModifier() {
        let window = Window {
            Text("Test")
        }
        .windowSize(GuiSize(width: 800, height: 600), condition: .firstUseEver)

        #expect(window.size?.width == 800)
        #expect(window.size?.height == 600)
        #expect(window.sizeCondition == .firstUseEver)
    }

    @Test("Window stores options")
    func windowOptions() {
        let window = Window("Settings", options: .noResize) {
            Text("Settings")
        }

        #expect(window.options == .noResize)
    }

    // MARK: - SubWindow Tests

    @Test("SubWindow is a struct")
    func subWindowIsStruct() {
        var subWindow = SubWindow {
            Text("Content")
        }
        subWindow = subWindow.identifier("test")

        #expect(true)
    }

    @Test("SubWindow supports border parameter")
    func subWindowBorder() {
        let subWindow = SubWindow(border: true) {
            Text("Bordered content")
        }

        #expect(subWindow.border)
    }

    @Test("SubWindow has size property")
    func subWindowHasSize() {
        var subWindow = SubWindow {
            Text("Test")
        }
        subWindow.size = GuiSize(width: 300, height: 200)

        #expect(subWindow.size?.width == 300)
        #expect(subWindow.size?.height == 200)
    }

    @Test("SubWindow supports modifiers")
    func subWindowModifiable() {
        let subWindow = SubWindow {
            Text("Content")
        }
        .identifier("sub")
        .size(GuiSize(width: 400, height: 300))

        #expect(subWindow.modifiers.id == "sub")
        #expect(subWindow.size?.width == 400)
    }

    // MARK: - Group Tests

    @Test("Group is a struct")
    func groupIsStruct() {
        var group = Group {
            Text("Content")
        }
        group = group.identifier("test")

        #expect(true)
    }

    @Test("Group accepts @GuiBuilder")
    func groupAcceptsBuilder() {
        _ = Group {
            Text("Item 1")
            Text("Item 2")
            Text("Item 3")
        }

        #expect(true)
    }

    @Test("Group supports modifiers")
    func groupModifiable() {
        let group = Group {
            Text("Content")
        }
        .identifier("my-group")
        .padding(.all, value: 10)

        #expect(group.modifiers.id == "my-group")
        #expect(group.modifiers.padding != nil)
    }

    // MARK: - Popup Tests

    @Test("Popup is a struct")
    func popupIsStruct() {
        var popup = Popup {
            Text("Popup content")
        }
        popup = popup.identifier("test")

        #expect(true)
    }

    @Test("Popup has default type")
    func popupDefaultType() {
        let popup = Popup {
            Text("Default popup")
        }

        #expect(popup.type == .default)
    }

    @Test("Popup supports modal type")
    func popupModalType() {
        let popup = Popup(type: .modal) {
            Text("Modal popup")
        }

        #expect(popup.type == .modal)
    }

    @Test("Popup stores options")
    func popupOptions() {
        let popup = Popup(type: .default, options: .noMove) {
            Text("Content")
        }

        #expect(popup.options == .noMove)
    }

    @Test("Popup supports modifiers")
    func popupModifiable() {
        let popup = Popup {
            Text("Test")
        }
        .identifier("my-popup")

        #expect(popup.modifiers.id == "my-popup")
    }

    // MARK: - CollapsingHeader Tests

    @Test("CollapsingHeader is a struct")
    func collapsingHeaderIsStruct() {
        var header = CollapsingHeader("Header") {
            Text("Content")
        }
        header = header.identifier("test")

        #expect(true)
    }

    @Test("CollapsingHeader stores text")
    func collapsingHeaderText() {
        let header = CollapsingHeader("Section 1") {
            Text("Details")
        }

        #expect(header.text == "Section 1")
    }

    @Test("CollapsingHeader has color properties")
    func collapsingHeaderHasColors() {
        var header = CollapsingHeader("Header") {
            Text("Content")
        }
        header.backgroundColor = .blue
        header.activeColor = .cyan
        header.hoveredColor = .lightGray

        #expect(header.backgroundColor == .blue)
        #expect(header.activeColor == .cyan)
        #expect(header.hoveredColor == .lightGray)
    }

    @Test("CollapsingHeader stores options")
    func collapsingHeaderOptions() {
        let header = CollapsingHeader("Header", options: .defaultOpen) {
            Text("Content")
        }

        #expect(header.options == .defaultOpen)
    }

    @Test("CollapsingHeader supports modifiers")
    func collapsingHeaderModifiable() {
        let header = CollapsingHeader("Test") {
            Text("Content")
        }
        .identifier("header-1")
        .backgroundColor(.darkGray)

        #expect(header.modifiers.id == "header-1")
        #expect(header.backgroundColor == .darkGray)
    }

    // MARK: - Tree Tests

    @Test("Tree is a struct")
    func treeIsStruct() {
        var tree = Tree("Node") {
            Text("Content")
        }
        tree = tree.identifier("test")

        #expect(true)
    }

    @Test("Tree stores text")
    func treeText() {
        let tree = Tree("Root Node") {
            Text("Child content")
        }

        #expect(tree.text == "Root Node")
    }

    @Test("Tree has color properties")
    func treeHasColors() {
        var tree = Tree("Node") {
            Text("Content")
        }
        tree.activeColor = .green
        tree.hoveredColor = .yellow

        #expect(tree.activeColor == .green)
        #expect(tree.hoveredColor == .yellow)
    }

    @Test("Tree stores options")
    func treeOptions() {
        let tree = Tree("Node", options: .defaultOpen) {
            Text("Content")
        }

        #expect(tree.options == .defaultOpen)
    }

    @Test("Tree supports modifiers")
    func treeModifiable() {
        let tree = Tree("Root") {
            Text("Child")
        }
        .identifier("tree-root")
        .activeColor(.blue)

        #expect(tree.modifiers.id == "tree-root")
        #expect(tree.activeColor == .blue)
    }

    // MARK: - TabBar Tests

    @Test("TabBar is a struct")
    func tabBarIsStruct() {
        var tabBar = TabBar {
            Text("Tabs")
        }
        tabBar = tabBar.identifier("test")

        #expect(true)
    }

    @Test("TabBar accepts @GuiBuilder")
    func tabBarAcceptsBuilder() {
        let tabBar = TabBar {
            TabItem("Tab 1") { Text("Content 1") }
            TabItem("Tab 2") { Text("Content 2") }
        }

        #expect(tabBar.options == .none)
    }

    @Test("TabBar has color properties")
    func tabBarHasColors() {
        var tabBar = TabBar {
            Text("Tabs")
        }
        tabBar.backgroundColor = .darkGray
        tabBar.activeColor = .blue
        tabBar.hoveredColor = .lightGray

        #expect(tabBar.backgroundColor == .darkGray)
        #expect(tabBar.activeColor == .blue)
        #expect(tabBar.hoveredColor == .lightGray)
    }

    @Test("TabBar stores options")
    func tabBarOptions() {
        let tabBar = TabBar(options: .reorderable) {
            Text("Tabs")
        }

        #expect(tabBar.options == .reorderable)
    }

    @Test("TabBar supports modifiers")
    func tabBarModifiable() {
        let tabBar = TabBar {
            Text("Content")
        }
        .identifier("main-tabs")
        .backgroundColor(.gray)

        #expect(tabBar.modifiers.id == "main-tabs")
        #expect(tabBar.backgroundColor == .gray)
    }

    // MARK: - TabItem Tests

    @Test("TabItem is a struct")
    func tabItemIsStruct() {
        var tabItem = TabItem("Tab") {
            Text("Content")
        }
        tabItem = tabItem.identifier("test")

        #expect(true)
    }

    @Test("TabItem stores text")
    func tabItemText() {
        let tabItem = TabItem("Settings") {
            Text("Settings content")
        }

        #expect(tabItem.text == "Settings")
    }

    @Test("TabItem has color properties")
    func tabItemHasColors() {
        var tabItem = TabItem("Tab") {
            Text("Content")
        }
        tabItem.backgroundColor = .white
        tabItem.activeColor = .blue
        tabItem.hoveredColor = .lightGray

        #expect(tabItem.backgroundColor == .white)
        #expect(tabItem.activeColor == .blue)
        #expect(tabItem.hoveredColor == .lightGray)
    }

    @Test("TabItem stores options")
    func tabItemOptions() {
        let tabItem = TabItem("Tab", options: .none) {
            Text("Content")
        }

        #expect(tabItem.options == .none)
    }

    @Test("TabItem supports modifiers")
    func tabItemModifiable() {
        let tabItem = TabItem("Home") {
            Text("Home content")
        }
        .identifier("home-tab")
        .activeColor(.green)

        #expect(tabItem.modifiers.id == "home-tab")
        #expect(tabItem.activeColor == .green)
    }

    // MARK: - Integration Tests

    @Test("All containers are modifiable")
    func allContainersAreModifiable() {
        let window = Window { Empty() }.identifier("w")
        let subWindow = SubWindow { Empty() }.identifier("sw")
        let group = Group { Empty() }.identifier("g")
        let popup = Popup { Empty() }.identifier("p")
        let header = CollapsingHeader("H") { Empty() }.identifier("h")
        let tree = Tree("T") { Empty() }.identifier("t")
        let tabBar = TabBar { Empty() }.identifier("tb")
        let tabItem = TabItem("TI") { Empty() }.identifier("ti")

        #expect(window.modifiers.id == "w")
        #expect(subWindow.modifiers.id == "sw")
        #expect(group.modifiers.id == "g")
        #expect(popup.modifiers.id == "p")
        #expect(header.modifiers.id == "h")
        #expect(tree.modifiers.id == "t")
        #expect(tabBar.modifiers.id == "tb")
        #expect(tabItem.modifiers.id == "ti")
    }

    @Test("Containers support nesting")
    func nestedContainers() {
        let window = Window("App") {
            TabBar {
                TabItem("Tab 1") {
                    Group {
                        Text("Content 1")
                    }
                }
                TabItem("Tab 2") {
                    SubWindow(border: true) {
                        Tree("Root") {
                            Text("Leaf")
                        }
                    }
                }
            }
        }

        #expect(window.text == "App")
    }

    @Test("Container with modifiers compiles correctly")
    func containerWithModifiers() {
        let window = Window("Styled") {
            CollapsingHeader("Section") {
                Text("Details")
            }
            .backgroundColor(.blue)
            .identifier("section-1")
        }
        .position(GuiPoint(x: 100, y: 100))
        .windowSize(GuiSize(width: 800, height: 600))
        .identifier("main")

        #expect(window.modifiers.id == "main")
        #expect(window.position?.x == 100)
        #expect(window.size?.width == 800)
    }
}
