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


/*
 protocol PersistenceStoreProtocolOld{

    func version() -> Int

    func persist<
        T>(_ item: T) -> T where
        T: CanBePersistedProtocol,
        T: NSCoding
 
    func persist(_ item: CanBePersistedProtocol & NSCoding) -> CanBePersistedProtocol & NSCoding
 
    func persist<
        T>(_ item: T) -> T where
        T: CanBePersistedProtocol,
        T: ValueCoding,
        T.Coder: NSCoding,
        T.Coder.Value == T
 
    func delete<
        T>(_ identifier: String, type: T.Type) where
        T: CanBePersistedProtocol,
        T: NSCoding
 
    func delete(_ item: CanBePersistedProtocol) -> CanBePersistedProtocol
 
    func get<T>(_ identifier: String) -> T? where
        T: CanBePersistedProtocol,
        T: NSCoding
 
    func get(_ identifier: String, type: CanBePersistedProtocol.Type) -> CanBePersistedProtocol?
 
    func get<T>(_ identifier: String) -> T? where
        T: CanBePersistedProtocol,
        T: ValueCoding,
        T.Coder: NSCoding,
        T.Coder.Value == T
 
 
    func exists<T>(_ item : T) -> Bool where
        T: CanBePersistedProtocol,
        T: NSCoding
 
 
    func exists<T>(_ item: T) -> Bool where
        T: CanBePersistedProtocol,
        T: ValueCoding,
        T.Coder: NSCoding,
        T.Coder.Value == T
 
 
    func exists<T>(_ identifier : String,type : T.Type) -> Bool where
        T: CanBePersistedProtocol,
        T: NSCoding
 
 
    func exists<T>(_ identifier : String,type : T.Type) -> Bool where
        T: CanBePersistedProtocol,
        T: ValueCoding,
        T.Coder: NSCoding,
        T.Coder.Value == T
 
 
    func filter <T>(_ type: T.Type, includeElement: @escaping (T) -> Bool) -> [T] where
        T: CanBePersistedProtocol,
        T: NSCoding
 
 
    func filter <T>(_ type: T.Type, includeElement: @escaping (T) -> Bool) -> [T] where
        T: CanBePersistedProtocol,
        T: ValueCoding,
        T.Coder: NSCoding,
        T.Coder.Value == T
    
    
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
        _ object2: T) -> ComparisonResult)) where
        T: CanBePersistedProtocol,
        T: NSCoding
    
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
        _ object2: T) -> ComparisonResult)) where
        T: CanBePersistedProtocol,
        T: ValueCoding,
        T.Coder: NSCoding,
        T.Coder.Value == T
    
    func getAll<T>(_ type: T.Type) -> [T] where
        T: CanBePersistedProtocol,
        T: NSCoding
    
    func getAll<T>(_ type: T.Type) -> [T] where
        T: CanBePersistedProtocol,
        T: ValueCoding,
        T.Coder: NSCoding,
        T.Coder.Value == T
    
    
    func getAll<T>(_ viewName:String)->[T] where
        T: CanBePersistedProtocol,
        T: NSCoding
    
    
    func getAll<T>(_ viewName:String)->[T] where
        T: CanBePersistedProtocol,
        T: ValueCoding,
        T.Coder: NSCoding,
        T.Coder.Value == T
    
    
    func getAll<T>(_ viewName:String,groupName:String)->[T] where
        T: CanBePersistedProtocol,
        T: ValueCoding,
        T.Coder: NSCoding,
        T.Coder.Value == T
    
    
    func getAll<T>(_ viewName:String,groupName:String)->[T] where
        T: CanBePersistedProtocol,
        T: NSCoding
    
    
}
*/

