//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation
//import SwiftGuiCore

public protocol FontGroup {

    /// Global fonts [font path : [font sizes] ]
    var fonts: [[String: [Float]]]? { get }
}

extension FontGroup {

    public func load() {

        self.fonts?.forEach { font in

            guard let font = font.first else { return }

            font.value.forEach { size in

                ImGuiWrapper.addFont(withFilename: font.key, sizePixels: size)
            }
        }
    }
}
