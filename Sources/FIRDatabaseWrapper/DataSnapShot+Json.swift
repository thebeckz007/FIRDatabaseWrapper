//
//  DataSnapShot+Json.swift
//  PAD Notes
//
//  Created by Phan Anh Duy on 24/12/2023.
//

import Foundation
import FirebaseDatabase

extension DataSnapshot {
    /// Converting value of DataSnapShot to JSONSerialization data
    var jsonData: Data? {
        guard let value = value, !(value is NSNull) else { return nil }
        return try? JSONSerialization.data(withJSONObject: value)
    }
    
    /// Converting value of DataSnapShot to Json string
    var json: String? { jsonData?.string }
}
