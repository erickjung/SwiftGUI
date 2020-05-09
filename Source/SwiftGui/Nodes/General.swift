//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// Empty node.
/// - returns: New node
public func Empty() -> GuiNode {

    GuiNode(tag: #function)
}

/// Group node.
/// This will just group a list of arbitrary nodes.
/// - parameter id: Node id
/// - parameter child: List of nodes
/// - returns: New node
public func Group(id: String? = nil, @GuiBuilder child: () -> GuiView?) -> GuiNode {

    GuiNode(tag: #function, child: child()).onRender { child in

        if let id = id {

            ImGuiWrapper.pushID(id)
                child?.render()
            ImGuiWrapper.popID()

        } else {

            child?.render()
        }
    }
}

/// HStack node.
/// This will  group a list of arbitrary nodes horizontaly.
/// - parameter child: List of nodes
/// - returns: New node
public func HStack(@GuiBuilder child: () -> GuiView?) -> GuiNode {

    GuiNode(tag: #function, child: child()).onRender { child in

        if let multi = child as? GuiNodeList {

            for child in multi.children {

                ImGuiWrapper.beginGroup()
                child.render()
                ImGuiWrapper.endGroup()
                ImGuiWrapper.sameLine(0.0, spacing: -1.0)
            }
            ImGuiWrapper.newLine()

        } else {

            child?.render()
        }
    }
}

/// ForEach node.
/// This will loop through some data and pass the result to some node.
/// - parameter data: Sequence of data
/// - parameter onLoop: Callback for loop execution
/// - returns: New node
public func ForEach<T:Sequence>(_ data: T,
                                onLoop: @escaping (T.Element) -> GuiNode?) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        data.forEach {

            onLoop($0)?.render()
        }
    }
}

/// Separator node.
/// - returns: New node
public func Separator() -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        ImGuiWrapper.separator()
    }
}

/// SameLine node.
/// This connect two nodes on the same line.
/// - parameter offsetX: Horizontal  offset
/// - parameter spacing: Horizontal  spacing
/// - returns: New node
public func SameLine(offsetX: GuiPoint = .zero,
                     spacing: Float = -1.0) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        ImGuiWrapper.sameLine(Float(offsetX.x), spacing: spacing)
    }
}

/// NewLine node.
/// - returns: New node
public func NewLine() -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        ImGuiWrapper.newLine()
    }
}

/// Spacing node.
/// - returns: New node
public func Spacing() -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        ImGuiWrapper.spacing()
    }
}

/// Indent node.
/// - parameter spacing: Horizontal spacing identation
/// - parameter child: List of nodes
/// - returns: New node
public func Indent(spacing: Float = 0,
                   @GuiBuilder child: () -> GuiView?) -> GuiNode {

    GuiNode(tag: #function, child: child()).onRender { child in

        ImGuiWrapper.indent(spacing)
        child?.render()
        ImGuiWrapper.unindent(spacing)
    }
}

/// ProgressBar node.
/// - parameter fraction: Progress value
/// - parameter size: Node size
/// - parameter overlay: Text overlay
/// - returns: New node
public func ProgressBar(_ fraction: Float,
                        size: GuiSize = GuiSize(width: -1, height: 0),
                        overlay: String? = nil) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        ImGuiWrapper.progressBar(fraction, size: size, overlay: overlay)
    }
}
