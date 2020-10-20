//
//  KeyCellView.swift
//  GameController
//
//  Created by Vikram Sahu on 18/09/20.
//  Copyright © 2020 Vikram Sahu. All rights reserved.
//

import Cocoa

let colorKeyBackground = NSColor(red: 107, green: 110, blue: 127)


class KeyCellView: NSTableCellView {

    @IBOutlet weak var customView: NSView!
    @IBOutlet weak var lblActionType: NSTextField!
    @IBOutlet weak var lblKey: NSTextField!
    @IBOutlet weak var btnEdit: NSButton!
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        customView.backgroundColor =  colorKeyBackground
    }
    
}
