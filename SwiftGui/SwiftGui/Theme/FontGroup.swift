//
//  FontGroup.swift
//  SwiftGui
//
//  Created by Erick Jung on 13/11/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGuiCore

public protocol FontGroup {
 
    /// Global fonts [font path : [font sizes] ]
    var fonts: [[String: [Float]]]? { get }
}

extension FontGroup {
    
    public func load() {
     
        if let io = igGetIO() {

            self.fonts?.forEach { font in

                if let font = font.first {
                    
                    font.value.forEach { size in
                        
                        ImFontAtlas_AddFontFromFileTTF(io.pointee.Fonts, font.key.cStr(), size, nil, nil)
                    }
                }
            }
        }
    }
}
