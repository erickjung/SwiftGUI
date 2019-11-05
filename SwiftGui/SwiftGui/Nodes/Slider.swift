//
//  Slider.swift
//  SwiftGui
//
//  Created by Erick Jung on 24/10/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGUI_Core

public func SliderFloat(_ title: String,
                        valueState: Float,
                        min: Float,
                        max: Float,
                        format: String = "%.3f",
                        onChange: ((Float) -> Void)? = nil) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        var _value = valueState
        if igSliderFloat(title, &_value, min, max, format, 1.0) {
            onChange?(_value)
        }
    }
}
