//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// Configuration values for a scene.
///
/// Scene configuration includes window properties, theming, fonts, and other
/// app-level settings that are applied when the scene is created.
public struct SceneConfiguration {
    /// The title of the window.
    public var title: String

    /// The theme to apply to the scene.
    public var theme: Theme?

    /// The font group to load for the scene.
    public var fontGroup: FontGroup?

    /// The initial size of the window.
    public var windowSize: GuiSize?

    /// The initial position of the window.
    public var windowPosition: GuiPoint?

    /// Whether the window is resizable.
    public var resizable: Bool = true

    /// The minimum size of the window.
    public var minimumSize: GuiSize?

    /// Optional setup handler called after renderer initialization.
    public var setupHandler: ((GuiRenderer) -> Void)?

    /// Texture names to preload during setup.
    public var preloadTextures: [String]?

    /// Creates a scene configuration with the specified title.
    public init(title: String) {
        self.title = title
    }
}
