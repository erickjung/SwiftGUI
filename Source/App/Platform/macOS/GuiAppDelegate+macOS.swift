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

/// macOS-specific app delegate that manages the application lifecycle.
///
/// This type is created automatically by the app layer and is not part
/// of the public API.
internal class GuiAppDelegateMacOS: NSObject, NSApplicationDelegate {
    let scene: any Scene
    var window: NSWindow?
    var viewController: GuiViewControllerMacOS?

    init(scene: any Scene) {
        self.scene = scene
        super.init()
    }

    func applicationDidFinishLaunching(_ notification: Notification) {
        // Setup application menu for CMD+Q support
        setupApplicationMenu()

        // Extract configuration
        let config = scene.configuration

        // Create window
        let windowSize = config.windowSize ?? CGSize(width: 800, height: 600)
        let windowPosition = config.windowPosition ?? CGPoint(x: 100, y: 100)

        let contentRect = NSRect(
            origin: windowPosition,
            size: windowSize
        )

        var styleMask: NSWindow.StyleMask = [.titled, .closable, .miniaturizable]
        if config.resizable {
            styleMask.insert(.resizable)
        }

        window = NSWindow(
            contentRect: contentRect,
            styleMask: styleMask,
            backing: .buffered,
            defer: false
        )

        window?.title = config.title

        if let minSize = config.minimumSize {
            window?.minSize = minSize
        }

        // Create view controller
        viewController = GuiViewControllerMacOS(scene: scene)
        window?.contentViewController = viewController

        // Show window
        window?.makeKeyAndOrderFront(nil)

        // Apply initial configuration
        if let theme = config.theme {
            theme.apply()
        }
        if let fontGroup = config.fontGroup {
            fontGroup.load()
        }
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

    private func setupApplicationMenu() {
        let mainMenu = NSMenu()

        // Application menu
        let appMenuItem = NSMenuItem()
        mainMenu.addItem(appMenuItem)

        let appMenu = NSMenu()
        appMenuItem.submenu = appMenu

        // Quit menu item with CMD+Q
        let quitMenuItem = NSMenuItem(
            title: "Quit \(ProcessInfo.processInfo.processName)",
            action: #selector(NSApplication.terminate(_:)),
            keyEquivalent: "q"
        )
        appMenu.addItem(quitMenuItem)

        NSApplication.shared.mainMenu = mainMenu
    }
}

#endif
