//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A property wrapper type that can read and write a value managed by SwiftGUI.
///
/// Use `@State` for simple properties that are owned by a single view.
/// SwiftGUI manages the storage for properties you declare as state.
/// When the state value changes, the view invalidates its appearance and
/// recomputes the body.
///
/// Note: `@State` is a class (reference type) because it lives at the controller
/// level and persists across frame rebuilds. The value itself is stored in the
/// State instance, not in the view struct.
@propertyWrapper
public class State<Value> {
    /// The underlying value.
    public var wrappedValue: Value

    /// A binding to the state value.
    ///
    /// Use the projected value to pass a binding to a child view.
    /// For example, if you have `@State var isOn: Bool`, you can pass
    /// `$isOn` (a `Binding<Bool>`) to a child view that needs to modify the value.
    public var projectedValue: Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { self.wrappedValue = $0 }
        )
    }

    /// Creates a state property with an initial value.
    ///
    /// - Parameter wrappedValue: The initial value of the state property.
    public init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
}
