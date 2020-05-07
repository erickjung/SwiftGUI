//
//  MTKViewController.swift
//  Sample02Mac
//
//  Created by Erick Jung on 07/05/2020.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Cocoa
import Metal
import MetalKit
import SwiftGui

class MTKViewController: NSViewController {

    var renderer: SGRenderer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let mtkView = self.view as? MTKView {
            
            mtkView.device = MTLCreateSystemDefaultDevice()
            
            self.renderer = SGRenderer(view: mtkView)
            mtkView.delegate = self.renderer
        }
        
        let trackingArea = NSTrackingArea(rect: .zero,
                                          options: [.mouseMoved, .inVisibleRect, .activeAlways ],
                                          owner: self, userInfo: nil)
        self.view.addTrackingArea(trackingArea)
        
        NSEvent.addLocalMonitorForEvents(matching: [ .keyDown, .keyUp, .flagsChanged, .scrollWheel ]) { event -> NSEvent? in
            
            if let renderer = self.renderer,
                renderer.handle(event, view: self.view) {
                
                return nil
            }
            
            return event
        }
        
        
    }

    override func mouseMoved(with event: NSEvent) {
        self.renderer?.handle(event, view: self.view)
    }

    override func mouseDown(with event: NSEvent) {
        self.renderer?.handle(event, view: self.view)
    }

    override func mouseUp(with event: NSEvent) {
        self.renderer?.handle(event, view: self.view)
    }

    override func mouseDragged(with event: NSEvent) {
        self.renderer?.handle(event, view: self.view)
    }

    override func scrollWheel(with event: NSEvent) {
        self.renderer?.handle(event, view: self.view)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}
