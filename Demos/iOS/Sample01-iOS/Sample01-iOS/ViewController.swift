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

var radioState = 0

class ViewController: UIViewController {
    
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
}

extension ViewController: SGRendererDelegate {
    
    func setup() {
        DarculaTheme().apply()
    }
    
    func viewTest1() -> GuiView {
        Window("Hello world") {
            Text("Hello world!")
            
            HStack {
                RadioButtonGroup(["radio a", "radio b", "radio c"],
                                 selectedState: radioState) {
                    radioState = $0
                }
            }
            
            HStack {
                ForEach((1...7)) { _ in
                    Button("Click")
                        .color(.button, color: .blue)
                        .color(.buttonHovered, color: .yellow)
                        .color(.buttonActive, color: .orange)
                }
            }
        }
    }
    
    func draw() {
        viewTest1().render()
    }
}
