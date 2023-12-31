//
//  String+Json.swift
//  PAD Notes
//
//  Created by Phan Anh Duy on 24/12/2023.
//

import Foundation

extension String {
    /// convert json string to a dictionary
    /// - returns: a dictionary as [String: Any]
    public func convertToDictionary() -> [String: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
