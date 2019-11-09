//
//  Popup.swift
//  SwiftGui
//
//  Created by Erick Jung on 08/11/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGUI_Core

public func PopupOpenCall(_ id: String) {

    igOpenPopup(id.cStr())
}

public func PopupCloseCall() {

    igCloseCurrentPopup()
}

public func Popup(id: String,
                  flags: ImGuiWindowFlags = .none,
                  @GuiBuilder child: () -> GuiView?) -> GuiNode {
    
    GuiNode(tag: #function, child: child()).onRender { child in
        
        if igBeginPopup(id.cStr(), flags.rawValue) {
        
            child?.render()

            igEndPopup()
        }
    }
}
