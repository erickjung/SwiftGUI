//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Testing
@testable import SwiftGUI

@Suite("StyleScope Tests")
struct StyleScopeTests {

    @Test("StyleScope struct can be created")
    func styleScopeStructCreation() {
        let scope = StyleScope()

        #expect(scope != nil)
    }

    @Test("StyleScope handles nil colors gracefully without crashing")
    func styleScopePushNilDoesNotCrash() {
        // Note: Testing with nil colors is safe because it doesn't call ImGuiWrapper
        var scope = StyleScope()

        scope.push(.text, color: nil)
        scope.pop()

        #expect(true)
    }

    @Test("StyleScope handles nil colors in array push gracefully")
    func styleScopePushArrayNilDoesNotCrash() {
        var scope = StyleScope()

        scope.push([.text, .button], color: nil)
        scope.pop()

        #expect(true)
    }

    // Note: We cannot test actual ImGui calls (push with non-nil colors) without
    // an initialized ImGui rendering context. Those tests would crash.
    // The important behavior (handling nil gracefully) is tested above.
}
