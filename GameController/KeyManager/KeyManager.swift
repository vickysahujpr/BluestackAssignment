//
//  KeyManager.swift
//  GameController
//
//  Created by Vikram Sahu on 09/10/20.
//  Copyright © 2020 Vikram Sahu. All rights reserved.
//

import Cocoa



protocol KeyManagerProtocol: class {
    func didReceiveKeyPressEvent(key: String)
}


final class KeyManager {
    
    public static let shared = KeyManager()
    var monitor:Any?
    
    weak var delegate: KeyManagerProtocol?
    
    func register() {
        monitor = NSEvent.addLocalMonitorForEvents(matching: .keyDown, handler: handler)
    }
    
    lazy var handler:(NSEvent)->NSEvent? = { [ weak self] event in
        
        let key = Key(keyCode: event.keyCode)
        if let keyString = key?.string {
            self?.delegate?.didReceiveKeyPressEvent(key: keyString)
        }
        
        return event
    }
    
    func unregister() {
        NSEvent.removeMonitor(monitor!)
    }
}
