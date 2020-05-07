//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Cocoa
import Metal
import MetalKit
import SwiftGui

class ViewController: MTKViewController {

    enum States {
    
        static var inputTask: String = ""
    }
    
    var items = [ "Test todo app": false ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.renderer?.delegate = self
        self.renderer?.initializePlatform(false)
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

    func setup() {
        DefaultFontGroup().load()
        DarculaTheme().apply()
    }

    func todoInput() -> GuiNode {

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
    
    func confirmationPopup(name: String) -> GuiNode {
        
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
    
    func cell(name: String, value: Bool, color: GuiColor) -> GuiNode {
        
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
            
            Button("remove") {
                    
                PopupOpenCall(name)
            }
            .color(.button, color: color)
            .color(.text, color: .white)
            
            confirmationPopup(name: name)
            
            Separator()
        }
    }
    
    func todoList() -> GuiNode {
        
        CollapsingHeader("TODO", options: .defaultOpen) {
         
            List(id: "##todo", size: GuiSize(width: 0, height: 150)) {
                
                ForEach(items) { val in
                   
                    if !val.1 {
                        
                        return self.cell(name: val.0, value: val.1, color: .orange)
                    }
                    return nil
                }
            }
        }
    }
    
    func doneList() -> GuiNode {
        
        CollapsingHeader("DONE", options: .defaultOpen) {
         
            List(id: "##done") {
                
                ForEach(items) { val in
                   
                    if val.1 {
                        
                        return self.cell(name: val.0, value: val.1, color: .gray)
                    }
                    return nil
                }
            }
        }
    }
    
    func mainView() -> GuiNode {
        
        Window("TODO", options: .noTitleBar) {
            
            todoInput()
            todoList()
            doneList()
        }
        .position(CGPoint(x: 0, y: 0), condition: .always)
        .size(CGSize(width: self.view.frame.width,
                     height: self.view.frame.height), condition: .always)
        .property(.windowRounding, set: 0)
        .font(DefaultFontGroup.Types.FiraCode_18)
    }
        
    func draw() {
        mainView().render()
    }
}
