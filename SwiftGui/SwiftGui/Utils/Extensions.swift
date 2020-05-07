//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import SwiftGuiCore

#if os(OSX)

import Foundation
import AppKit

public typealias GuiColor = NSColor
public typealias GuiPoint = CGPoint
public typealias GuiSize = CGSize
public typealias GuiImage = AnyObject

#else

import AVFoundation
import UIKit

public typealias GuiColor = UIColor
public typealias GuiPoint = CGPoint
public typealias GuiSize = CGSize
public typealias GuiImage = AnyObject

#endif

public extension String {

    func cStr() -> UnsafePointer<Int8>? {

        return NSString(string: self).utf8String
    }

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

    func convertToVec4() -> ImVec4 {

        guard let c = self.cgColor.components else { return ImVec4() }

        if c.count == 2 {

            return ImVec4(x: Float(c[0]), y: Float(c[0]), z: Float(c[0]), w: Float(c[1]))
        }

        return ImVec4(x: Float(c[0]), y: Float(c[1]), z: Float(c[2]), w: Float(c[3]))
    }

    func convertToFloats() -> [Float] {

        return self.cgColor.components!.map({ (v) -> Float in return Float(v) })
    }

    func tuple3() -> (Float, Float, Float) {

        guard let c = self.cgColor.components else { return (0, 0, 0) }

        return (Float(c[0]), Float(c[1]), Float(c[2]))
    }
}

public extension GuiPoint {

    func convertToVec2() -> ImVec2 {

        return ImVec2(x: Float(self.x), y: Float(self.y))
    }
}

public extension GuiSize {

    func convertToVec2() -> ImVec2 {

        return ImVec2(x: Float(self.width), y: Float(self.height))
    }
}
