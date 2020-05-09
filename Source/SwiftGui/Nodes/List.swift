//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// ListBox node.
/// NOTE: Use this for small/medium lists
/// - parameter title: Text for node
/// - parameter currentItemState: Current item selected state
/// - parameter items: List of text items
/// - parameter onChange: Callback for state changing
/// - returns: New node
public func ListBox(_ title: String,
                    currentItemState: Int,
                    items: [String],
                    onChange: ((Int) -> Void)? = nil) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        var _currentItem = Int32(currentItemState)
        if ImGuiWrapper.listBox(title, currentItem: &_currentItem, items: items.map { $0 }, heightInItems: -1) {

            if _currentItem != currentItemState {

                onChange?(Int(_currentItem))
            }
        }
    }
}

/// List node.
/// NOTE: Use this for small/medium lists
/// - parameter id: Node id
/// - parameter size: List height
/// - parameter border: Show list border
/// - parameter options: Node options
/// - parameter child: List of child nodes
/// - returns: New node
public func List(id: String = "##list",
                 size: GuiSize = .zero,
                 border: Bool = false,
                 options: GuiWindowConfig = .none,
                 @GuiBuilder child: () -> GuiView?) -> GuiNode {

     GuiNode(tag: #function, child: child()).onRender { child in

        if ImGuiWrapper.beginChild(id, size: size, border: border, flags: options.rawValue) {

             child?.render()
        }
        ImGuiWrapper.endChild()
    }
}

/// List node.
/// NOTE: Use this for large lists as will clipper rendered data properly
/// - parameter id: Node id
/// - parameter itemHeight: Height for each item row
/// - parameter size: List height
/// - parameter border: Show list border
/// - parameter options: Node options
/// - parameter onLoop: Callback for data changing
/// - returns: New node
public func List<T>(id: String = "##list_buffer",
                    buffer: [T],
                    itemHeight: Float = -1,
                    size: GuiSize = .zero,
                    border: Bool = false,
                    options: GuiWindowConfig = .none,
                    onLoop: @escaping ((Int, T) -> GuiNode?)) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        if ImGuiWrapper.beginChild(id, size: size, border: border, flags: options.rawValue) {

            if let clipper = ImGuiWrapper.listClipperCreate(0, itemsHeight: itemHeight) {

                ImGuiWrapper.listClipperBegin(clipper, itemsCount: Int32(buffer.count), itemsHeight: itemHeight)

                ImGuiWrapper.listClipperLoop(clipper) { index in

                    onLoop(Int(index), buffer[Int(index)])?.render()
                }

                ImGuiWrapper.listClipperEnd(clipper)

                ImGuiWrapper.listClipperDestroy(clipper)
            }
        }

        ImGuiWrapper.endChild()
    }
}
