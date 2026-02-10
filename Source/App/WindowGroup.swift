//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A scene that creates a standard window.
///
/// Use a `WindowGroup` to define the main window of your app:
///
/// ```swift
/// @main
/// struct MyApp: GuiApp {
///     var body: some Scene {
///         WindowGroup("My App") {
///             ContentView()
///         }
///         .theme(DarculaTheme())
///         .windowSize(width: 800, height: 600)
///     }
/// }
/// ```
public struct WindowGroup: Scene {
    public let content: any GuiView
    public var configuration: SceneConfiguration

    /// Creates a window group with the specified title and content.
    ///
    /// - Parameters:
    ///   - title: The title of the window.
    ///   - content: A closure that returns the content of the window.
    public init(_ title: String, content: @escaping () -> any GuiView) {
        self.content = content()
        self.configuration = SceneConfiguration(title: title)
    }
}

// MARK: - Configuration Modifiers

extension WindowGroup {
    /// Applies a theme to the window.
    ///
    /// - Parameter theme: The theme to apply.
    /// - Returns: A window group with the theme applied.
    public func theme(_ theme: Theme) -> WindowGroup {
        var copy = self
        copy.configuration.theme = theme
        return copy
    }

    /// Sets the font group for the window.
    ///
    /// - Parameter fontGroup: The font group to load.
    /// - Returns: A window group with the font group configured.
    public func fontGroup(_ fontGroup: FontGroup) -> WindowGroup {
        var copy = self
        copy.configuration.fontGroup = fontGroup
        return copy
    }

    /// Sets the initial size of the window.
    ///
    /// - Parameters:
    ///   - width: The width of the window.
    ///   - height: The height of the window.
    /// - Returns: A window group with the specified size.
    public func windowSize(width: CGFloat, height: CGFloat) -> WindowGroup {
        var copy = self
        copy.configuration.windowSize = CGSize(width: width, height: height)
        return copy
    }

    /// Sets the initial position of the window.
    ///
    /// - Parameters:
    ///   - x: The x-coordinate of the window's top-left corner.
    ///   - y: The y-coordinate of the window's top-left corner.
    /// - Returns: A window group with the specified position.
    public func windowPosition(x: CGFloat, y: CGFloat) -> WindowGroup {
        var copy = self
        copy.configuration.windowPosition = CGPoint(x: x, y: y)
        return copy
    }

    /// Sets whether the window is resizable.
    ///
    /// - Parameter resizable: Whether the window can be resized.
    /// - Returns: A window group with the resizable property set.
    public func resizable(_ resizable: Bool) -> WindowGroup {
        var copy = self
        copy.configuration.resizable = resizable
        return copy
    }

    /// Sets the minimum size of the window.
    ///
    /// - Parameters:
    ///   - width: The minimum width.
    ///   - height: The minimum height.
    /// - Returns: A window group with the minimum size set.
    public func minimumSize(width: CGFloat, height: CGFloat) -> WindowGroup {
        var copy = self
        copy.configuration.minimumSize = CGSize(width: width, height: height)
        return copy
    }

    /// Provides a setup handler for custom initialization.
    ///
    /// The handler is called after the renderer is initialized, allowing
    /// you to perform custom setup like loading textures.
    ///
    /// - Parameter handler: A closure that receives the GuiRenderer.
    /// - Returns: A window group with the setup handler configured.
    public func onSetup(_ handler: @escaping (GuiRenderer) -> Void) -> WindowGroup {
        var copy = self
        copy.configuration.setupHandler = handler
        return copy
    }

    /// Preloads textures by name during app setup.
    ///
    /// - Parameter names: The names of textures to preload.
    /// - Returns: A window group configured to preload the specified textures.
    public func preloadTextures(_ names: [String]) -> WindowGroup {
        var copy = self
        copy.configuration.preloadTextures = names
        return copy
    }
}
