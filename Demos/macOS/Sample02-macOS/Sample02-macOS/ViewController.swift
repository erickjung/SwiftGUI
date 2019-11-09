//
//  ViewController.swift
//  Sample02-macOS
//
//  Created by Erick Jung on 01/11/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Cocoa
import Metal
import MetalKit
import SwiftGui
import SwiftGui_PlatformOSX

class ViewController: MTKViewController {

    enum States {
    
        static var inputTask: String = ""
    }
    
    var items = [ "Test todo app": false ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.renderer?.delegate = self
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

// data
extension ViewController {
    
    func insertItem(key: String) {
        self.items[key] = false
    }

    func updateItem(key: String, value: Bool) {
        self.items[key] = value
    }
    
    func removeItem(key: String) {
        self.items.removeValue(forKey: key)
    }
}

extension ViewController: SGRendererDelegate {

    func todoInput() -> GuiView {

        Group {
         
            Text("Task Description:")
            
            InputText(textState: States.inputTask, placeHolder: "ex. buy milk") {
                States.inputTask = $0
            }
            .width(-1)
            
            Button("Create") {
                
                if States.inputTask.count > 0 {
                    
                    self.insertItem(key: States.inputTask)
                    States.inputTask = ""
                }
            }
            
            NewLine()
        }
        .padding(.top, value: 10)
    }
    
    func confirmationPopup(name: String) -> GuiView {
        
        Popup(id: name) {
            
            Text("Remove this task?")
            
            HStack {
                
                Button("No") {
                    
                    PopupCloseCall()
                }
                
                Button("Yes") {
                    
                    self.removeItem(key: name)
                }
            }
        }
    }
    
    func cell(name: String, value: Bool, color: SGColor) -> GuiView {
        
        Group(id: name) {
            
            HStack {
                
                CheckBox(selectedState: value) {
                    
                    self.updateItem(key: name, value: $0)
                }
                
                if !value {
                
                    Text(name)
                    
                } else {
                    
                    TextDisabled(name)
                }
            }
            
            SmallButton("remove") {
                    
                PopupOpenCall(name)
            }
            .color(.button, color: color)
            
            confirmationPopup(name: name)
            
            Separator()
        }
    }
    
    func todoList() -> GuiView {
        
        CollapsingHeader("TODO", options: .defaultOpen) {
         
            List(id: "##todo", size: SGSize(width: 0, height: 150)) {
                
                ForEach(items) { val in
                   
                    if !val.1 {
                        
                        cell(name: val.0, value: val.1, color: .orange)
                    }
                }
            }
        }
    }
    
    func doneList() -> GuiView {
        
        CollapsingHeader("DONE", options: .defaultOpen) {
         
            List(id: "##done", size: SGSize(width: 0, height: 150)) {
                
                ForEach(items) { val in
                   
                    if val.1 {
                        
                        cell(name: val.0, value: val.1, color: .gray)
                    }
                }
            }
        }
    }
    
    func mainView() -> GuiView {
        
        Window("TODO", flags: .noTitleBar) {
            
            todoInput()
            todoList()
            doneList()
        }
        .position(CGPoint(x: 0, y: 0), condition: .always)
        .size(CGSize(width: self.view.frame.width,
                     height: self.view.frame.height), condition: .always)
        .property(.windowRounding, set: 0)
    }
    
    func draw() {
        mainView().render()
    }
}
