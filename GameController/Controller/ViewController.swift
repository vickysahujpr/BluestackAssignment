//
//  ViewController.swift
//  GameController
//
//  Created by Vikram Sahu on 17/09/20.
//  Copyright © 2020 Vikram Sahu. All rights reserved.
//

import Cocoa


class ViewController: NSViewController {
    
    @IBOutlet weak var tableViewMaster: NSTableView!
    @IBOutlet weak var tableViewDetail: NSTableView!
    let alert = NSAlert()
    var controleDataModel: ControlData?
    var currentSelectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        DataStore.shared.delegate = self
        DataStore.shared.fetchControleData()
        
        KeyManager.shared.delegate = self
        KeyManager.shared.register()
    }
    
    var arrControlData: ViewModel? {
        didSet {
            // Update the view, if already loaded.
//            tableViewDetail.reloadData()
            self.reloadData()
        }
    }
    
    
    override func flagsChanged(with event: NSEvent) {
    switch event.modifierFlags.intersection(.deviceIndependentFlagsMask) {
    case [.shift]:
        print("shift key is pressed")
    case [.control]:
        print("control key is pressed")
    case [.option] :
        print("option key is pressed")
    case [.command]:
        print("Command key is pressed")
    case [.control, .shift]:
        print("control-shift keys are pressed")
    case [.option, .shift]:
        print("option-shift keys are pressed")
    case [.command, .shift]:
        print("command-shift keys are pressed")
    case [.control, .option]:
        print("control-option keys are pressed")
    case [.control, .command]:
        print("control-command keys are pressed")
    case [.option, .command]:
        print("option-command keys are pressed")
    case [.shift, .control, .option]:
        print("shift-control-option keys are pressed")
    case [.shift, .control, .command]:
        print("shift-control-command keys are pressed")
    case [.control, .option, .command]:
        print("control-option-command keys are pressed")
    case [.shift, .command, .option]:
        print("shift-command-option keys are pressed")
    case [.shift, .control, .option, .command,]:
        print("shift-control-option-command keys are pressed")
    default:
        print("no modifier keys are pressed")
    }
    }
    
    override func viewWillDisappear() {
        super.viewWillDisappear()
        KeyManager.shared.unregister()
    }
    
    @IBAction func btnEditAction(_ sender: NSButton) {
        currentSelectedIndex = sender.tag
        
        alert.messageText = "Change control"
        alert.informativeText = "Please press desired Key to change this control"
        alert.beginSheetModal(for: self.view.window!) { (response) in
            print("action")
        }
    }
    
    func reloadData() {
        let visibleRect = tableViewDetail.visibleRect
        tableViewDetail.reloadData()
        tableViewDetail.scrollToVisible(visibleRect)
    }

}


extension ViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        if tableView == tableViewDetail {
            return arrControlData?.data.count ?? 0
        }else{
            return arrControlData?.guidance.count ?? 0
        }
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        if tableView == tableViewDetail {
            if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "column") {
                
                if arrControlData?.data[row].action == "headerInfo"{
                    let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "cellHeader")
                    guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView else { return nil }
                    cellView.textField?.stringValue = arrControlData?.data[row].guidanceCategory ?? ""
                    return cellView
                }else{
                    let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "cellControlKey")
                    guard let cellView = tableView.makeView(withIdentifier:cellIdentifier, owner: self) as? KeyCellView else { return nil }
                    if let txtAction = arrControlData?.data[row].action {
                        cellView.lblActionType.stringValue = txtAction
                    }
                    if let txtKey = arrControlData?.data[row].keyForAction {
                        cellView.lblKey.stringValue = txtKey
                    }
                    cellView.btnEdit.tag = row
                    return cellView
                }
                
            } else {
                
            }
        }else{
            let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "GuidanceCell")
            guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView else { return nil }
            cellView.textField?.stringValue = arrControlData?.guidance[row] ?? ""
            return cellView
        }
        
        return nil
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 40
    }
}

extension ViewController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        if tableView == tableViewMaster {
            let headerTitle = arrControlData?.guidance[row]
            guard let indexToScroll = arrControlData?.data.firstIndex(where: { (obj) -> Bool in
                return obj.action == "headerInfo" && obj.guidanceCategory == headerTitle
            }) else { return false }
            
            tableViewDetail.scrollRowToVisible(indexToScroll)
            return true
        }
        
        return false
    }
}

extension ViewController: DataStoreProtocol {
    func dataStoreDidFetch(controlModel: ControlData) {
        print("fetched")
        controleDataModel = controlModel
        arrControlData = createViewModel(controlModel: controlModel)
    }
}

extension ViewController: KeyManagerProtocol {
    func didReceiveKeyPressEvent(key: String) {
        print(key)
        
        guard let commonKey = arrControlData?.data[currentSelectedIndex].commonKey else { return }
        guard let KeyForAction = arrControlData?.data[currentSelectedIndex].keyForAction else { return  }
        
        
        // Check entered Key is already associated with any action or not, If already available then return from this function
        guard let available = controleDataModel?.ControlSchemes[0].GameControls.filter({ (contolObj) -> Bool in
            contolObj.valueAvailable(value: key)
        }), available.count == 0 else {
            showAlert(question: "This key is already registered with another control, please choose another key", text: "")
            return
        }
        
        if let count = controleDataModel?.ControlSchemes.count, count == 0 {
            return
        }
        guard let index = controleDataModel?.ControlSchemes[0].GameControls.firstIndex(where: { (obj) -> Bool in
            let previousActionKey = obj.valueByPropertyName(name: commonKey)
            return previousActionKey == KeyForAction
        }) else { return }
        
        
        controleDataModel?.ControlSchemes[0].GameControls[index].setValueByPropertyName(name: commonKey, value: key)
        
        if let updatedModel = controleDataModel {
            DataStore.shared.writeToFile(controlModel: updatedModel)
        }
        NSApp.mainWindow?.endSheet(alert.window)
        DataStore.shared.fetchControleData()
    }
}

        
