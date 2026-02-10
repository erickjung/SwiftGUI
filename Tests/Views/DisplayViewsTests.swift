//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Testing
@testable import SwiftGUI

@Suite("Display Views Tests")
struct DisplayViewsTests {

    // MARK: - Text Tests

    @Test("Text is a struct with fixed layout")
    func textIsStruct() {
        let size = MemoryLayout<Text>.size
        #expect(size > 0)
    }

    @Test("Text supports identifier and textColor modifiers")
    func textModifiable() {
        let text = Text("Hello")
            .identifier("text-id")
            .textColor(.red)

        #expect(text.modifiers.id == "text-id")
        #expect(text.modifiers.textColor == .red)
    }

    @Test("Modified Text preserves Text type and content")
    func textPreservesType() {
        let text = Text("Hello").textColor(.red)

        #expect(text is Text)
        #expect(text.text == "Hello")
    }

    @Test("Text works with all text types")
    func textWithTypes() {
        let defaultText = Text("Default")
        let wrappedText = Text("Wrapped", type: .wrapped)
        let bulletText = Text("Bullet", type: .bullet)

        #expect(defaultText.type == .default)
        #expect(wrappedText.type == .wrapped)
        #expect(bulletText.type == .bullet)
    }

    @Test("Text supports chained modifiers")
    func textChainedModifiers() {
        let text = Text("Chain")
            .identifier("id")
            .textColor(.blue)
            .padding(.top, value: 10)
            .snap()

        #expect(text.modifiers.id == "id")
        #expect(text.modifiers.textColor == .blue)
        #expect(text.modifiers.padding == .top)
        #expect(text.modifiers.paddingValue == 10)
        #expect(text.modifiers.snapWidth == true)
    }

    // MARK: - TextLabel Tests

    @Test("TextLabel is a struct with fixed layout")
    func textLabelIsStruct() {
        let size = MemoryLayout<TextLabel>.size
        #expect(size > 0)
    }

    @Test("TextLabel stores label and value")
    func textLabelStoresValues() {
        let label = TextLabel(label: "Name", value: "John")

        #expect(label.label == "Name")
        #expect(label.value == "John")
    }

    @Test("TextLabel supports modifiers")
    func textLabelModifiable() {
        let label = TextLabel(label: "Age", value: "25")
            .identifier("age-label")
            .textColor(.green)

        #expect(label.modifiers.id == "age-label")
        #expect(label.modifiers.textColor == .green)
    }

    // MARK: - Image Tests

    @Test("Image is a struct with fixed layout")
    func imageIsStruct() {
        let size = MemoryLayout<Image>.size
        #expect(size > 0)
    }

    @Test("Image supports size modifier")
    func imageHasSize() {
        let image = Image(texture: nil)
            .size(CGSize(width: 100, height: 100))

        #expect(image.size?.width == 100)
        #expect(image.size?.height == 100)
    }

    @Test("Image supports tintColor modifier")
    func imageHasTintColor() {
        let image = Image(texture: nil)
            .tintColor(.red)

        #expect(image.tintColor == .red)
    }

    @Test("Image supports borderColor modifier")
    func imageHasBorderColor() {
        let image = Image(texture: nil)
            .borderColor(.blue)

        #expect(image.borderColor == .blue)
    }

    @Test("Image has correct default values")
    func imageDefaultValues() {
        let image = Image(texture: nil)

        #expect(image.size == CGSize(width: 50, height: 50))
        #expect(image.tintColor == .white)
        #expect(image.uv0 == .zero)
        #expect(image.uv1 == CGSize(width: 1, height: 1))
    }

    @Test("Image supports chained modifiers")
    func imageChainedModifiers() {
        let image = Image(texture: nil)
            .size(width: 200, height: 150)
            .tintColor(.yellow)
            .borderColor(.black)
            .identifier("img-1")

        #expect(image.size?.width == 200)
        #expect(image.size?.height == 150)
        #expect(image.tintColor == .yellow)
        #expect(image.borderColor == .black)
        #expect(image.modifiers.id == "img-1")
    }

    // MARK: - Plot Tests

    @Test("Plot is a struct with fixed layout")
    func plotIsStruct() {
        let size = MemoryLayout<Plot>.size
        #expect(size > 0)
    }

    @Test("Plot stores line type, label, and values")
    func plotLine() {
        let plot = Plot(type: .line, label: "Data", values: [1.0, 2.0, 3.0])

        #expect(plot.type == .line)
        #expect(plot.label == "Data")
        #expect(plot.values == [1.0, 2.0, 3.0])
    }

    @Test("Plot stores histogram type")
    func plotHistogram() {
        let plot = Plot(type: .histogram, label: "Histogram", values: [5.0, 10.0, 15.0])

        #expect(plot.type == .histogram)
    }

    @Test("Plot supports color and size modifiers")
    func plotModifiers() {
        let plot = Plot(type: .line, label: "Test", values: [1.0])
            .backgroundColor(.gray)
            .activeColor(.blue)
            .hoveredColor(.red)
            .size(CGSize(width: 300, height: 200))

        #expect(plot.backgroundColor == .gray)
        #expect(plot.activeColor == .blue)
        #expect(plot.hoveredColor == .red)
        #expect(plot.size?.width == 300)
        #expect(plot.size?.height == 200)
    }

    @Test("Plot has correct default values")
    func plotDefaultValues() {
        let plot = Plot(type: .line, label: "Default", values: [])

        #expect(plot.valuesOffset == 0)
        #expect(plot.overlayText == "")
        #expect(plot.stride == MemoryLayout<Float>.size)
    }

    // MARK: - GuiTexture Tests

    @Test("GuiTexture creates pointer from object")
    func guiTextureCreation() {
        let object = NSObject()
        let texture = GuiTexture(from: object)

        #expect(texture.pointer != nil)
    }
}
