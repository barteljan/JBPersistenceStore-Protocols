//
//  PersistenceStoreProtocol.swift
//  Pods
//
//  Created by Jan Bartel on 06.05.16.
//
//

import Foundation

public protocol PersistenceStoreProtocol {
    
    typealias PersistableType = NSCoding & CanBePersistedProtocol
    
    func version() -> Int
    
    func isResponsible(for object: Any) -> Bool
    
    func isResponsible(forType type: Any.Type) -> Bool
    
    
    func persist<T>(_ item: T!) throws
    
    func persist<T>(_ item: T!,completion: @escaping () -> ()) throws
    
    func delete<T>(_ item: T!) throws
    func delete<T>(_ item: T!, completion: @escaping () -> ()) throws
    
    func get<T>(_ identifier: String) throws -> T?
    func get<T>(_ identifier: String, completion: @escaping (_ item: T?) -> Void ) throws
    func get<T>(_ identifier: String, type: T.Type) throws -> T?
    func get<T>(_ identifier: String, type: T.Type, completion: @escaping (_ item: T?) -> Void ) throws
    
    func getAll<T>(_ type: T.Type) throws -> [T]
    func getAll<T>(_ type: T.Type, completion: @escaping (_ items: [T]) -> Void) throws
    func getAll<T>(_ viewName:String) throws ->[T]
    func getAll<T>(_ viewName:String, completion: @escaping (_ items: [T]) -> Void) throws
    func getAll<T>(_ viewName:String,groupName:String) throws ->[T]
    func getAll<T>(_ viewName:String,groupName:String, completion: @escaping (_ items: [T]) -> Void) throws
    
    func exists(_ item : Any!) throws -> Bool
    func exists(_ item : Any!, completion: @escaping (_ exists: Bool) -> Void) throws
    func exists(_ identifier : String,type : Any.Type) throws -> Bool
    func exists(_ identifier : String,type : Any.Type,  completion: @escaping (_ exists: Bool) -> Void) throws
    
    func filter<T>(_ type: T.Type, includeElement: @escaping (T) -> Bool) throws  -> [T]
    func filter<T>(_ type: T.Type, includeElement: @escaping (T) -> Bool, completion: @escaping (_ items: [T]) -> Void) throws 
    
    func addView<T>(_ viewName: String, groupingBlock: @escaping ((String, String, T) -> String?), sortingBlock: @escaping ((String, String, String, T, String, String, T) -> ComparisonResult)) throws
    
}


 extension PersistenceStoreProtocol{
    
     func version() -> Int {
        return 0
    }
    
}
