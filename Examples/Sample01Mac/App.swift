//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import SwiftGUI

@main
struct Sample01App: GuiApp {
    var body: some Scene {
        WindowGroup("SwiftGUI Demo") {
            DemoView()
        }
        .theme(DarculaTheme())
        .fontGroup(DefaultFontGroup())
        .windowSize(width: 800, height: 800)
        .windowPosition(x: 100, y: 100)
        .minimumSize(width: 800, height: 800)
        .resizable(true)
        .preloadTextures(["swiftgui"])
    }
}
