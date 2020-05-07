//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation
import SwiftGuiCore

/// A plot types.
public enum GuiPlotType {
    case line
    case histogram
}

/// Plot node.
/// - parameter title: Text for node
/// - parameter type: Plot type
/// - parameter values: Plot values
/// - parameter valuesOffset: Value offset
/// - parameter overlayText: Text overlay
/// - parameter minScale: Plot min scale
/// - parameter maxScale: Plot max scale
/// - parameter size: Node size
/// - parameter stride: Size of data
/// - returns: New node
public func Plot(_ title: String = "",
                 type: GuiPlotType,
                 values: [Float],
                 valuesOffset: Int = 0,
                 overlayText: String = "",
                 minScale: Float = Float.greatestFiniteMagnitude,
                 maxScale: Float = Float.greatestFiniteMagnitude,
                 size: GuiSize = .zero,
                 stride: Int = MemoryLayout<Float>.size) -> GuiNode {

    GuiNode(tag: #function).onRender { _ in

        switch type {

        case .line:

            igPlotLines(title,
                        values.map({ return $0 }),
                        Int32(values.count),
                        Int32(valuesOffset),
                        overlayText,
                        minScale,
                        maxScale,
                        size.convertToVec2(),
                        Int32(stride))

        case .histogram:

            igPlotHistogramFloatPtr(title,
                                    values.map({ return $0 }),
                                    Int32(values.count),
                                    Int32(valuesOffset),
                                    overlayText,
                                    minScale,
                                    maxScale,
                                    size.convertToVec2(),
                                    Int32(stride))
        }
    }
}
