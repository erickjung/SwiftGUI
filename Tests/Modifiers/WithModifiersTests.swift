//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Testing
@testable import SwiftGUI

@Suite("WithModifiers Tests")
struct WithModifiersTests {

    // Note: We can only test withModifiers() with empty modifiers in unit tests
    // because calling ImGui functions (push/pop) requires an initialized ImGui context.
    // Tests with actual modifiers would crash with signal 11.

    @Test("withModifiers calls body closure with empty modifiers")
    func withModifiersEmptyModifiersCallsBody() {
        var bodyCalled = false
        let modifiers = ViewModifiers()

        withModifiers(modifiers) {
            bodyCalled = true
        }

        #expect(bodyCalled)
    }

    @Test("withModifiers function exists and is callable")
    func withModifiersFunctionExists() {
        let modifiers = ViewModifiers()

        withModifiers(modifiers) {
            // Body is called
        }

        #expect(true)
    }

    @Test("ViewModifiers can be fully populated for withModifiers")
    func viewModifiersCanBePopulatedForWithModifiers() {
        var modifiers = ViewModifiers()
        modifiers.id = "test"
        modifiers.snapWidth = true
        modifiers.padding = .top
        modifiers.paddingValue = 10.0
        modifiers.fontIndex = 1
        modifiers.textColor = .red

        #expect(modifiers.id == "test")
        #expect(modifiers.snapWidth == true)
        #expect(modifiers.padding == .top)
        #expect(modifiers.paddingValue == 10.0)
        #expect(modifiers.fontIndex == 1)
        #expect(modifiers.textColor == .red)
    }
}
