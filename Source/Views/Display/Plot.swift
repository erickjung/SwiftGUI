//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A view that displays a plot (line or histogram).
public struct Plot: GuiView, Modifiable, HasSize, HasBackgroundColor, HasActiveColor, HasHoveredColor {

    public enum PlotType {
        case line
        case histogram
    }

    public var modifiers = ViewModifiers()
    public var size: GuiSize?
    public var backgroundColor: GuiColor?
    public var activeColor: GuiColor?
    public var hoveredColor: GuiColor?

    public var label: String
    public var values: [Float]
    public var valuesOffset: Int
    public var overlayText: String
    public var minScale: Float
    public var maxScale: Float
    public var stride: Int

    public let type: PlotType

    public init(type: PlotType,
                label: String,
                values: [Float],
                valuesOffset: Int = 0,
                overlayText: String = "",
                minScale: Float = Float.greatestFiniteMagnitude,
                maxScale: Float = Float.greatestFiniteMagnitude,
                stride: Int = MemoryLayout<Float>.size) {
        self.type = type
        self.label = label
        self.values = values
        self.valuesOffset = valuesOffset
        self.overlayText = overlayText
        self.minScale = minScale
        self.maxScale = maxScale
        self.stride = stride
    }

    public func render() {
        withModifiers(modifiers) {
            // Use StyleScope to manage color push/pop
            var styleScope = StyleScope()

            styleScope.push(.frameBg, color: backgroundColor)

            let activeProperty: GuiColorProperty = type == .line ? .plotLines : .plotHistogram
            styleScope.push(activeProperty, color: activeColor)

            let hoveredProperty: GuiColorProperty = type == .line ? .plotLinesHovered : .plotHistogramHovered
            styleScope.push(hoveredProperty, color: hoveredColor)

            switch type {
            case .line:
                ImGuiWrapper.plotLines(label,
                                       values: values.map({ $0 }),
                                       valueCount: Int32(values.count),
                                       valuesOffset: Int32(valuesOffset),
                                       overlayText: overlayText,
                                       minScale: minScale,
                                       maxScale: maxScale,
                                       graphSize: size ?? .zero,
                                       stride: Int32(stride))

            case .histogram:
                ImGuiWrapper.plotHistogram(label,
                                           values: values.map({ $0 }),
                                           valueCount: Int32(values.count),
                                           valuesOffset: Int32(valuesOffset),
                                           overlayText: overlayText,
                                           minScale: minScale,
                                           maxScale: maxScale,
                                           graphSize: size ?? .zero,
                                           stride: Int32(stride))
            }

            styleScope.pop()
        }
    }
}
