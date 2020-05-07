//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
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
