//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class Plot: GuiNode,
                   BackgroundColorModifier,
                   ActiveColorModifier,
                   HoveredColorModifier {

    public enum PlotType {
        case line
        case histogram
    }

    public var backgroundColor: GuiColor?
    public var activeColor: GuiColor?
    public var hoveredColor: GuiColor?

    public var label: String
    public var values: [Float]
    public var valuesOffset: Int
    public var overlayText: String
    public var minScale: Float
    public var maxScale: Float
    public var size: GuiSize
    public var stride: Int

    public private(set) var type: PlotType

    public init(type: PlotType,
                label: String,
                values: [Float],
                valuesOffset: Int = 0,
                overlayText: String = "",
                minScale: Float = Float.greatestFiniteMagnitude,
                maxScale: Float = Float.greatestFiniteMagnitude,
                size: GuiSize = .zero,
                stride: Int = MemoryLayout<Float>.size) {

        self.type = type
        self.label = label
        self.values = values
        self.valuesOffset = valuesOffset
        self.overlayText = overlayText
        self.minScale = minScale
        self.maxScale = maxScale
        self.size = size
        self.stride = stride
    }

    public override func drawComponent() {

        if let color = self.backgroundColor {
            ImGuiWrapper.pushStyleColor(GuiColorProperty.frameBg.rawValue, colorRef: color.cgColor)
        }

        if let color = self.activeColor {
            let keyColor = self.type == .line ? GuiColorProperty.plotLines.rawValue : GuiColorProperty.plotHistogram.rawValue
            ImGuiWrapper.pushStyleColor(keyColor, colorRef: color.cgColor)
        }

        if let color = self.hoveredColor {
            let keyColor = self.type == .line ? GuiColorProperty.plotLinesHovered.rawValue : GuiColorProperty.plotHistogramHovered.rawValue
            ImGuiWrapper.pushStyleColor(keyColor, colorRef: color.cgColor)
        }

        switch type {

        case .line:

            ImGuiWrapper.plotLines(self.label,
                                   values: self.values.map({ return $0 }),
                                   valueCount: Int32(self.values.count),
                                   valuesOffset: Int32(self.valuesOffset),
                                   overlayText: self.overlayText,
                                   minScale: self.minScale,
                                   maxScale: self.maxScale,
                                   graphSize: self.size,
                                   stride: Int32(self.stride))

        case .histogram:

            ImGuiWrapper.plotHistogram(self.label,
                                       values: self.values.map({ return $0 }),
                                       valueCount: Int32(self.values.count),
                                       valuesOffset: Int32(self.valuesOffset),
                                       overlayText: self.overlayText,
                                       minScale: self.minScale,
                                       maxScale: self.maxScale,
                                       graphSize: self.size,
                                       stride: Int32(self.stride))
        }

        if self.backgroundColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }

        if self.activeColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }

        if self.hoveredColor != nil {
            ImGuiWrapper.popStyleColor(1)
        }
    }
}
