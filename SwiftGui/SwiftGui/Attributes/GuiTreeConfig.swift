//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

//import SwiftGuiCore

/// OptionSet with properties for tree node configuration.
/// Represents: `ImGuiTreeNodeFlags`.
public struct GuiTreeConfig: OptionSet {

    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }

    public static let none                 = GuiTreeConfig(rawValue: 0)

    /// Draw as selected
    public static let selected             = GuiTreeConfig(rawValue: 1 << 0)

    /// Full colored frame (e.g. for CollapsingHeader)
    public static let framed               = GuiTreeConfig(rawValue: 1 << 1)

    /// Hit testing to allow subsequent widgets to overlap this one
    public static let allowItemOverlap     = GuiTreeConfig(rawValue: 1 << 2)

    /// Don't do a TreePush() when open (e.g. for CollapsingHeader) = no extra indent nor pushing on ID stack
    public static let noTreePushOnOpen     = GuiTreeConfig(rawValue: 1 << 3)

    /// Don't automatically and temporarily open node when Logging is active (by default logging will automatically open tree nodes)
    public static let noAutoOpenOnLog      = GuiTreeConfig(rawValue: 1 << 4)

    /// Default node to be open
    public static let defaultOpen          = GuiTreeConfig(rawValue: 1 << 5)

    /// Need double-click to open node
    public static let openOnDoubleClick    = GuiTreeConfig(rawValue: 1 << 6)

    /// Only open when clicking on the arrow part. If public static let OpenOnDoubleClick is also set, single-click arrow or double-click all box to open.
    public static let openOnArrow          = GuiTreeConfig(rawValue: 1 << 7)

    /// No collapsing, no arrow (use as a convenience for leaf nodes).
    public static let leaf                 = GuiTreeConfig(rawValue: 1 << 8)

    /// Display a bullet instead of arrow
    public static let bullet               = GuiTreeConfig(rawValue: 1 << 9)

    /// Use FramePadding (even for an unframed text node) to vertically align text baseline to regular widget height.
    public static let framePadding         = GuiTreeConfig(rawValue: 1 << 10)

    /// Extend hit box to the right-most edge, even if not framed. This is not the default in order to allow adding other items on the same line.
    /// In the future we may refactor the hit system to be front-to-back, allowing natural overlaps and then this can become the default.
    public static let spanAvailWidth       = GuiTreeConfig(rawValue: 1 << 11)

    /// Extend hit box to the left-most and right-most edges (bypass the indented area).
    public static let spanFullWidth        = GuiTreeConfig(rawValue: 1 << 12)

    /// (WIP) Nav: left direction may move to this TreeNode() from any of its child (items submitted between TreeNode and TreePop)
    public static let navLeftJumpsBackHere = GuiTreeConfig(rawValue: 1 << 13)

    public static let collapsingHeader     = [framed, noTreePushOnOpen, noAutoOpenOnLog]
}
