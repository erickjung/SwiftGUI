//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A part of an app's user interface with a lifecycle managed by the system.
///
/// Scenes contain the windows and views that make up your app's user interface.
/// The most common scene type is `WindowGroup`, which creates a standard window.
public protocol Scene {
    /// The content of the scene.
    var content: any GuiView { get }

    /// Configuration for the scene.
    var configuration: SceneConfiguration { get }
}

// MARK: - Scene Builder

/// A result builder for composing scenes.
///
/// Use `@SceneBuilder` to compose multiple scenes in your app's body:
///
/// ```swift
/// @main
/// struct MyApp: GuiApp {
///     var body: some Scene {
///         WindowGroup("Main") { MainView() }
///         WindowGroup("Inspector") { InspectorView() }
///     }
/// }
/// ```
@resultBuilder
public struct SceneBuilder {
    /// Builds a single scene.
    public static func buildBlock<S: Scene>(_ scene: S) -> S {
        scene
    }

    /// Builds multiple scenes.
    public static func buildBlock<S1: Scene, S2: Scene>(_ s1: S1, _ s2: S2) -> MultiScene {
        MultiScene(scenes: [AnyScene(s1), AnyScene(s2)])
    }

    /// Builds multiple scenes (3 scenes).
    public static func buildBlock<S1: Scene, S2: Scene, S3: Scene>(
        _ s1: S1, _ s2: S2, _ s3: S3
    ) -> MultiScene {
        MultiScene(scenes: [AnyScene(s1), AnyScene(s2), AnyScene(s3)])
    }

    /// Builds multiple scenes (4 scenes).
    public static func buildBlock<S1: Scene, S2: Scene, S3: Scene, S4: Scene>(
        _ s1: S1, _ s2: S2, _ s3: S3, _ s4: S4
    ) -> MultiScene {
        MultiScene(scenes: [AnyScene(s1), AnyScene(s2), AnyScene(s3), AnyScene(s4)])
    }
}

// MARK: - Multi Scene (for future multi-window support)

/// A scene that contains multiple child scenes.
///
/// This type is created automatically by the `@SceneBuilder` when you
/// define multiple scenes in your app's body.
public struct MultiScene: Scene {
    let scenes: [AnyScene]

    public var content: any GuiView {
        EmptyView()
    }

    public var configuration: SceneConfiguration {
        // Use first scene's configuration for now
        scenes.first?.configuration ?? SceneConfiguration(title: "App")
    }
}

/// Type-erased scene wrapper.
internal struct AnyScene {
    let configuration: SceneConfiguration
    private let _render: () -> Void

    init<S: Scene>(_ scene: S) {
        self.configuration = scene.configuration
        self._render = {
            scene.content.render()
        }
    }

    func render() {
        _render()
    }
}

/// An empty view used as a placeholder.
public struct EmptyView: GuiView {
    public init() {}

    public func render() {
        // No-op
    }
}
