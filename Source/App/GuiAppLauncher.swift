//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

#if os(macOS)
import AppKit
#else
import UIKit
#endif

/// Internal coordinator that launches the appropriate platform-specific app.
///
/// This type is not part of the public API.
internal class GuiAppLauncher {
    let scene: any Scene

    init(scene: any Scene) {
        self.scene = scene
    }

    func launch() {
        #if os(macOS)
        launchMacOS()
        #else
        launchiOS()
        #endif
    }

    #if os(macOS)
    private func launchMacOS() {
        let app = NSApplication.shared
        let delegate = GuiAppDelegateMacOS(scene: scene)
        app.delegate = delegate
        app.run()
    }
    #endif

    #if os(iOS)
    private func launchiOS() {
        // Store scene in a global for iOS app delegate to access
        GuiAppState.shared.scene = AnyScene(scene)

        UIApplicationMain(
            CommandLine.argc,
            CommandLine.unsafeArgv,
            nil,
            NSStringFromClass(GuiAppDelegateiOS.self)
        )
    }
    #endif
}

#if os(iOS)
/// Global state for iOS since we can't pass scene to UIApplicationMain
internal class GuiAppState {
    static let shared = GuiAppState()
    var scene: AnyScene?
    private init() {}
}
#endif
