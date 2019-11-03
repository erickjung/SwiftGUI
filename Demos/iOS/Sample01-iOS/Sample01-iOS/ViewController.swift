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
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        SGRenderer.handle(event, view: self.view)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        SGRenderer.handle(event, view: self.view)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        SGRenderer.handle(event, view: self.view)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        SGRenderer.handle(event, view: self.view)
    }
}

extension ViewController: SGRendererDelegate {
    
    func viewTest1() -> GuiView {
        Window("buttons") {
            Button("button")
            SmallButton("smallbutton")
            ArrowButton("#1", direction: .left)
            Bullet()
        }
    }
    
    func draw() {
        viewTest1().render()
    }
}
