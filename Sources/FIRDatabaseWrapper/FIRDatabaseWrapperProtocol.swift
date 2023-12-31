//
//  File.swift
//  
//
//  Created by Phan Anh Duy on 27/12/2023.
//

import Foundation

// MARK: protocol FIRDatabaseWrapperProtocol
/// protocol FIRDatabaseWrapperProtocol
/// list of functions for Realtime database
public protocol FIRDatabaseWrapperProtocol {
    /// configure somthing to Realtime database Firebase
    func configure()
    
    /// create new child node to database or update value to child node
    /// - parameter value: the value of child node which will added/ updated
    /// - parameter child: child node which will be added/ updated value
    /// - parameter parentNodes: the list of parents node of child node as list of string. Example: parent1, parent2, parent3,....
    /// - parameter completion: the call back result with format (Error?). It means adding/ updating value to child node is success if we don't have any errors
    func set(_ value: Any, at child: String, parentNodes: String..., completion: @escaping (Error?) -> Void)
    
    /// create new child node to database or update value to child node
    /// - parameter value: the value of child node which will added/ updated
    /// - parameter child: child node which will be added/ updated value
    /// - parameter parentNodes: the list of parents node of child node as string array. Example: [parent1, parent2, parent3,....]
    /// - parameter completion: the call back result with format (Error?). It means adding/ updating value to child node is success if we don't have any errors
    func set(_ value: Any, at child: String, parentNodes: [String], completion: @escaping (Error?) -> Void)
    
    /// get value of child node from database
    /// - parameter child: the child node what will be get the value
    /// - parameter parentNodes: the list of parents node of child node as list of string. Example: parent1, parent2, parent3,....
    /// - parameter completion: the call back result with format (Result<DataSnapshot, Error>)
    func get(at child: String, parentNodes: String..., completion: @escaping (Result<FIRDataResult?, Error>) -> Void)
    
    /// get value of child node from database
    /// - parameter child: the child node what will be get the value
    /// - parameter parentNodes: the list of parents node of child node as string array. Example: [parent1, parent2, parent3,....]
    /// - parameter completion: the call back result with format (Result<DataSnapshot, Error>)
    func get(at child: String, parentNodes: [String], completion: @escaping (Result<FIRDataResult?, Error>) -> Void)
    
    /// delete child node from database
    /// - parameter child: the child node what will be deleted from database
    /// - parameter parentNodes: the list of parents node of child node as list of string. Example: parent1, parent2, parent3,....
    /// - parameter completion: the call back result with format (Error?). It means deleting child node is success if we don't have any errors
    func delete(at child: String, parentNodes: String..., completion: @escaping (Error?) -> Void)
    
    /// delete child node from database
    /// - parameter child: the child node what will be deleted from database
    /// - parameter parentNodes: the list of parents node of child node as string array. Example: [parent1, parent2, parent3,....]
    /// - parameter completion: the call back result with format (Error?). It means deleting child node is success if we don't have any errors
    func delete(at child: String, parentNodes: [String], completion: @escaping (Error?) -> Void)
}
