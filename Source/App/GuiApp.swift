//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A type that represents the structure and behavior of a SwiftGUI app.
///
/// Create a structure that conforms to `GuiApp` and implement the required
/// `body` property to define your app's scenes. Use the `@main` attribute
/// to designate the app's entry point:
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
public protocol GuiApp {
    /// The type of scene representing the content of the app.
    associatedtype Body: Scene

    /// The content and behavior of the app.
    @SceneBuilder var body: Body { get }

    /// Creates an instance of the app.
    init()
}

extension GuiApp {
    /// The entry point for the app.
    ///
    /// This is called automatically when using the `@main` attribute.
    public static func main() {
        let app = Self()
        let launcher = GuiAppLauncher(scene: app.body)
        launcher.launch()
    }
}
