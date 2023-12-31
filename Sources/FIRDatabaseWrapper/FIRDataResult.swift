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
    let jsonData: String?
    
    /// Initialize FIRDataResult instance
    init(UID: String = UUID().uuidString, jsonData: String?) {
        self.UID = UID
        self.jsonData = jsonData
    }
    
    /// Converting data of FIRDataResult instance to dictionary
    /// - returns: a dictionary as [String: Any]
    public func toDictionary() -> [String: Any]? {
        return self.jsonData?.convertToDictionary()
    }
}

extension FIRDataResult {
    /// Initialize FIRDataResult instance from DataSnapShot of Firebase
    init(dataSnapShot: DataSnapshot) {
        self.init(jsonData: dataSnapShot.json)
    }
}

extension FIRDataResult {
    public init(jsonString: String) {
        self.init(jsonData: jsonString)
    }
}
