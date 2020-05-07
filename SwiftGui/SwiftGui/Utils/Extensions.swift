//
//  Extensions.swift
//  SwiftGui
//
//  Created by Erick Jung on 03/11/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import SwiftGuiCore

#if os(OSX)

import Foundation
import AppKit
    
public typealias SGColor = NSColor
public typealias SGPoint = CGPoint
public typealias SGSize = CGSize
public typealias SGImage = AnyObject

#else
    
import AVFoundation
import UIKit

public typealias SGColor = UIColor
public typealias SGPoint = CGPoint
public typealias SGSize = CGSize
public typealias SGImage = AnyObject
    
#endif

public extension String {
    
    func cStr() -> UnsafePointer<Int8>? {
        
        return NSString(string: self).utf8String
    }
    
    func cChars(with capacity: Int) -> Array<Int8> {
        
        return Array<Int8>(unsafeUninitializedCapacity: capacity) { buffer, initializedCount in
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

public extension SGColor {
    
    convenience init(r: Float, g: Float , b: Float , a: Float) {
        self.init(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(a))
    }
    
    func convertToVec4() -> ImVec4 {

        if let c = self.cgColor.components {

            if c.count == 2 {
            
                return ImVec4(x: Float(c[0]), y: Float(c[0]), z: Float(c[0]), w: Float(c[1]))
            }
            
            return ImVec4(x: Float(c[0]), y: Float(c[1]), z: Float(c[2]), w: Float(c[3]))
        }

        return ImVec4()
    }

    func convertToFloats() -> [Float] {

        return self.cgColor.components!.map({ (v) -> Float in return Float(v) })
    }

    func tuple3() -> (Float, Float, Float) {

        if let c = self.cgColor.components {

            return (Float(c[0]), Float(c[1]), Float(c[2]))
        }

        return (0, 0, 0)
    }
}

public extension SGPoint {
    
    func convertToVec2() -> ImVec2 {

        return ImVec2(x: Float(self.x), y: Float(self.y))
    }
}

public extension SGSize {
    
    func convertToVec2() -> ImVec2 {
        
        return ImVec2(x: Float(self.width), y: Float(self.height))
    }
}
