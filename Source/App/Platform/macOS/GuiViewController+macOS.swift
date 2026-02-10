//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

#if os(macOS)

import Foundation
import AppKit
import MetalKit

/// macOS-specific view controller that manages MTKView and event handling.
///
/// This type encapsulates all the boilerplate required for macOS apps:
/// - MTKView setup
/// - GuiRenderer creation and configuration
/// - Tracking area setup for mouse events
/// - Global event monitoring for keyboard and scroll
/// - Event handler methods (5 mouse events)
///
/// This type is created automatically by the app layer and is not part
/// of the public API.
internal class GuiViewControllerMacOS: NSViewController, GuiRendererDelegate {
    let scene: any Scene
    var renderer: GuiRenderer?

    init(scene: any Scene) {
        self.scene = scene
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) not supported for GuiViewController")
    }

    override func loadView() {
        // Create MTKView
        let mtkView = MTKView()
        mtkView.device = MTLCreateSystemDefaultDevice()
        self.view = mtkView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let mtkView = view as? MTKView else { return }

        // Setup renderer
        renderer = GuiRenderer(view: mtkView)
        renderer?.delegate = self
        mtkView.delegate = renderer

        // Setup tracking area for mouse events
        let trackingArea = NSTrackingArea(
            rect: .zero,
            options: [.mouseMoved, .inVisibleRect, .activeAlways],
            owner: self,
            userInfo: nil
        )
        view.addTrackingArea(trackingArea)

        // Setup global event monitor for keyboard and scroll events
        NSEvent.addLocalMonitorForEvents(matching: [.keyDown, .keyUp, .flagsChanged, .scrollWheel]) { [weak self] event in
            guard let self = self, let renderer = self.renderer else { return event }
            return renderer.handle(event, view: self.view) ? nil : event
        }

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

    // MARK: - Event Handlers (All automatic, no user code needed)

    override func mouseMoved(with event: NSEvent) {
        renderer?.handle(event, view: view)
    }

    override func mouseDown(with event: NSEvent) {
        renderer?.handle(event, view: view)
    }

    override func mouseUp(with event: NSEvent) {
        renderer?.handle(event, view: view)
    }

    override func mouseDragged(with event: NSEvent) {
        renderer?.handle(event, view: view)
    }

    override func scrollWheel(with event: NSEvent) {
        renderer?.handle(event, view: view)
    }

    // MARK: - GuiRendererDelegate

    func setup() {
        // Theme and fonts are already applied in app delegate
        // This is called by renderer.initializePlatform()
    }

    func draw() {
        scene.content.render()
    }
}

#endif
