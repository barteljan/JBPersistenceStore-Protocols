//
//  TypedPersistenceStoreProtocol.swift
//  Pods
//
//  Created by Jan Bartel on 09.05.17.
//
//

import Foundation

public enum TypedPersistenceStoreError : Error{
    case methodHasToImplementedSavelyWithWhereContraint
}

public protocol TypedPersistenceStoreProtocol {
    
    associatedtype PersistableType
    
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
    
    func filter<T>(_ type: T.Type, includeElement: @escaping (T) -> Bool) throws -> [T]
    func filter<T>(_ type: T.Type, includeElement: @escaping (T) -> Bool, completion: @escaping (_ items: [T]) -> Void) throws
    
    func addView<T>(_ viewName: String,
                 groupingBlock: @escaping ((_ collection: String,
        _ key: String,
        _ object: T)->String?),
                 
                 sortingBlock: @escaping ((     _ group: String,
        _ collection1: String,
        _ key1: String,
        _ object1: T,
        _ collection2: String,
        _ key2: String,
        _ object2: T) -> ComparisonResult)) throws
}

public extension TypedPersistenceStoreProtocol {
    
    public func version() -> Int {
        return 0;
    }
    
    public func isResponsible(for object: Any) -> Bool{
        return object is PersistableType
    }
    
    func isResponsible(forType type: Any.Type) -> Bool{
        return type is PersistableType
    }
    
    public func persist<T>(_ item: T!) throws {
        throw TypedPersistenceStoreError.methodHasToImplementedSavelyWithWhereContraint
    }
    
    public func persist<T>(_ item: T!,completion: @escaping () -> ()) throws {
        throw TypedPersistenceStoreError.methodHasToImplementedSavelyWithWhereContraint
    }
    
    public func delete<T>(_ item: T!) throws {
        throw TypedPersistenceStoreError.methodHasToImplementedSavelyWithWhereContraint
    }

    
    public func delete<T>(_ item: T!, completion: @escaping () -> ()) throws {
        throw TypedPersistenceStoreError.methodHasToImplementedSavelyWithWhereContraint
    }
 
    
    public func get<T>(_ identifier: String) throws -> T? {
        throw TypedPersistenceStoreError.methodHasToImplementedSavelyWithWhereContraint
    }
    
    public func get<T>(_ identifier: String, completion: @escaping (_ item: T?) -> Void ) throws {
        throw TypedPersistenceStoreError.methodHasToImplementedSavelyWithWhereContraint
    }
    
    public func get<T>(_ identifier: String, type: T.Type) throws -> T? {
        throw TypedPersistenceStoreError.methodHasToImplementedSavelyWithWhereContraint
    }
    
    public func get<T>(_ identifier: String, type: T.Type, completion: @escaping (_ item: T?) -> Void ) throws {
        throw TypedPersistenceStoreError.methodHasToImplementedSavelyWithWhereContraint
    }
    
    public func getAll<T>(_ type: T.Type) throws -> [T] {
        throw TypedPersistenceStoreError.methodHasToImplementedSavelyWithWhereContraint
    }
    
    public func getAll<T>(_ type: T.Type, completion: @escaping (_ items: [T]) -> Void) throws {
        throw TypedPersistenceStoreError.methodHasToImplementedSavelyWithWhereContraint
    }
    
    public func getAll<T>(_ viewName:String) throws ->[T] {
        throw TypedPersistenceStoreError.methodHasToImplementedSavelyWithWhereContraint
    }
    
    public func getAll<T>(_ viewName:String, completion: @escaping (_ items: [T]) -> Void) throws {
        throw TypedPersistenceStoreError.methodHasToImplementedSavelyWithWhereContraint
    }
    
    public func getAll<T>(_ viewName:String,groupName:String) throws ->[T]  {
        throw TypedPersistenceStoreError.methodHasToImplementedSavelyWithWhereContraint
    }
    
    public func getAll<T>(_ viewName:String,groupName:String, completion: @escaping (_ items: [T]) -> Void) throws {
        throw TypedPersistenceStoreError.methodHasToImplementedSavelyWithWhereContraint
    }
    
    public func exists(_ item : Any!) throws -> Bool  {
        throw TypedPersistenceStoreError.methodHasToImplementedSavelyWithWhereContraint
    }
    
    public func exists(_ item : Any!, completion: @escaping (_ exists: Bool) -> Void) throws  {
        throw TypedPersistenceStoreError.methodHasToImplementedSavelyWithWhereContraint
    }
    
    public func exists(_ identifier : String,type : Any.Type) throws -> Bool  {
        throw TypedPersistenceStoreError.methodHasToImplementedSavelyWithWhereContraint
    }
    
    public func exists(_ identifier : String,type : Any.Type,  completion: @escaping (_ exists: Bool) -> Void) throws  {
        throw TypedPersistenceStoreError.methodHasToImplementedSavelyWithWhereContraint
    }
    
    public func filter<T>(_ type: T.Type, includeElement: @escaping (T) -> Bool) throws -> [T]  {
        throw TypedPersistenceStoreError.methodHasToImplementedSavelyWithWhereContraint
    }
    
    public func filter<T>(_ type: T.Type, includeElement: @escaping (T) -> Bool, completion: @escaping (_ items: [T]) -> Void) throws  {
        throw TypedPersistenceStoreError.methodHasToImplementedSavelyWithWhereContraint
    }
    
    public func addView<T>(_ viewName: String,
                 groupingBlock: @escaping ((_ collection: String,
        _ key: String,
        _ object: T)->String?),
                 
                 sortingBlock: @escaping ((     _ group: String,
        _ collection1: String,
        _ key1: String,
        _ object1: T,
        _ collection2: String,
        _ key2: String,
        _ object2: T) -> ComparisonResult)) throws {
        
        throw TypedPersistenceStoreError.methodHasToImplementedSavelyWithWhereContraint
    }

    
}
