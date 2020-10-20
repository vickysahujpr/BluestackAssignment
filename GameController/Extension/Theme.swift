//
//  Theme.swift
//  GameController
//
//  Created by Vikram Sahu on 19/09/20.
//  Copyright © 2020 Vikram Sahu. All rights reserved.
//

import Cocoa

extension NSColor {
    
        convenience init(red: Int, green: Int, blue: Int) {
            self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1)
        }
    
    var abc: NSColor {
        return NSColor(calibratedRed: 107/255, green: 110/255, blue: 127/255, alpha: 1.0)
      }
}
