//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import SwiftGUI

@main
struct TodoApp: GuiApp {
    var body: some Scene {
        WindowGroup("TODO") {
            TodoView()
        }
        .theme(DarculaTheme())
        .fontGroup(DefaultFontGroup())
        .windowSize(width: 800, height: 600)
        .windowPosition(x: 100, y: 100)
        .minimumSize(width: 800, height: 600)
        .resizable(true)
    }
}
