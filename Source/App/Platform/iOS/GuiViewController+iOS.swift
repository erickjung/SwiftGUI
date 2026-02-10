//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

#if os(iOS)

import Foundation
import UIKit
import MetalKit

/// iOS-specific view controller that manages MTKView and touch event handling.
///
/// This type encapsulates all the boilerplate required for iOS apps:
/// - MTKView setup
/// - GuiRenderer creation and configuration
/// - Touch event handlers (4 touch phases)
///
/// This type is created automatically by the app layer and is not part
/// of the public API.
internal class GuiViewControllerIOS: UIViewController, GuiRendererDelegate {
    let scene: AnyScene
    var renderer: GuiRenderer?
    let mtkView = MTKView()

    init(scene: AnyScene) {
        self.scene = scene
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) not supported for GuiViewController")
    }

    override func loadView() {
        view = mtkView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let mtkView = view as? MTKView else { return }

        // Setup renderer
        mtkView.device = MTLCreateSystemDefaultDevice()
        renderer = GuiRenderer(view: mtkView)
        renderer?.delegate = self
        mtkView.delegate = renderer

        // Initialize platform
        renderer?.initializePlatform()

        // Call custom setup handler if provided
        if let setupHandler = scene.configuration.setupHandler,
           let renderer = renderer {
            setupHandler(renderer)
        }

        // Preload textures if specified
        if let textureNames = scene.configuration.preloadTextures,
           let renderer = renderer {
            for name in textureNames {
                _ = renderer.loadTexture(withName: name)
            }
        }
    }

    // MARK: - Touch Event Handlers (All automatic, no user code needed)

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        renderer?.handle(event, view: view)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        renderer?.handle(event, view: view)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        renderer?.handle(event, view: view)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        renderer?.handle(event, view: view)
    }

    // MARK: - GuiRendererDelegate

    func setup() {
        // Theme and fonts are already applied in scene delegate
        // This is called by renderer.initializePlatform()
    }

    func draw() {
        scene.render()
    }
}

#endif
