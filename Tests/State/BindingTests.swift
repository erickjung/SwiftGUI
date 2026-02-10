//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Testing
@testable import SwiftGUI

@Suite("Binding Tests")
struct BindingTests {

    // MARK: - Basic Get/Set Tests

    @Test("Binding get returns current source value")
    func bindingGet() {
        var sourceValue = 42
        let binding = Binding(
            get: { sourceValue },
            set: { sourceValue = $0 }
        )

        #expect(binding.get() == 42)
    }

    @Test("Binding set updates source variable")
    func bindingSet() {
        var sourceValue = 42
        let binding = Binding(
            get: { sourceValue },
            set: { sourceValue = $0 }
        )

        binding.set(100)

        #expect(sourceValue == 100)
    }

    @Test("Binding supports multiple writes")
    func bindingSetMultipleTimes() {
        var sourceValue = 0
        let binding = Binding(
            get: { sourceValue },
            set: { sourceValue = $0 }
        )

        binding.set(10)
        #expect(sourceValue == 10)

        binding.set(20)
        #expect(sourceValue == 20)

        binding.set(30)
        #expect(sourceValue == 30)
    }

    // MARK: - WrappedValue Tests

    @Test("wrappedValue getter works")
    func bindingWrappedValueGet() {
        var sourceValue = 123
        let binding = Binding(
            get: { sourceValue },
            set: { sourceValue = $0 }
        )

        #expect(binding.wrappedValue == 123)
    }

    @Test("wrappedValue setter updates source")
    func bindingWrappedValueSet() {
        var sourceValue = 123
        let binding = Binding(
            get: { sourceValue },
            set: { sourceValue = $0 }
        )

        binding.wrappedValue = 456

        #expect(sourceValue == 456)
        #expect(binding.wrappedValue == 456)
    }

    @Test("wrappedValue setter is nonmutating")
    func bindingWrappedValueNonmutating() {
        var sourceValue = 10
        let binding = Binding(
            get: { sourceValue },
            set: { sourceValue = $0 }
        )

        binding.wrappedValue = 20

        #expect(sourceValue == 20)
    }

    // MARK: - Constant Binding Tests

    @Test("Constant binding returns constant value")
    func bindingConstant() {
        let binding = Binding.constant(42)

        #expect(binding.wrappedValue == 42)
        #expect(binding.get() == 42)
    }

    @Test("Constant binding ignores set calls")
    func bindingConstantIgnoresSet() {
        let binding = Binding.constant(42)

        binding.set(100)

        #expect(binding.wrappedValue == 42)
    }

    @Test("Constant binding ignores all writes")
    func bindingConstantMultipleWrites() {
        let binding = Binding.constant(99)

        binding.set(1)
        binding.set(2)
        binding.wrappedValue = 3

        #expect(binding.wrappedValue == 99)
    }

    // MARK: - Type Tests

    @Test("Binding works with Bool")
    func bindingWithBool() {
        var flag = false
        let binding = Binding(get: { flag }, set: { flag = $0 })

        #expect(!binding.wrappedValue)

        binding.wrappedValue = true

        #expect(binding.wrappedValue)
        #expect(flag)
    }

    @Test("Binding works with String")
    func bindingWithString() {
        var text = "Hello"
        let binding = Binding(get: { text }, set: { text = $0 })

        #expect(binding.wrappedValue == "Hello")

        binding.wrappedValue = "World"

        #expect(binding.wrappedValue == "World")
        #expect(text == "World")
    }

    @Test("Binding works with Optional")
    func bindingWithOptional() {
        var value: Int? = nil
        let binding = Binding(get: { value }, set: { value = $0 })

        #expect(binding.wrappedValue == nil)

        binding.wrappedValue = 42

        #expect(binding.wrappedValue == 42)
        #expect(value == 42)

        binding.wrappedValue = nil

        #expect(binding.wrappedValue == nil)
        #expect(value == nil)
    }

    // MARK: - Two-Way Binding Tests

    @Test("Binding reflects external changes to source")
    func bindingTwoWayFlow() {
        var sourceValue = 5
        let binding = Binding(get: { sourceValue }, set: { sourceValue = $0 })

        #expect(binding.wrappedValue == 5)

        binding.wrappedValue = 10
        #expect(sourceValue == 10)

        sourceValue = 15
        #expect(binding.wrappedValue == 15)
    }
}
