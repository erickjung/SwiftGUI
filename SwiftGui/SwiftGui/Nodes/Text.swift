//
//  Text.swift
//  SwiftGui
//
//  Created by Erick Jung on 24/10/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGUI_Core

public func Text(_ title: String, _ args: CVarArg...) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        igTextV(title.cStr(), withVaList(args, { $0 }))
    }
}

public func TextUnformatted(_ text: String) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        igTextUnformatted(text.cStr(), nil)
    }
}

public func TextDisabled(_ title: String, _ args: CVarArg...) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        igTextDisabledV(title.cStr(), withVaList(args, { $0 }))
    }
}

public func TextWrapped(_ title: String, _ args: CVarArg...) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        igTextWrappedV(title.cStr(), withVaList(args, { $0 }))
    }
}

public func LabelText(_ title: String,
                      format: String, _ args: CVarArg...) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        igLabelTextV(title.cStr(), format.cStr(), withVaList(args, { $0 }))
    }
}

public func BulletText(_ text: String, _ args: CVarArg...) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        igBulletTextV(text.cStr(), withVaList(args, { $0 }))
    }
}
