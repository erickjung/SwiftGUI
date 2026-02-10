//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Testing
@testable import SwiftGUI

@Suite("Build Smoke Tests")
struct BuildSmokeTest {

    @Test("SwiftGUI module imports successfully")
    func moduleImports() {
        // If we can compile this test, the module imported successfully
        #expect(true)
    }

    @Test("ImGuiWrapper is accessible from Swift via the bridge")
    func imguiWrapperAccessible() {
        let wrapperClass: AnyClass? = NSClassFromString("ImGuiWrapper")
        #expect(wrapperClass != nil)
    }
}
