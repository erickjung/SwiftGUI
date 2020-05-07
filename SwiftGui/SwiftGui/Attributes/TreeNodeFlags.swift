//
//  TreeNodeFlags.swift
//  SwiftGui
//
//  Created by Erick Jung on 07/05/2020.
//  Copyright © 2020 Erick Jung. All rights reserved.
//

import SwiftGuiCore

public struct ImGuiTreeNodeFlags: OptionSet {

    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    public static let none                 = ImGuiTreeNodeFlags(rawValue: 0)
    public static let selected             = ImGuiTreeNodeFlags(rawValue: 1 << 0)   // Draw as selected
    public static let framed               = ImGuiTreeNodeFlags(rawValue: 1 << 1)   // Full colored frame (e.g. for CollapsingHeader)
    public static let allowItemOverlap     = ImGuiTreeNodeFlags(rawValue: 1 << 2)   // Hit testing to allow subsequent widgets to overlap this one
    public static let noTreePushOnOpen     = ImGuiTreeNodeFlags(rawValue: 1 << 3)   // Don't do a TreePush() when open (e.g. for CollapsingHeader) = no extra indent nor pushing on ID stack
    public static let noAutoOpenOnLog      = ImGuiTreeNodeFlags(rawValue: 1 << 4)   // Don't automatically and temporarily open node when Logging is active (by default logging will automatically open tree nodes)
    public static let defaultOpen          = ImGuiTreeNodeFlags(rawValue: 1 << 5)   // Default node to be open
    public static let openOnDoubleClick    = ImGuiTreeNodeFlags(rawValue: 1 << 6)   // Need double-click to open node
    public static let openOnArrow          = ImGuiTreeNodeFlags(rawValue: 1 << 7)   // Only open when clicking on the arrow part. If public static let OpenOnDoubleClick is also set, single-click arrow or double-click all box to open.
    public static let leaf                 = ImGuiTreeNodeFlags(rawValue: 1 << 8)   // No collapsing, no arrow (use as a convenience for leaf nodes).
    public static let bullet               = ImGuiTreeNodeFlags(rawValue: 1 << 9)   // Display a bullet instead of arrow
    public static let framePadding         = ImGuiTreeNodeFlags(rawValue: 1 << 10)  // Use FramePadding (even for an unframed text node) to vertically align text baseline to regular widget height. Equivalent to calling AlignTextToFramePadding().
    public static let spanAvailWidth       = ImGuiTreeNodeFlags(rawValue: 1 << 11)  // Extend hit box to the right-most edge, even if not framed. This is not the default in order to allow adding other items on the same line. In the future we may refactor the hit system to be front-to-back, allowing natural overlaps and then this can become the default.
    public static let spanFullWidth        = ImGuiTreeNodeFlags(rawValue: 1 << 12)  // Extend hit box to the left-most and right-most edges (bypass the indented area).
    public static let navLeftJumpsBackHere = ImGuiTreeNodeFlags(rawValue: 1 << 13)  // (WIP) Nav: left direction may move to this TreeNode() from any of its child (items submitted between TreeNode and TreePop)
//    public static let CollapsingHeader     = public static let Framed | public static let NoTreePushOnOpen | public static let NoAutoOpenOnLog
}
