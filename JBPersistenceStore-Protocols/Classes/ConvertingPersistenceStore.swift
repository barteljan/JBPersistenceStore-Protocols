//
//  ConvertingPersistenceStore.swift
//  Pods
//
//  Created by Jan Bartel on 16.05.17.
//
//

import Foundation

public struct ConvertingPersistenceStore<PersistenceType,WrappedStoreType> : TypedPersistenceStoreProtocol {

    public typealias PersistableType = PersistenceType
    
    let wrappedStore : AnyTypedPersistenceStore<WrappedStoreType>
    
    public init(store:  AnyTypedPersistenceStore<WrappedStoreType>, type: PersistenceType.Type){
        self.wrappedStore = store
    }
    
    public func isResponsible(for object: Any) -> Bool{
        return self.wrappedStore.isResponsible(for: object)
    }
    
    public func isResponsible(forType type: Any.Type) -> Bool{
        return self.wrappedStore.isResponsible(forType: type)
    }
    
    public func version() -> Int {
        return self.wrappedStore.version()
    }
    
    public func persist(_ item: PersistableType) throws {
        if let item = item as? WrappedStoreType {
            try self.wrappedStore.persist(item)
        }

    }
    
    public func persist(_ item: PersistableType,completion: @escaping () -> ()) throws {
        if let item = item as? WrappedStoreType {
            try self.wrappedStore.persist(item, completion: completion)
        }
        
    }
    
    
    public func delete(_ item: PersistableType) throws {
        if let item = item as? WrappedStoreType {
            try self.wrappedStore.delete(item)
        }
    }
    
    public func delete(_ item: PersistableType, completion: @escaping () -> ()) throws {
        if let item = item as? WrappedStoreType {
            try self.wrappedStore.delete(item, completion: completion)
        }
    }
    
    public func delete(_ identifier: String, type: PersistableType.Type) throws {
        if let type = type.self as? WrappedStoreType.Type {
            try self.wrappedStore.delete(identifier, type: type)
        }else {
            throw PersistenceStoreError.CannotUseType(type: PersistableType.self, inStoreWithType: WrappedStoreType.self)
        }
    }
    
    public func delete(_ identifier: String, type: PersistableType.Type, completion: @escaping () -> ()) throws {
        if let type = type.self as? WrappedStoreType.Type {
            try self.wrappedStore.delete(identifier, type: type, completion: completion)
        }else {
            throw PersistenceStoreError.CannotUseType(type: PersistableType.self, inStoreWithType: WrappedStoreType.self)
        }
        
    }
    
    public func get(_ identifier: String) throws -> PersistableType? {
        if let type = PersistableType.self as? WrappedStoreType.Type{
            return try self.wrappedStore.get(identifier) as? PersistableType
        }else {
            throw PersistenceStoreError.CannotUseType(type: PersistableType.self, inStoreWithType: WrappedStoreType.self)
        }
    }
    
    public func get(_ identifier: String, completion: @escaping (_ item: PersistableType?) -> Void ) throws  {
        if let type = PersistableType.self as? WrappedStoreType.Type{
            try self.wrappedStore.get(identifier){ (item: WrappedStoreType?) in
                completion(item as! PersistableType)
            }
        }else {
            throw PersistenceStoreError.CannotUseType(type: PersistableType.self, inStoreWithType: WrappedStoreType.self)
        }
    }
    
    public func get(_ identifier: String, type: PersistableType.Type) throws -> PersistableType? {
        if let type = PersistableType.self as? WrappedStoreType.Type{
            return try self.wrappedStore.get(identifier, type: type) as? PersistableType
        }else {
            throw PersistenceStoreError.CannotUseType(type: PersistableType.self, inStoreWithType: WrappedStoreType.self)
        }
    }
    
    public func get(_ identifier: String, type: PersistableType.Type, completion: @escaping (_ item: PersistableType?) -> Void ) throws {
        if let type = PersistableType.self as? WrappedStoreType.Type{
            try self.wrappedStore.get(identifier, type: type) { (item: WrappedStoreType?) in
                completion(item as? PersistableType)
            }
        }else {
            throw PersistenceStoreError.CannotUseType(type: PersistableType.self, inStoreWithType: WrappedStoreType.self)
        }
    }
    
    public func getAll(_ type: PersistableType.Type) throws -> [PersistableType]  {
        if let type = PersistableType.self as? WrappedStoreType.Type{
            return try self.wrappedStore.getAll(type).map({ (item:WrappedStoreType) -> PersistableType in
                return item as! PersistableType
            })
        } else {
            throw PersistenceStoreError.CannotUseType(type: PersistableType.self, inStoreWithType: WrappedStoreType.self)
        }
    }
    
    public func getAll<PersistableType>(_ type: PersistableType.Type, completion: @escaping (_ items: [PersistableType]) -> Void) throws {
        
        if let type = PersistableType.self as? WrappedStoreType.Type {
            try self.wrappedStore.getAll(type) { (items: [WrappedStoreType]) in
                let convertedItems = items.map({ (item: WrappedStoreType) -> PersistableType in
                    return item as! PersistableType
                })
                completion(convertedItems)
            }
        } else {
            throw PersistenceStoreError.CannotUseType(type: PersistableType.self, inStoreWithType: WrappedStoreType.self)
        }
        
    }
    
    public func getAll<PersistableType>(_ viewName:String) throws ->[PersistableType]{
        
        if let type = PersistableType.self as? WrappedStoreType.Type {
            return try self.wrappedStore.getAll(viewName).map({ (item: WrappedStoreType) -> PersistableType in
                return item as! PersistableType
            })
        }else {
            throw PersistenceStoreError.CannotUseType(type: PersistableType.self, inStoreWithType: WrappedStoreType.self)
        }
    }
    
    public func getAll<PersistableType>(_ viewName:String, completion: @escaping (_ items: [PersistableType]) -> Void) throws {
        
        if let type = PersistableType.self as? WrappedStoreType.Type {
            try self.wrappedStore.getAll(viewName) { (items: [WrappedStoreType]) in
                let convertedItems = items.map({ (item: WrappedStoreType) -> PersistableType in
                    return item as! PersistableType
                })
                completion(convertedItems)
            }
        }else {
            throw PersistenceStoreError.CannotUseType(type: PersistableType.self, inStoreWithType: WrappedStoreType.self)
        }
        
    }
    
    public func getAll(_ viewName:String,groupName:String) throws ->[PersistableType] {
        if let type = PersistableType.self as? WrappedStoreType.Type {
            let items : [WrappedStoreType] = try self.wrappedStore.getAll(viewName,groupName:groupName)
            return items.map({ (item: WrappedStoreType) -> PersistableType in
                return item as! PersistableType
            })
        }else {
            throw PersistenceStoreError.CannotUseType(type: PersistableType.self, inStoreWithType: WrappedStoreType.self)
        }
    }
    
    public func getAll(_ viewName:String,groupName:String, completion: @escaping (_ items: [PersistableType]) -> Void) throws {
        if let type = PersistableType.self as? WrappedStoreType.Type {
            try self.wrappedStore.getAll(viewName, groupName: groupName) { (items : [WrappedStoreType]) in
                let convertedItems = items.map({ (item: WrappedStoreType) -> PersistableType in
                    return item as! PersistableType
                })
                completion(convertedItems)
            }
        } else {
            throw PersistenceStoreError.CannotUseType(type: PersistableType.self, inStoreWithType: WrappedStoreType.self)
        }
    }
    
    public func exists(_ item : Any!) throws -> Bool {
        return try self.wrappedStore.exists(item)
    }
    
    public func exists(_ item : Any!, completion: @escaping (_ exists: Bool) -> Void) throws {
        return try self.wrappedStore.exists(item, completion: completion)
    }
    
    public func exists(_ identifier : String,type : Any.Type) throws -> Bool {
        return try self.wrappedStore.exists(identifier,type: type)
    }
    
    public func exists(_ identifier : String,type : Any.Type,  completion: @escaping (_ exists: Bool) -> Void) throws{
        try self.wrappedStore.exists(identifier, type: type, completion: completion)
    }
    
    public func filter(_ type: PersistableType.Type, includeElement: @escaping (PersistableType) -> Bool) throws -> [PersistableType] {
        
        if let type = PersistableType.self as? WrappedStoreType.Type {
            
            let items : [WrappedStoreType] = try self.wrappedStore.filter(type, includeElement: { (item: WrappedStoreType) in
                return includeElement(item as! PersistableType)
            })
            
            return items.map({ (item: WrappedStoreType) -> PersistableType in
                return item as! PersistableType
            })
        } else {
            throw PersistenceStoreError.CannotUseType(type: PersistableType.self, inStoreWithType: WrappedStoreType.self)
        }
    }
    
    
    public func filter(_ type: PersistableType.Type, includeElement: @escaping (PersistableType) -> Bool, completion: @escaping (_ items: [PersistableType]) -> Void) throws {
        
        if let type = PersistableType.self as? WrappedStoreType.Type {
            try self.wrappedStore.filter(type, includeElement: { (item: WrappedStoreType) in
                return includeElement(item as! PersistableType)
            }){ (items: [WrappedStoreType]) in
                let convertedItems = items.map({ (item: WrappedStoreType) -> PersistableType in
                    return item as! PersistableType
                })
                completion(convertedItems)
            }
        }else {
            throw PersistenceStoreError.CannotUseType(type: PersistableType.self, inStoreWithType: WrappedStoreType.self)
        }
        
    }
    
    public func addView(_ viewName: String,
                        groupingBlock: @escaping ((_ collection: String,
                                                   _ key: String,
                                                   _ object: PersistableType) -> String?),
                        
                        sortingBlock: @escaping (( _ group: String,
                                                   _ collection1: String,
                                                   _ key1: String,
                                                   _ object1: PersistableType,
                                                   _ collection2: String,
                                                   _ key2: String,
                                                   _ object2: PersistableType) -> ComparisonResult)) throws {
        
        if let type = PersistableType.self as? WrappedStoreType.Type {
            try self.wrappedStore.addView(viewName, groupingBlock: { (collection: String, key: String, object: WrappedStoreType) -> String? in
                return groupingBlock(collection,key, object as! PersistableType)
            }, sortingBlock: { (group:String, collection1:String, key1:String, object1:WrappedStoreType, collection2: String, key2: String, object2: WrappedStoreType) -> ComparisonResult in
                return sortingBlock(group, collection1, key1, object1 as! PersistableType, collection2, key2, object2 as! PersistableType)
            })
        }else {
            throw PersistenceStoreError.CannotUseType(type: PersistableType.self, inStoreWithType: WrappedStoreType.self)
        }
        
        
    }

    
    

}
