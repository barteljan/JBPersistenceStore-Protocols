//
//  ConvertingStore.swift
//  Pods
//
//  Created by Jan Bartel on 17.05.17.
//
//

import Foundation

open class ConvertingStore<PersistenceType,WrappedStoreType> : TypedPersistenceStoreProtocol{
    
    public typealias PersistableType = PersistenceType

    let wrappedStore : AnyTypedPersistenceStore<WrappedStoreType>
    
    public init(store : AnyTypedPersistenceStore<WrappedStoreType>,
                                   type : PersistenceType.Type){
        self.wrappedStore = AnyTypedPersistenceStore(store)
    }
    
    public func version() -> Int{
        return self.wrappedStore.version()
    }
    
    public func isResponsible(for object: Any) -> Bool{
        return self.wrappedStore.isResponsible(for: object)
    }
    
    public func isResponsible(forType type: Any.Type) -> Bool{
        return self.wrappedStore.isResponsible(forType: type)
    }
    
    
    public func persist<T>(_ item: T!) throws {
        
        if let item = item as? WrappedStoreType {
           
            try self.wrappedStore.persist(item)
            
        } else {
            throw PersistenceStoreError.CannotUse(object : item, inStoreWithType: WrappedStoreType.self)
        }
        
    }
    
    public func persist<T>(_ item: T!,completion: @escaping () -> ()) throws {
        
        if let item = item as? WrappedStoreType {
            
            try self.wrappedStore.persist(item,completion: completion)
            
        } else {
            throw PersistenceStoreError.CannotUse(object : item, inStoreWithType: WrappedStoreType.self)
        }
        
    }
    
    public func delete<T>(_ item: T!) throws {
        
        if let item = item as? WrappedStoreType {
            
            try self.wrappedStore.delete(item)
            
        } else {
            throw PersistenceStoreError.CannotUse(object : item, inStoreWithType: WrappedStoreType.self)
        }
        
    }
    
    
    public func delete<T>(_ item: T!, completion: @escaping () -> ()) throws {
        
        if let item = item as? WrappedStoreType {
            
            try self.wrappedStore.delete(item, completion: completion)
            
        } else {
            throw PersistenceStoreError.CannotUse(object : item, inStoreWithType: WrappedStoreType.self)
        }
        
    }
    
    public func delete<T>(_ identifier: String, type: T.Type) throws {
        
        if let type = T.self as? WrappedStoreType.Type {
            
            try self.delete(identifier, type: type)
            
        } else {
            throw PersistenceStoreError.CannotUseType(type : T.Type.self, inStoreWithType: WrappedStoreType.self)
        }
        
    }
    
    public func delete<T>(_ identifier: String, type: T.Type, completion: @escaping () -> ()) throws {
        
        if let type = T.self as? WrappedStoreType.Type {
            try self.wrappedStore.delete(identifier, type: type, completion: completion)
        } else {
            throw PersistenceStoreError.CannotUseType(type : T.Type.self, inStoreWithType: WrappedStoreType.self)
        }
    }
    
    
    public func get<T>(_ identifier: String) throws -> T? {
        
        print(T.self)
        print(WrappedStoreType.self)
        
        if let type = T.self as? WrappedStoreType {
            
           return try self.wrappedStore.get(identifier)
            
        } else {
            throw PersistenceStoreError.CannotUseType(type : T.Type.self, inStoreWithType: WrappedStoreType.self)
        }
        
    }
    
    public func get<T>(_ identifier: String, completion: @escaping (_ item: T?) -> Void ) throws {
        
        if let type = T.self as? WrappedStoreType {
            try self.wrappedStore.get(identifier, completion: completion)
        } else {
            throw PersistenceStoreError.CannotUseType(type : T.Type.self, inStoreWithType: WrappedStoreType.self)
        }
        
    }
    
    public func get<T>(_ identifier: String, type: T.Type) throws -> T? {
        
        if let type = T.self as? WrappedStoreType {
            return try self.wrappedStore.get(identifier, type: T.self)
        } else {
            throw PersistenceStoreError.CannotUseType(type : T.Type.self, inStoreWithType: WrappedStoreType.self)
        }
        
    }
    
    public func get<T>(_ identifier: String, type: T.Type, completion: @escaping (_ item: T?) -> Void ) throws {
        
        if let type = T.self as? WrappedStoreType {
           
            try self.wrappedStore.get(identifier, type: T.self,completion: completion)
            
        } else {
            throw PersistenceStoreError.CannotUseType(type : T.Type.self, inStoreWithType: WrappedStoreType.self)
        }
        
    }
    
    public func getAll<T>(_ type: T.Type) throws -> [T] {
        
        if let type = T.self as? WrappedStoreType {
            return try self.wrappedStore.getAll(T.self)
        } else {
            throw PersistenceStoreError.CannotUseType(type : T.Type.self, inStoreWithType: WrappedStoreType.self)
        }
    }
    
    public func getAll<T>(_ type: T.Type, completion: @escaping (_ items: [T]) -> Void) throws {
        
        if let type = T.self as? WrappedStoreType {
           
            try self.wrappedStore.getAll(T.self,completion: completion)
            
        } else {
            throw PersistenceStoreError.CannotUseType(type : T.Type.self, inStoreWithType: WrappedStoreType.self)
        }
        
    }
    
    public func getAll<T>(_ viewName:String) throws ->[T] {
        
        if let type = T.self as? WrappedStoreType {
           
            return try self.wrappedStore.getAll(viewName)
            
        } else {
            throw PersistenceStoreError.CannotUseType(type : T.Type.self, inStoreWithType: WrappedStoreType.self)
        }
        
    }
    
    public func getAll<T>(_ viewName:String, completion: @escaping (_ items: [T]) -> Void) throws {
        
        if let type = T.self as? WrappedStoreType {
            
            try self.wrappedStore.getAll(viewName, completion: completion)
            
        } else {
            throw PersistenceStoreError.CannotUseType(type : T.Type.self, inStoreWithType: WrappedStoreType.self)
        }
        
    }
    
    public func getAll<T>(_ viewName:String,groupName:String) throws ->[T] {
        
        if let type = T.self as? WrappedStoreType {
            
            return try self.wrappedStore.getAll(viewName, groupName: groupName)
            
        } else {
            throw PersistenceStoreError.CannotUseType(type : T.Type.self, inStoreWithType: WrappedStoreType.self)
        }
    }
    
    public func getAll<T>(_ viewName:String,groupName:String, completion: @escaping (_ items: [T]) -> Void) throws {
        
        if let type = T.self as? WrappedStoreType {
            
            try self.wrappedStore.getAll(viewName, groupName: groupName, completion: completion)
            
        } else {
            throw PersistenceStoreError.CannotUseType(type : T.Type.self, inStoreWithType: WrappedStoreType.self)
        }
        
        
    }
    
    public func exists(_ item : Any!) throws -> Bool {
        
        return try self.wrappedStore.exists(item)
        
    }
    
    public func exists(_ item : Any!, completion: @escaping (_ exists: Bool) -> Void) throws  {
        
        try self.wrappedStore.exists(item, completion: completion)
        
    }
    
    public func exists(_ identifier : String,type : Any.Type) throws -> Bool{
       return try self.wrappedStore.exists(identifier, type: type)
    }
    
    
    public func exists(_ identifier : String,type : Any.Type,  completion: @escaping (_ exists: Bool) -> Void) throws{
        try self.wrappedStore.exists(identifier, type: type, completion: completion)
    }
    
    
    
    public func filter<T>(_ type: T.Type, includeElement: @escaping (T) -> Bool) throws  -> [T] {
        if let type = T.self as? WrappedStoreType {
            
            let items : [T] = try self.wrappedStore.filter(T.self, includeElement:includeElement)
            
            return items
            
        } else {
            throw PersistenceStoreError.CannotUseType(type : T.Type.self, inStoreWithType: WrappedStoreType.self)
        }
    }
    
    public func filter<T>(_ type: T.Type, includeElement: @escaping (T) -> Bool, completion: @escaping (_ items: [T]) -> Void) throws {
        
        if let type = T.self as? WrappedStoreType {
            
            try self.wrappedStore.filter(T.self, includeElement: includeElement, completion: completion)
        } else {
            throw PersistenceStoreError.CannotUseType(type : T.Type.self, inStoreWithType: WrappedStoreType.self)
        }
    }
    
    
    public func addView<T>(_ viewName: String, groupingBlock: @escaping ((String, String, T) -> String?), sortingBlock: @escaping ((String, String, String, T, String, String, T) -> ComparisonResult)) throws {
        
        if let type = T.self as? WrappedStoreType {
            
            try self.wrappedStore.addView(viewName, groupingBlock: groupingBlock, sortingBlock: sortingBlock)
            
        } else {
            throw PersistenceStoreError.CannotUseType(type : T.Type.self, inStoreWithType: WrappedStoreType.self)
        }
        
    }
}
