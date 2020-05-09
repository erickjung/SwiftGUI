//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation
//import SwiftGuiCore

/// Text node.
/// - parameter title: Text for node
/// - returns: New node
public func Text(_ title: String, _ args: CVarArg...) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        ImGuiWrapper.text(title)
    }
}

/// TextDisabled node.
/// This will show text as disabled color
/// - parameter title: Text for node
/// - returns: New node
public func TextDisabled(_ title: String, _ args: CVarArg...) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        ImGuiWrapper.textDisabled(title)
    }
}

/// TextWrapped node.
/// This will wrap text to the edge
/// - parameter title: Text for node
/// - returns: New node
public func TextWrapped(_ title: String, _ args: CVarArg...) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        ImGuiWrapper.textWrapped(title)
    }
}

/// LabelText node.
/// This will show label/format in two columns
/// - parameter title: Text for node
/// - parameter format: Format text for node
/// - returns: New node
public func LabelText(_ title: String,
                      format: String, _ args: CVarArg...) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        ImGuiWrapper.labelText(title, format: format)
    }
}

/// BulletText node.
/// This will show a text with bullet icon
/// - parameter title: Text for node
/// - returns: New node
public func BulletText(_ title: String, _ args: CVarArg...) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        ImGuiWrapper.bulletText(title)
    }
}
