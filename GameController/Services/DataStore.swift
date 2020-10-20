//
//  DataStore.swift
//  GameController
//
//  Created by Vikram Sahu on 21/09/20.
//  Copyright © 2020 Vikram Sahu. All rights reserved.
//

import Cocoa

protocol DataStoreProtocol: class {
    func dataStoreDidFetch(controlModel: ControlData)
}

class DataStore: NSObject {
    
    static let shared = DataStore()
    weak var delegate: DataStoreProtocol?
    
    var fm = FileManager.default
    var bundleUrl: URL? = Bundle.main.url(forResource: "ControlData", withExtension: "json")
    var docDirectoryUrl: URL?
    
    func fetchControleData() {
        let decoder = JSONDecoder()
        let data = getData()
        if let d = data {
            do {
                let decodedData = try decoder.decode(ControlData.self, from: d)
                print(decodedData)
                delegate?.dataStoreDidFetch(controlModel: decodedData)
            }catch {
                print("decode error")
            }
        }
    }
    
    func getData() -> Data? {
        do {
            let documentDirectory = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            docDirectoryUrl = documentDirectory.appendingPathComponent("ControlData.json")
            let jsonData = loadFile(bundleUrl: bundleUrl!, docDirectoryUrl: docDirectoryUrl!)
            return jsonData
        } catch {
            print(error)
        }
        
        return nil
    }
    
    func loadFile(bundleUrl: URL, docDirectoryUrl: URL) -> Data? {
        var jsonData: Data
        do {
            if fm.fileExists(atPath: docDirectoryUrl.path){
                jsonData = try Data(contentsOf: docDirectoryUrl)
            }else{
                jsonData = try Data(contentsOf: bundleUrl)
            }
            return jsonData
        } catch {
            print(error)
        }
        return nil
    }
    
    func writeToFile(controlModel: ControlData) {
        do{
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let JsonData = try encoder.encode(controlModel)
            try JsonData.write(to: docDirectoryUrl!)
        }catch{
            print(error)
        }
    }
}
