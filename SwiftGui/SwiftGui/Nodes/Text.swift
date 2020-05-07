//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation
import SwiftGuiCore

/// Text node.
/// - parameter title: Text for node
/// - returns: New node
public func Text(_ title: String, _ args: CVarArg...) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        igTextV(title.cStr(), withVaList(args, { $0 }))
    }
}

/// TextDisabled node.
/// This will show text as disabled color
/// - parameter title: Text for node
/// - returns: New node
public func TextDisabled(_ title: String, _ args: CVarArg...) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        igTextDisabledV(title.cStr(), withVaList(args, { $0 }))
    }
}

/// TextWrapped node.
/// This will wrap text to the edge
/// - parameter title: Text for node
/// - returns: New node
public func TextWrapped(_ title: String, _ args: CVarArg...) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        igTextWrappedV(title.cStr(), withVaList(args, { $0 }))
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

        igLabelTextV(title.cStr(), format.cStr(), withVaList(args, { $0 }))
    }
}

/// BulletText node.
/// This will show a text with bullet icon
/// - parameter title: Text for node
/// - returns: New node
public func BulletText(_ title: String, _ args: CVarArg...) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        igBulletTextV(title.cStr(), withVaList(args, { $0 }))
    }
}
