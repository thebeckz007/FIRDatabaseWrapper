//
//  File.swift
//  
//
//  Created by Phan Anh Duy on 31/12/2023.
//

import Foundation
import Firebase

/// Struct FIRDataResult
public struct FIRDataResult {
    /// UID of FIRDataResult instance as string
    let UID: String
    
    /// Data of DataSnapShot of Firebase as Json string
    let jsonString: String?
    
    /// Initialize FIRDataResult instance
    init(UID: String, jsonString: String?) {
        self.UID = UID
        self.jsonString = jsonString
    }
    
    /// Converting data of FIRDataResult instance to dictionary
    /// - returns: a dictionary as [String: Any]
    func toDictionary() -> [String: Any]? {
        return self.jsonString?.convertToDictionary()
    }
}

extension FIRDataResult {
    /// Initialize FIRDataResult instance from DataSnapShot of Firebase
    init(dataSnapShot: DataSnapshot) {
        self.init(UID: UUID().uuidString, jsonString: dataSnapShot.json)
    }
}
