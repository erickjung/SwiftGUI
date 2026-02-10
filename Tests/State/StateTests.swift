//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Testing
@testable import SwiftGUI

@Suite("State Tests")
struct StateTests {

    // MARK: - Initial Value Tests

    @Test("State stores initial Int value")
    func stateInitialValue() {
        let state = State(wrappedValue: 5)

        #expect(state.wrappedValue == 5)
    }

    @Test("State works with String")
    func stateInitialValueString() {
        let state = State(wrappedValue: "Hello")

        #expect(state.wrappedValue == "Hello")
    }

    @Test("State works with Bool")
    func stateInitialValueBool() {
        let state = State(wrappedValue: true)

        #expect(state.wrappedValue)
    }

    @Test("State works with Optional")
    func stateInitialValueOptional() {
        let state = State<Int?>(wrappedValue: nil)

        #expect(state.wrappedValue == nil)
    }

    // MARK: - Mutation Tests

    @Test("State value is mutable")
    func stateCanBeMutated() {
        let state = State(wrappedValue: 10)

        state.wrappedValue = 20

        #expect(state.wrappedValue == 20)
    }

    @Test("State supports multiple mutations")
    func stateMultipleMutations() {
        let state = State(wrappedValue: 0)

        state.wrappedValue = 1
        #expect(state.wrappedValue == 1)

        state.wrappedValue = 2
        #expect(state.wrappedValue == 2)

        state.wrappedValue = 3
        #expect(state.wrappedValue == 3)
    }

    // MARK: - ProjectedValue Tests

    @Test("projectedValue returns Binding")
    func stateProjectedValueIsBinding() {
        let state = State(wrappedValue: 42)
        let binding = state.projectedValue

        #expect(binding.wrappedValue == 42)
    }

    @Test("Binding reads current State value")
    func stateBindingReadsCurrentValue() {
        let state = State(wrappedValue: 10)
        let binding = state.projectedValue

        #expect(binding.get() == 10)

        state.wrappedValue = 20

        #expect(binding.get() == 20)
    }

    @Test("Binding set updates State wrappedValue")
    func stateBindingWritesBack() {
        let state = State(wrappedValue: 5)
        let binding = state.projectedValue

        binding.set(10)

        #expect(state.wrappedValue == 10)
    }

    @Test("Binding wrappedValue setter updates State")
    func stateBindingWritesBackViaWrappedValue() {
        let state = State(wrappedValue: 100)
        let binding = state.projectedValue

        binding.wrappedValue = 200

        #expect(state.wrappedValue == 200)
    }

    @Test("Binding reflects State changes in both directions")
    func stateBindingTwoWay() {
        let state = State(wrappedValue: 1)
        let binding = state.projectedValue

        binding.wrappedValue = 2
        #expect(state.wrappedValue == 2)

        state.wrappedValue = 3
        #expect(binding.wrappedValue == 3)
    }

    // MARK: - Reference Type Tests

    @Test("State is a reference type")
    func stateIsReferenceType() {
        let state1 = State(wrappedValue: 10)
        let state2 = state1

        state2.wrappedValue = 20

        #expect(state1.wrappedValue == 20)
    }

    @Test("State reference persists across function calls")
    func statePersistsAcrossAssignments() {
        let state = State(wrappedValue: 5)

        func modifyState(_ s: State<Int>) {
            s.wrappedValue = 10
        }

        modifyState(state)

        #expect(state.wrappedValue == 10)
    }

    // MARK: - Integration Tests

    @Test("Multiple bindings to same State stay in sync")
    func stateMultipleBindings() {
        let state = State(wrappedValue: 0)
        let binding1 = state.projectedValue
        let binding2 = state.projectedValue

        binding1.wrappedValue = 10
        #expect(binding2.wrappedValue == 10)

        binding2.wrappedValue = 20
        #expect(binding1.wrappedValue == 20)
        #expect(state.wrappedValue == 20)
    }

    @Test("Bool State supports toggle")
    func stateWithBoolToggle() {
        let state = State(wrappedValue: false)
        let binding = state.projectedValue

        binding.wrappedValue.toggle()

        #expect(state.wrappedValue)

        binding.wrappedValue.toggle()

        #expect(!state.wrappedValue)
    }

    @Test("String State supports mutation")
    func stateWithStringAppend() {
        let state = State(wrappedValue: "Hello")
        let binding = state.projectedValue

        binding.wrappedValue += " World"

        #expect(state.wrappedValue == "Hello World")
    }

    // MARK: - Property Wrapper Syntax Tests

    @Test("Property wrapper syntax works correctly")
    func statePropertyWrapperSyntax() {
        class TestController {
            @State var counter = 0
            @State var isEnabled = true
            @State var text = "Test"
        }

        let controller = TestController()

        #expect(controller.counter == 0)
        #expect(controller.isEnabled)
        #expect(controller.text == "Test")

        controller.counter = 10
        controller.isEnabled = false
        controller.text = "Updated"

        #expect(controller.counter == 10)
        #expect(!controller.isEnabled)
        #expect(controller.text == "Updated")
    }

    @Test("$ syntax accesses projectedValue")
    func stateProjectedValueInPropertyWrapper() {
        class TestController {
            @State var value = 42
        }

        let controller = TestController()
        let binding = controller.$value

        #expect(binding.wrappedValue == 42)

        binding.wrappedValue = 100

        #expect(controller.value == 100)
    }
}
