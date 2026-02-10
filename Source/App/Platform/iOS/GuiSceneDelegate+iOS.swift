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

/// iOS-specific scene delegate that manages the window scene lifecycle.
///
/// This type is created automatically by the app layer and is not part
/// of the public API.
internal class GuiSceneDelegateiOS: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }

        // Get scene from global state
        guard let guiScene = GuiAppState.shared.scene else { return }
        let config = guiScene.configuration

        // Create window
        window = UIWindow(windowScene: windowScene)

        // Create view controller
        let viewController = GuiViewControllerIOS(scene: guiScene)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()

        // Apply configuration
        if let theme = config.theme {
            theme.apply()
        }
        if let fontGroup = config.fontGroup {
            fontGroup.load()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Clean up resources
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Handle scene becoming active
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Handle scene resigning active
    }
}

#endif
