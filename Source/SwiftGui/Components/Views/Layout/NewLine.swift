//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class NewLine: GuiView {

    public init() {}

    public func render() {

        ImGuiWrapper.newLine()
    }
}
