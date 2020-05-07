//
//  Button.swift
//  SwiftGui
//
//  Created by Erick Jung on 24/10/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGuiCore

public func Button(_ title: String,
                   size: SGSize = .zero,
                   onTap: (() -> Void)? = nil) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in

        if igButton(title.cStr(), size.convertToVec2()) {
            onTap?()
        }
    }
}


public func SmallButton(_ title: String,
                        onTap: (() -> Void)? = nil) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        if igSmallButton(title.cStr()) {
            onTap?()
        }
    }
}

public func ArrowButton(_ id: String,
                        direction: ImGuiDir,
                        onTap: (() -> Void)? = nil) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        if igArrowButton(id.cStr(), direction.rawValue) {
            onTap?()
        }
    }
}

public func PushButtonGroup(loop: Bool = true,
                            @GuiBuilder child: () -> GuiView?) -> GuiNode {

    GuiNode(tag: #function, child: child()).onRender { child in

        igPushButtonRepeat(loop)
        child?.render()
        igPopButtonRepeat()
    }
}

public func Bullet() -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        igBullet()
    }
}

public func Selectable(_ title: String,
                       selectedState: Bool,
                       size: SGSize = .zero,
                       flags: ImGuiSelectableFlags = .none,
                       onChange: ((Bool) -> Void)? = nil) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in

        var _value = selectedState
        if igSelectableBoolPtr(title.cStr(), &_value, flags.rawValue, size.convertToVec2()) {
            onChange?(_value)
        }
    }
}
