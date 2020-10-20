//
//  ViewModel.swift
//  GameController
//
//  Created by Vikram Sahu on 22/09/20.
//  Copyright © 2020 Vikram Sahu. All rights reserved.
//

import Cocoa

struct ViewModel {
    var data = [Control]()
    var guidance = [String]()
}

struct Control {
    var action: String
    var keyForAction: String
    var commonKey: String
    let guidanceCategory: String
}


func createViewModel(controlModel: ControlData)-> ViewModel{
    var viewModel = ViewModel()
   
    // create view model
    for scheme in controlModel.ControlSchemes {
        for gameControl in scheme.GameControls {
            print(gameControl)
            
            viewModel.data.append(Control(action: "headerInfo", keyForAction: "headerInfo", commonKey: "headerInfo", guidanceCategory: gameControl.GuidanceCategory ?? "" ))
            viewModel.guidance.append(gameControl.GuidanceCategory ?? "")
            
            do {
                let dict = try gameControl.allProperties()
                let dict2 = try gameControl.Guidance.allProperties()
                
                for (key, value) in dict {
                    if !Optional.isNil(value) {
                        let filterdValue = dict2.filter{ $0.key == key}
                        if !filterdValue.isEmpty {

                            viewModel.data.append(Control(action: filterdValue.values.first as? String ?? "", keyForAction: value as? String ?? "", commonKey: key, guidanceCategory: gameControl.GuidanceCategory ?? "" ))
                            print(filterdValue)
                        }
                    }
                }
                
            }
            catch {
                print(error)
            }
            
        }
    }
    
    // Sort
    viewModel.data.sort { (obj1, obj2) -> Bool in
        if obj1.action != "headerInfo" && obj2.action != "headerInfo" {
           return obj2.action > obj1.action
        }
        return false
    }
    
    return viewModel
}


