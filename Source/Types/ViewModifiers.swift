//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// Container for all view modifier values.
/// Used by the new struct-based view system with copy-on-modify pattern.
public struct ViewModifiers {
    public var id: String?
    public var snapWidth: Bool?
    public var padding: GuiEdge?
    public var paddingValue: Double?
    public var fontIndex: Int?
    public var textColor: GuiColor?
    public var onHover: (() -> (any GuiView)?)?

    public init() {}
}
