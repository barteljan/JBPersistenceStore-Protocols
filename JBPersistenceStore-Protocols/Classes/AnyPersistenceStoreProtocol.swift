//
//  AnyPersistenceStoreProtocol.swift
//  Pods
//
//  Created by Jan Bartel on 09.05.17.
//
//

import Foundation

public protocol AnyPersistenceStoreProtocol  {
    
    func version() -> Int
    
    func isResponsible(for object: Any) -> Bool
    func isResponsible(forType type: Any.Type) -> Bool
    
    func persist(_ item: Any) throws
    func persist(_ item: Any,completion: @escaping () -> ()) throws
    
    func delete(_ item: Any) throws
    func delete(_ item: Any, completion: @escaping () -> ()) throws
    
    func get<T>(_ identifier: String) throws -> T?
    func get<T>(_ identifier: String, completion: @escaping (_ item: T?) -> Void ) throws
    func get<T>(_ identifier: String, type: T.Type) throws -> T?
    func get<T>(_ identifier: String, type: T.Type, completion: @escaping (_ item: T?) -> Void ) throws
    
    func getAll<T>(_ type: T.Type) throws -> [T]
    func getAll<T>(_ type: T.Type, completion: @escaping (_ items: [T]) -> Void) throws
    
    func getAll<T>(_ viewName:String) throws -> [T]
    func getAll<T>(_ viewName:String, completion: @escaping (_ items: [T]) -> Void) throws
    
    func getAll<T>(_ viewName:String,groupName:String) throws -> [T]
    func getAll<T>(_ viewName:String,groupName:String, completion: @escaping (_ items: [T]) -> Void) throws
    
    func exists<T>(_ item : T) throws -> Bool
    func exists<T>(_ item : T, completion: @escaping (_ exists: Bool) -> Void) throws
    func exists<T>(_ identifier : String,type : T.Type) throws -> Bool
    func exists<T>(_ identifier : String,type : T.Type,  completion: @escaping (_ exists: Bool) -> Void) throws
    
    func filter <T>(_ type: T.Type, includeElement: @escaping (T) -> Bool) throws -> [T]
    func filter <T>(_ type: T.Type, includeElement: @escaping (T) -> Bool, completion: @escaping (_ items: [T]) -> Void) throws
    
    func addView<T>
        (     _ viewName: String,
              groupingBlock: @escaping ((_ collection: String,
        _ key: String,
        _ object: T)->String?),
              
              sortingBlock: @escaping ((     _ group: String,
        _ collection1: String,
        _ key1: String,
        _ object1: T,
        _ collection2: String,
        _ key2: String,
        _ object2: T) throws -> ComparisonResult)) throws
    
}
