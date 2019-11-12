//
//  ViewController.swift
//  Sample01-iOS
//
//  Created by Erick Jung on 01/11/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import UIKit
import SwiftGui
import SwiftGui_PlatformiOS


class ViewController: UIViewController {
    
    var logo: SGImage?
    var radioState = 0

    var renderer: SGRenderer?
    let mtkView = MTKView()

    override func loadView() {
        self.view = mtkView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let mtkView = self.view as? MTKView {
            
            mtkView.device = MTLCreateSystemDefaultDevice()
            
            self.renderer = SGRenderer(view: mtkView)
            self.renderer?.delegate = self
            mtkView.delegate = self.renderer
        }
        
        self.renderer?.initializePlatform()
        
        self.loadResources()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.renderer?.handle(event, view: self.view)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.renderer?.handle(event, view: self.view)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.renderer?.handle(event, view: self.view)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.renderer?.handle(event, view: self.view)
    }
    
    private func loadResources() {
        
        logo = self.renderer?.loadTexture(withName: "swiftgui")
    }
}

extension ViewController: SGRendererDelegate {
    
    func setup() {
        DarculaTheme().apply()
    }
    
    func viewTest1() -> GuiView {
        Window("Hello world") {
            
            Image(imageId: logo, size: SGSize(width: 250, height: 65))
            
            HStack {
                RadioButtonGroup(["radio a", "radio b", "radio c"],
                                 selectedState: radioState) {
                    self.radioState = $0
                }
            }
            
            HStack {
                ForEach((1...5)) { val in
                    Button("Click \(val)")
                        .color(.buttonHovered, color: .brown)
                        .color(.buttonActive, color: .orange)
                }
            }
        }
    }
    
    func draw() {
        viewTest1().render()
    }
}
