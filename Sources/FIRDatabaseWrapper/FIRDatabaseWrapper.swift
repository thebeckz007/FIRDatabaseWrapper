// The Swift Programming Language
// https://docs.swift.org/swift-book

import Firebase
import FirebaseDatabase

/// Enum FIRDatabaseWrapperError
/// Hanlde error of Realtime Database Firebase
public enum FIRDatabaseWrapperError: Error {
    case invalidPath

    var localizedDescription: String {
        switch self {
        case .invalidPath:
            return "invalid path of database"
        }
    }
}

// MARK: /// class FIRDatabaseWrapper
/// class FIRDatabaseWrapper
public class FIRDatabaseWrapper: FIRDatabaseWrapperProtocol {
    /// a shared instance of FIRDatabaseWrapper as singleton instance
    public static let sharedInstance = FIRDatabaseWrapper()
    private var refDB: DatabaseReference!

    public func configure() {
        self.setupFirebaseIfNeeded()
        refDB = Database.database().reference()
    }

    public func set(_ value: Any, at child: String, parentNodes: String..., completion: @escaping (Error?) -> Void) {
        set(value, at: child, parentNodes: parentNodes, completion: completion)
    }

    public func get(at child: String, parentNodes: String..., completion: @escaping (Result<FIRDataResult?, Error>) -> Void) {
        get(at: child, parentNodes: parentNodes, completion: completion)
    }
    
    public func delete(at child: String, parentNodes: String..., completion: @escaping (Error?) -> Void) {
        delete(at: child, parentNodes: parentNodes, completion: completion)
    }

    public func set(_ value: Any, at child: String, parentNodes: [String], completion: @escaping (Error?) -> Void) {
        do {
            try makeReference(child: child, parentNodes: parentNodes).setValue(value) { (error, _) in
                completion(error)
            }
        } catch {
            completion(error)
        }
    }
    
    public func get(at child: String, parentNodes: [String], completion: @escaping (Result<FIRDataResult?, Error>) -> Void) {
        do {
            try makeReference(child: child, parentNodes: parentNodes).observeSingleEvent(of: .value) { (data) in
                completion(.success(FIRDataResult(dataSnapShot: data)))
            }
        } catch {
            completion(.failure(error))
        }
    }
    
    public func delete(at child: String, parentNodes: [String], completion: @escaping (Error?) -> Void) {
        do {
            try makeReference(child: child, parentNodes: parentNodes).removeValue { (error, _) in
                completion(error)
            }
        } catch {
            completion(error)
        }
    }
    
    // MARK: private functions
    /// We will setup Firebase instance if it has not been configured yet
    private func setupFirebaseIfNeeded() {
        guard let _ = FirebaseApp.app() else {
            FirebaseApp.configure()
            return
        }
    }
    
    /// generate the path of parent nodes with child node
    /// - parameter child: the child node
    /// - parameter parentNodes: the list of parents node of child node as list of string. Example: parent1, parent2, parent3,....
    /// - throws: Throw an error as FIRDatabaseWrapperError.invalidPath if we can't generate a path
    /// - returns : a string as "Parent Node1/ Parent Node2/ Parent Node3/ ..../ Child Node"
    private func makeReference(child: String, parentNodes: String...) throws -> DatabaseReference {
        return try makeReference(child: child, parentNodes: parentNodes)
    }

    /// generate the path of parent nodes with child node
    /// - parameter child: the child node
    /// - parameter parentNodes: the list of parents node of child node as string array. Example: [parent1, parent2, parent3,....]
    /// - throws: Throw an error as FIRDatabaseWrapperError.invalidPath if we can't generate a path
    /// - returns : a path as "Parent Node1/ Parent Node2/ Parent Node3/ ..../ Child Node"
    private func makeReference(child: String, parentNodes: [String]) throws -> DatabaseReference {
        do {
            return try refDB.child(String.makePath(child: child, parentNodes: parentNodes))
        } catch {
            throw error
        }
    }
}
