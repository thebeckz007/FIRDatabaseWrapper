//
//  Data+String.swift
//  PAD Notes
//
//  Created by Phan Anh Duy on 24/12/2023.
//

import Foundation

extension Data {
    /// Converting data to a string
    var string: String? { String(data: self, encoding: .utf8) }
}
