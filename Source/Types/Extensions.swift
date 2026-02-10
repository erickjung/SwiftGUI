//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

#if os(OSX)

import Foundation
import AppKit

public typealias GuiColor = NSColor

#else

import AVFoundation
import UIKit

public typealias GuiColor = UIColor

#endif

public typealias GuiPoint = CGPoint
public typealias GuiSize = CGSize

public extension String {

    func cChars(with capacity: Int) -> [Int8] {

        return [Int8](unsafeUninitializedCapacity: capacity) { buffer, initializedCount in
            let chars = self.utf8CString

            // Initialize the string content
            if chars.count < capacity {
                _ = buffer.initialize(from: chars)
                // Fill the rest with zeros so ImGui has room to write
                let remaining = capacity - chars.count
                if remaining > 0, let base = buffer.baseAddress {
                    base.advanced(by: chars.count).initialize(repeating: 0, count: remaining)
                }
            } else {
                var sub = chars[..<(capacity - 1)]
                _ = buffer.initialize(from: sub)
                buffer[capacity - 1] = 0
            }

            // IMPORTANT: Set initializedCount to full capacity so Swift knows the entire buffer is valid
            initializedCount = capacity
        }
    }
}

public extension GuiColor {

    convenience init(r: Float, g: Float, b: Float, a: Float) {
        self.init(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(a))
    }

    func convertToFloats() -> [Float] {

        return self.cgColor.components!.map({ (v) -> Float in return Float(v) })
    }
}
