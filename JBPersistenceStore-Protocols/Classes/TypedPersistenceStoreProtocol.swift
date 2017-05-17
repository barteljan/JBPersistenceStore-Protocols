//
//  TypedPersistenceStoreProtocol.swift
//  Pods
//
//  Created by Jan Bartel on 09.05.17.
//
//

import Foundation



public protocol TypedPersistenceStoreProtocol {
    
    associatedtype PersistableType
    
    func version() -> Int
    
    func isResponsible(for object: Any) -> Bool
    func isResponsible(forType type: Any.Type) -> Bool

    func persist(_ item: PersistableType) throws
    func persist(_ item: PersistableType,completion: @escaping () -> ()) throws
    
    func delete(_ item: PersistableType) throws
    func delete(_ item: PersistableType, completion: @escaping () -> ()) throws
    func delete(_ identifier: String, type: PersistableType.Type) throws
    func delete(_ identifier: String, type: PersistableType.Type, completion: @escaping () -> ()) throws
    
    /*
    func get(_ identifier: String) throws -> PersistableType?
    func get(_ identifier: String, completion: @escaping (_ item: PersistableType?) -> Void ) throws
    */
    func get(_ identifier: String, type: PersistableType.Type) throws -> PersistableType?
    func get(_ identifier: String, type: PersistableType.Type, completion: @escaping (_ item: PersistableType?) -> Void ) throws
    
    func getAll(_ type: PersistableType.Type) throws -> [PersistableType]
    func getAll(_ type: PersistableType.Type, completion: @escaping (_ items: [PersistableType]) -> Void) throws
    
    func getAll(_ viewName:String) throws ->[PersistableType]
    func getAll(_ viewName:String, completion: @escaping (_ items: [PersistableType]) -> Void) throws
    
    func getAll(_ viewName:String,groupName:String) throws ->[PersistableType]
    func getAll(_ viewName:String,groupName:String, completion: @escaping (_ items: [PersistableType]) -> Void) throws
    
    func exists(_ item : Any!) throws -> Bool
    func exists(_ item : Any!, completion: @escaping (_ exists: Bool) -> Void) throws
    func exists(_ identifier : String,type : Any.Type) throws -> Bool
    func exists(_ identifier : String,type : Any.Type,  completion: @escaping (_ exists: Bool) -> Void) throws
    
    func filter(_ type: PersistableType.Type, includeElement: @escaping (PersistableType) -> Bool) throws -> [PersistableType]
    func filter(_ type: PersistableType.Type, includeElement: @escaping (PersistableType) -> Bool, completion: @escaping (_ items: [PersistableType]) -> Void) throws
    
    func addView(   _ viewName: String,
                 groupingBlock: @escaping ((_ collection: String,
                                                   _ key: String,
                                                _ object: PersistableType)->String?),
                 
                 sortingBlock: @escaping ((     _ group: String,
                                          _ collection1: String,
                                                 _ key1: String,
                                              _ object1: PersistableType,
                                          _ collection2: String,
                                                 _ key2: String,
                                              _ object2: PersistableType) -> ComparisonResult)) throws
}

public extension TypedPersistenceStoreProtocol {
    
    public func version() -> Int {
        return 0;
    }
    
    public func isResponsible(for object: Any) -> Bool{
        return object is PersistableType
    }
    
    func isResponsible(forType type: Any.Type) -> Bool{
        return type.self is PersistableType.Type
    }
    
    /*
    public func persist(_ item: PersistableType) throws {
        throw PersistenceStoreError.MethodHasToBeImplemented
    }
    
    public func persist(_ item: PersistableType,completion: @escaping () -> ()) throws {
        throw PersistenceStoreError.MethodHasToBeImplemented
    }
    
    public func delete(_ item: PersistableType) throws {
        throw PersistenceStoreError.MethodHasToBeImplemented
    }

    public func delete(_ item: PersistableType, completion: @escaping () -> ()) throws {
        throw PersistenceStoreError.MethodHasToBeImplemented
    }
    
    public func delete(_ identifier: String, type: PersistableType.Type, completion: @escaping () -> ()) throws {
        throw PersistenceStoreError.MethodHasToBeImplemented
    }
    
    public func delete(_ identifier: String, type: PersistableType.Type) throws {
        throw PersistenceStoreError.MethodHasToBeImplemented
    }
    
    
    public func get(_ identifier: String) throws -> PersistableType? {
        throw PersistenceStoreError.MethodHasToBeImplemented
    }
    
    public func get(_ identifier: String, completion: @escaping (_ item: PersistableType?) -> Void ) throws {
        throw PersistenceStoreError.MethodHasToBeImplemented
    }
    
    
    public func get(_ identifier: String, type: PersistableType.Type) throws -> PersistableType? {
        throw PersistenceStoreError.MethodHasToBeImplemented
    }
    
    public func get(_ identifier: String, type: PersistableType.Type, completion: @escaping (_ item: PersistableType?) -> Void ) throws {
        throw PersistenceStoreError.MethodHasToBeImplemented
    }
    
    public func getAll(_ type: PersistableType.Type) throws -> [PersistableType] {
        throw PersistenceStoreError.MethodHasToBeImplemented
    }
    
    public func getAll(_ type: PersistableType.Type, completion: @escaping (_ items: [PersistableType]) -> Void) throws {
        throw PersistenceStoreError.MethodHasToBeImplemented
    }
    
    public func getAll(_ viewName:String) throws ->[PersistableType] {
        throw PersistenceStoreError.MethodHasToBeImplemented
    }
    
    public func getAll(_ viewName:String, completion: @escaping (_ items: [PersistableType]) -> Void) throws {
        throw PersistenceStoreError.MethodHasToBeImplemented
    }
    
    public func getAll(_ viewName:String,groupName:String) throws ->[PersistableType]  {
        throw PersistenceStoreError.MethodHasToBeImplemented
    }
    
    public func getAll(_ viewName:String,groupName:String, completion: @escaping (_ items: [PersistableType]) -> Void) throws {
        throw PersistenceStoreError.MethodHasToBeImplemented
    }
    
    public func exists(_ item : Any!) throws -> Bool  {
        throw PersistenceStoreError.MethodHasToBeImplemented
    }
    
    public func exists(_ item : Any!, completion: @escaping (_ exists: Bool) -> Void) throws  {
        throw PersistenceStoreError.MethodHasToBeImplemented
    }
    
    public func exists(_ identifier : String,type : Any.Type) throws -> Bool  {
        throw PersistenceStoreError.MethodHasToBeImplemented
    }
    
    public func exists(_ identifier : String,type : Any.Type,  completion: @escaping (_ exists: Bool) -> Void) throws  {
        throw PersistenceStoreError.MethodHasToBeImplemented
    }
    
    public func filter(_ type: PersistableType.Type, includeElement: @escaping (PersistableType) -> Bool) throws -> [PersistableType]  {
        throw PersistenceStoreError.MethodHasToBeImplemented
    }
    
    public func filter(_ type: PersistableType.Type, includeElement: @escaping (PersistableType) -> Bool, completion: @escaping (_ items: [PersistableType]) -> Void) throws  {
        throw PersistenceStoreError.MethodHasToBeImplemented
    }
    
    public func addView(_ viewName: String,
                     groupingBlock: @escaping ((_ collection: String,
                                                       _ key: String,
                                                    _ object: PersistableType)->String?),
                 
                     sortingBlock: @escaping ((     _ group: String,
                                              _ collection1: String,
                                                     _ key1: String,
                                                  _ object1: PersistableType,
                                              _ collection2: String,
                                                     _ key2: String,
                                                  _ object2: PersistableType) -> ComparisonResult)) throws {
        
        throw PersistenceStoreError.MethodHasToBeImplemented
    }
    */
    
}
