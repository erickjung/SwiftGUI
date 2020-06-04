//
// Copyright (c) 2020, Erick Jung.
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
public typealias GuiImage = AnyObject

public extension String {

    func cChars(with capacity: Int) -> [Int8] {

        return [Int8](unsafeUninitializedCapacity: capacity) { buffer, initializedCount in
            let chars = self.utf8CString

            if chars.count < capacity {
                _ = buffer.initialize(from: chars)
                initializedCount = chars.count

            } else {

                var sub = chars[..<(capacity)]
                sub[sub.count - 1] = 0
                _ = buffer.initialize(from: sub)
                initializedCount = sub.count
            }
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
