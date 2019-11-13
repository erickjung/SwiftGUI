//
//  Image.swift
//  SwiftGui
//
//  Created by Erick Jung on 12/11/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGUI_Core

public func Image(imageId: SGImage?,
                  size: SGSize,
                  uv0: SGSize = .zero,
                  uv1: SGSize = SGSize(width: 1, height: 1),
                  tintColor: SGColor = .white,
                  borderColor: SGColor = SGColor(r: 0, g: 0, b: 0, a: 0)) -> GuiNode {
    
    GuiNode(tag: #function).onRender { child in
        
        if let imageId = imageId {
            
            igImage(Unmanaged.passUnretained(imageId).toOpaque(),
                    size.convertToVec2(),
                    uv0.convertToVec2(),
                    uv1.convertToVec2(),
                    tintColor.convertToVec4(),
                    borderColor.convertToVec4())
        }
    }
}
