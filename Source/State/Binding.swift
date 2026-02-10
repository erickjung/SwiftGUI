//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A property wrapper type that provides two-way binding to a value.
///
/// Use `Binding` to create a connection between a property that stores data
/// and a view that displays and changes that data. A binding connects a property
/// to a source of truth stored elsewhere, instead of storing data directly.
public struct Binding<Value> {
    /// Closure to read the current value
    public let get: () -> Value

    /// Closure to write a new value
    public let set: (Value) -> Void

    /// The underlying value referenced by the binding.
    ///
    /// Reading this property calls the `get` closure.
    /// Writing this property calls the `set` closure.
    public var wrappedValue: Value {
        get { get() }
        nonmutating set { set(newValue) }
    }

    /// Creates a binding with closures that read and write the binding value.
    ///
    /// - Parameters:
    ///   - get: A closure that retrieves the binding value.
    ///   - set: A closure that sets the binding value.
    public init(get: @escaping () -> Value, set: @escaping (Value) -> Void) {
        self.get = get
        self.set = set
    }

    /// Creates a binding that ignores writes and always returns the provided value.
    ///
    /// Use this method to create a binding to a constant value, which is useful
    /// for testing or for views that don't need to modify the value.
    ///
    /// - Parameter value: The constant value for the binding.
    /// - Returns: A binding that always returns the given value.
    public static func constant(_ value: Value) -> Binding<Value> {
        Binding(get: { value }, set: { _ in })
    }
}
