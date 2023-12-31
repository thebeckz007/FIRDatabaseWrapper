//
//  String+Path.swift
//  PAD Notes
//
//  Created by Phan Anh Duy on 23/12/2023.
//

import Foundation

/// extension from String
extension String {
    /// generate the path of parent nodes with child node as a string
    /// - parameter child: the child node
    /// - parameter parentNodes: the list of parents node of child node as list of string. Example: parent1, parent2, parent3,....
    /// - throws: Throw an error as FIRDatabaseWrapperError.invalidPath if we can't generate a path
    /// - returns : a string of path as "Parent Node1/ Parent Node2/ Parent Node3/ ..../ Child Node"
    static func makePath(child: String, parentNodes: String...) throws -> String {
        return try makePath(child: child, parentNodes: parentNodes)
    }
    
    /// generate the path of parent nodes with child node as a string
    /// - parameter child: the child node
    /// - parameter parentNodes: the list of parents node of child node as string array. Example: [parent1, parent2, parent3,....]
    /// - throws: Throw an error as FIRDatabaseWrapperError.invalidPath if we can't generate a path
    /// - result : "Parent Node1/ Parent Node2/ Parent Node3/ ..../ Child Node"
    static func makePath(child: String, parentNodes: [String]) throws -> String {
        return try makePath(nodes: (parentNodes + [child]))
    }
    
    
    /// generate the path of  list nodes as a string
    /// - parameter nodes: the list of nodes as list of string. Example: parent1, parent2, parent3,....
    /// - throws: Throw an error as FIRDatabaseWrapperError.invalidPath if we can't generate a path
    /// - returns : a string of path as " Node1/  Node2/ Node3/ ...."
    static func makePath(nodes: String...) throws -> String {
        return try makePath(nodes: nodes)
    }
    
    /// generate the path of  list nodes as a string
    /// - parameter nodes: the list of nodes as string array. Example: [parent1, parent2, parent3,....]
    /// - throws: Throw an error as FIRDatabaseWrapperError.invalidPath if we can't generate a path
    /// - returns : a string of path as " Node1/  Node2/ Node3/ ...."
    static func makePath(nodes: [String]) throws -> String {
        return try nodes.map { child -> String in
            let trimmed = child.trimmingCharacters(in: CharacterSet(charactersIn: "/"))
            guard trimmed != "" && !trimmed.contains("//") else {
                throw FIRDatabaseWrapperError.invalidPath
            }
            return trimmed
            }.joined(separator: "/")
    }
}
