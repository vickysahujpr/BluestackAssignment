//
//  ControlData.swift
//  GameController
//
//  Created by Vikram Sahu on 19/09/20.
//  Copyright © 2020 Vikram Sahu. All rights reserved.
//
//
import Foundation

struct ControlData: Codable {
    var ControlSchemes: [ControlSchemes]
}

struct ControlSchemes: Codable {
    var GameControls: [ControlInfo]
}

struct ControlInfo: Codable, Loopable {
    var Key1: String?
    var Key2: String?
    var KeyB: String?
    var KeyQ: String?
    var KeyE: String?
    var KeyC: String?
    var KeyR: String?
    var KeyMouseRButton: String?
    var Key4: String?
    var KeyF: String?
    var KeyV: String?
    var Key3: String?
    var KeyM: String?
    
    var KeyG: String?
    var KeyTab: String?
    var KeyF4: String?
    var Key5: String?
    var KeyZ: String?
    var Key: String?
    var KeyDown: String?
    var KeyUp: String?
    var KeyEnter: String?
    
    var Guidance : Guidance
    var GuidanceCategory: String?
    
    
    func valueAvailable(value: String) -> Bool {
        do{
            let properties = try self.allProperties()
            for obj in properties {
                if let val = obj.value as? String {
                    if val == value {
                        return true
                    }
                }
            }
        }catch { }
        
        return false
    }
    
    func valueByPropertyName(name:String) -> String {
        switch name {
            case "Key1": return Key1 ?? ""
            case "Key2": return Key2 ?? ""
            case "KeyB": return KeyB ?? ""
            case "KeyQ": return KeyQ ?? ""
            case "KeyE": return KeyE ?? ""
            case "KeyC": return KeyC ?? ""
            case "KeyR": return KeyR ?? ""
            case "KeyMouseRButton": return KeyMouseRButton ?? ""
            case "Key4": return Key4 ?? ""
            case "KeyF": return KeyF ?? ""
            case "KeyV": return KeyV ?? ""
            case "Key3": return Key3 ?? ""
            case "KeyM": return KeyM ?? ""
            
            case "KeyG": return KeyG ?? ""
            case "KeyTab": return KeyTab ?? ""
            case "KeyF4": return KeyF4 ?? ""
            case "Key5": return Key5 ?? ""
            case "KeyZ": return KeyZ ?? ""
            case "Key": return Key ?? ""
            case "KeyDown": return KeyDown ?? ""
            case "KeyUp": return KeyUp ?? ""
            case "KeyEnter": return KeyEnter ?? ""
            
        default: fatalError("Wrong property name")
        }
    }
    
    mutating func setValueByPropertyName(name:String, value:String) {
        switch name {
            
            case "Key1": Key1 = value
            case "Key2": Key2 = value
            case "KeyB": KeyB = value
            case "KeyQ": KeyQ = value
            case "KeyE": KeyE = value
            case "KeyC": KeyC = value
            case "KeyR": KeyR = value
            case "KeyMouseRButton": KeyMouseRButton = value
            case "Key4": Key4 = value
            case "KeyF": KeyF = value
            case "KeyV": KeyV = value
            case "Key3": Key3 = value
            case "KeyM": KeyM = value
            
            case "KeyG": KeyG = value
            case "KeyTab": KeyTab = value
            case "KeyF4": KeyF4 = value
            case "Key5": Key5 = value
            case "KeyZ": KeyZ = value
            case "Key": Key = value
            case "KeyDown": KeyDown = value
            case "KeyUp": KeyUp = value
            case "KeyEnter": KeyEnter = value
            
        default: fatalError("Wrong property name")
        }
    }
}

struct Guidance: Codable, Loopable {
    var Key1: String?
    var Key2: String?
    var KeyB: String?
    var KeyQ: String?
    var KeyE: String?
    var KeyC: String?
    var KeyR: String?
    var KeyMouseRButton: String?
    var Key4: String?
    var KeyF: String?
    var KeyV: String?
    var Key3: String?
    var KeyM: String?
    
    var KeyG: String?
    var KeyTab: String?
    var KeyF4: String?
    var Key5: String?
    var KeyZ: String?
    var Key: String?
    var KeyDown: String?
    var KeyUp: String?
    var KeyEnter: String?
}

