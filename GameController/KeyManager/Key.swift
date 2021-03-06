//
//  Key.swift
//  GameController
//
//  Created by Vikram Sahu on 08/10/20.
//  Copyright © 2020 Vikram Sahu. All rights reserved.
//

import Carbon.HIToolbox.Events

public enum Key {
    case a
    case b
    case c
    case d
    case e
    case f
    case g
    case h
    case i
    case j
    case k
    case l
    case m
    case n
    case o
    case p
    case q
    case r
    case s
    case t
    case u
    case v
    case w
    case x
    case y
    case z
    
    case grave
    case minus
    case equal
    case backslash
    case leftBracket
    case rightBracket
    case semicolon
    case quote
    case comma
    case period
    case slash
    case yen
    case underscore
    case eisu
    case kana
    
    case zero
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    
    
    
    case `return`
    case tab
    case space
    case delete
    case escape
    case forwardDelete
    case upArrow
    case downArrow
    case leftArrow
    case rightArrow

    
    public init?(keyCode: CGKeyCode) {
        switch Int(keyCode) {
        case kVK_ANSI_A: self = .a
        case kVK_ANSI_B: self = .b
        case kVK_ANSI_C: self = .c
        case kVK_ANSI_D: self = .d
        case kVK_ANSI_E: self = .e
        case kVK_ANSI_F: self = .f
        case kVK_ANSI_G: self = .g
        case kVK_ANSI_H: self = .h
        case kVK_ANSI_I: self = .i
        case kVK_ANSI_J: self = .j
        case kVK_ANSI_K: self = .k
        case kVK_ANSI_L: self = .l
        case kVK_ANSI_M: self = .m
        case kVK_ANSI_N: self = .n
        case kVK_ANSI_O: self = .o
        case kVK_ANSI_P: self = .p
        case kVK_ANSI_Q: self = .q
        case kVK_ANSI_R: self = .r
        case kVK_ANSI_S: self = .s
        case kVK_ANSI_T: self = .t
        case kVK_ANSI_U: self = .u
        case kVK_ANSI_V: self = .v
        case kVK_ANSI_W: self = .w
        case kVK_ANSI_X: self = .x
        case kVK_ANSI_Y: self = .y
        case kVK_ANSI_Z: self = .z
            
        case kVK_ANSI_Grave:        self = .grave
        case kVK_ANSI_Minus:        self = .minus
        case kVK_ANSI_Equal:        self = .equal
        case kVK_ANSI_Backslash:    self = .backslash
        case kVK_ANSI_LeftBracket:  self = .leftBracket
        case kVK_ANSI_RightBracket: self = .rightBracket
        case kVK_ANSI_Semicolon:    self = .semicolon
        case kVK_ANSI_Quote:        self = .quote
        case kVK_ANSI_Comma:        self = .comma
        case kVK_ANSI_Period:       self = .period
        case kVK_ANSI_Slash:        self = .slash
        case kVK_JIS_Yen:           self = .yen
        case kVK_JIS_Underscore:    self = .underscore
        case kVK_JIS_Eisu:          self = .eisu
        case kVK_JIS_Kana:          self = .kana
            
        case kVK_ANSI_0: self = .zero
        case kVK_ANSI_1: self = .one
        case kVK_ANSI_2: self = .two
        case kVK_ANSI_3: self = .three
        case kVK_ANSI_4: self = .four
        case kVK_ANSI_5: self = .five
        case kVK_ANSI_6: self = .six
        case kVK_ANSI_7: self = .seven
        case kVK_ANSI_8: self = .eight
        case kVK_ANSI_9: self = .nine
            
        case kVK_Return:        self = .return
        case kVK_Tab:           self = .tab
        case kVK_Space:         self = .space
        case kVK_Delete:        self = .delete
        case kVK_Escape:        self = .escape
        case kVK_ForwardDelete: self = .forwardDelete
        case kVK_UpArrow:       self = .upArrow
        case kVK_DownArrow:     self = .downArrow
        case kVK_LeftArrow:     self = .leftArrow
        case kVK_RightArrow:    self = .rightArrow
            
        default: return nil
        }
    }
    
    public var string: String {
        switch self {
        case .a: return "A"
        case .b: return "B"
        case .c: return "C"
        case .d: return "D"
        case .e: return "E"
        case .f: return "F"
        case .g: return "G"
        case .h: return "H"
        case .i: return "I"
        case .j: return "J"
        case .k: return "K"
        case .l: return "L"
        case .m: return "M"
        case .n: return "N"
        case .o: return "O"
        case .p: return "P"
        case .q: return "Q"
        case .r: return "R"
        case .s: return "S"
        case .t: return "T"
        case .u: return "U"
        case .v: return "V"
        case .w: return "W"
        case .x: return "X"
        case .y: return "Y"
        case .z: return "Z"
            
        case .grave:        return "`"
        case .minus:        return "-"
        case .equal:        return "="
        case .backslash:    return "\\"
        case .leftBracket:  return "["
        case .rightBracket: return "]"
        case .semicolon:    return ";"
        case .quote:        return "'"
        case .comma:        return ","
        case .period:       return "."
        case .slash:        return "/"
        case .yen:          return "¥"
        case .underscore:   return "_"
        case .eisu:         return "Eisu"
        case .kana:         return "Kana"
            
        case .zero:  return "0"
        case .one:   return "1"
        case .two:   return "2"
        case .three: return "3"
        case .four:  return "4"
        case .five:  return "5"
        case .six:   return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine:  return "9"
            
        case .return:        return "↩︎"
        case .tab:           return "⇥"
        case .space:         return "␣"
        case .delete:        return "⌫"
        case .escape:        return "⎋"
        case .forwardDelete: return "⌦"
        case .upArrow:       return "↑"
        case .downArrow:     return "↓"
        case .leftArrow:     return "←"
        case .rightArrow:    return "→"

        }
    }
    
    public var keyCode: CGKeyCode {
        var keyCode: Int
        switch self {
        case .a: keyCode = kVK_ANSI_A
        case .b: keyCode = kVK_ANSI_B
        case .c: keyCode = kVK_ANSI_C
        case .d: keyCode = kVK_ANSI_D
        case .e: keyCode = kVK_ANSI_E
        case .f: keyCode = kVK_ANSI_F
        case .g: keyCode = kVK_ANSI_G
        case .h: keyCode = kVK_ANSI_H
        case .i: keyCode = kVK_ANSI_I
        case .j: keyCode = kVK_ANSI_J
        case .k: keyCode = kVK_ANSI_K
        case .l: keyCode = kVK_ANSI_L
        case .m: keyCode = kVK_ANSI_M
        case .n: keyCode = kVK_ANSI_N
        case .o: keyCode = kVK_ANSI_O
        case .p: keyCode = kVK_ANSI_P
        case .q: keyCode = kVK_ANSI_Q
        case .r: keyCode = kVK_ANSI_R
        case .s: keyCode = kVK_ANSI_S
        case .t: keyCode = kVK_ANSI_T
        case .u: keyCode = kVK_ANSI_U
        case .v: keyCode = kVK_ANSI_V
        case .w: keyCode = kVK_ANSI_W
        case .x: keyCode = kVK_ANSI_X
        case .y: keyCode = kVK_ANSI_Y
        case .z: keyCode = kVK_ANSI_Z
            
        case .grave:        keyCode = kVK_ANSI_Grave
        case .minus:        keyCode = kVK_ANSI_Minus
        case .equal:        keyCode = kVK_ANSI_Equal
        case .backslash:    keyCode = kVK_ANSI_Backslash
        case .leftBracket:  keyCode = kVK_ANSI_LeftBracket
        case .rightBracket: keyCode = kVK_ANSI_RightBracket
        case .semicolon:    keyCode = kVK_ANSI_Semicolon
        case .quote:        keyCode = kVK_ANSI_Quote
        case .comma:        keyCode = kVK_ANSI_Comma
        case .period:       keyCode = kVK_ANSI_Period
        case .slash:        keyCode = kVK_ANSI_Slash
        case .yen:          keyCode = kVK_JIS_Yen
        case .underscore:   keyCode = kVK_JIS_Underscore
        case .eisu:         keyCode = kVK_JIS_Eisu
        case .kana:         keyCode = kVK_JIS_Kana
            
        case .zero:  keyCode = kVK_ANSI_0
        case .one:   keyCode = kVK_ANSI_1
        case .two:   keyCode = kVK_ANSI_2
        case .three: keyCode = kVK_ANSI_3
        case .four:  keyCode = kVK_ANSI_4
        case .five:  keyCode = kVK_ANSI_5
        case .six:   keyCode = kVK_ANSI_6
        case .seven: keyCode = kVK_ANSI_7
        case .eight: keyCode = kVK_ANSI_8
        case .nine:  keyCode = kVK_ANSI_9
            
        case .return:        keyCode = kVK_Return
        case .tab:           keyCode = kVK_Tab
        case .space:         keyCode = kVK_Space
        case .delete:        keyCode = kVK_Delete
        case .escape:        keyCode = kVK_Escape
        case .forwardDelete: keyCode = kVK_ForwardDelete
        case .upArrow:       keyCode = kVK_UpArrow
        case .downArrow:     keyCode = kVK_DownArrow
        case .leftArrow:     keyCode = kVK_LeftArrow
        case .rightArrow:    keyCode = kVK_RightArrow
        }
        return CGKeyCode(keyCode)
    }
    
    internal var keyCode32: UInt32 {
        return UInt32(self.keyCode)
    }
}


