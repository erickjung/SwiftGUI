//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

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

            ImGuiWrapper.plotLines(title,
                                   values: values.map({ return $0 }),
                                   valueCount: Int32(values.count),
                                   valuesOffset: Int32(valuesOffset),
                                   overlayText: overlayText,
                                   minScale: minScale,
                                   maxScale: maxScale,
                                   graphSize: size,
                                   stride: Int32(stride))

        case .histogram:

            ImGuiWrapper.plotHistogram(title,
                                       values: values.map({ return $0 }),
                                       valueCount: Int32(values.count),
                                       valuesOffset: Int32(valuesOffset),
                                       overlayText: overlayText,
                                       minScale: minScale,
                                       maxScale: maxScale,
                                       graphSize: size,
                                       stride: Int32(stride))
        }
    }
}
