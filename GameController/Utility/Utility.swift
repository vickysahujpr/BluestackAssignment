//
//  Utility.swift
//  GameController
//
//  Created by Vikram Sahu on 21/09/20.
//  Copyright © 2020 Vikram Sahu. All rights reserved.
//

import Cocoa

func showAlert(question: String, text: String) {
    let alert = NSAlert()
    alert.messageText = question
    alert.informativeText = text
    alert.alertStyle = NSAlert.Style.warning
//    alert.addButton(withTitle: "OK")
    alert.addButton(withTitle: "Cancel")
    alert.runModal()
}
