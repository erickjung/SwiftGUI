//
//  Debug.swift
//  SwiftGui
//
//  Created by Erick Jung on 25/10/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGuiCore

public func ShowDemoWindowDebug() -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        igShowDemoWindow(nil)
    }
}

public func ShowMetricsWindowDebug() -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in

        igShowMetricsWindow(nil)
    }
}

public func ShowStyleEditorDebug() -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in

        igShowStyleEditor(nil)
    }
}

public func LogToTTY(autoOpenDepth: Int = -1,
                     @GuiBuilder child: () -> GuiView?) -> GuiNode {
    
    GuiNode(tag: #function, child: child()).onRender { child in
        
        igLogToTTY(Int32(autoOpenDepth))
        child?.render()
        igLogFinish()
    }
}

public func LogToFile(autoOpenDepth: Int = -1,
                      fileName: String,
                      @GuiBuilder child: () -> GuiView?) -> GuiNode {
    
    GuiNode(tag: #function, child: child()).onRender { child in
        
        igLogToFile(Int32(autoOpenDepth), fileName.cStr())
        child?.render()
        igLogFinish()
    }
}

public func LogToClipboard(autoOpenDepth: Int = -1,
                           @GuiBuilder child: () -> GuiView?) -> GuiNode {
    
    GuiNode(tag: #function, child: child()).onRender { child in
        
        igLogToClipboard(Int32(autoOpenDepth))
        child?.render()
        igLogFinish()
    }
}

public func LogButtons() -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        igLogButtons()
    }
}
