//
//  DefaultFont.swift
//  SwiftGui
//
//  Created by Erick Jung on 13/11/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation

public class DefaultFont: Font {
    
    public enum Types {
        
        public static let FiraCode_14 = 0 // default
        public static let FiraCode_18 = 1
        public static let FiraCode_22 = 2

        public static let DroidSans_14 = 3
        public static let DroidSans_18 = 4
        public static let DroidSans_22 = 5
    }
    
    public var fonts: [String: [Float]]? {
        
        var fontList = [String: [Float]]()
        if let path = Bundle(for: DefaultFont.self).path(forResource: "FiraCodeRegular", ofType: "ttf") {
            
            fontList[path] = [14, 18, 22]
        }
        
        if let path = Bundle(for: DefaultFont.self).path(forResource: "DroidSans", ofType: "ttf") {

            fontList[path] = [14, 18, 22]
        }

        return fontList.count > 0 ? fontList : nil
    }
    
    public init() {}
}
