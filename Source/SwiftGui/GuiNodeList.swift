//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

struct GuiNodeList: GuiView {

    let children: [GuiView]

    func render() {

        self.children.forEach { $0.render() }
    }
}
