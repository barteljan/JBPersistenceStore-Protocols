//
//  PersistenceStoreProtocol.swift
//  Pods
//
//  Created by Jan Bartel on 06.05.16.
//
//

import Foundation
import ValueCoding

public protocol PersistenceStoreProtocol{
    
    func persist<
        T where
        T: CanBePersistedProtocol,
        T: NSCoding>(item: T) -> T
    
    func persist(item: protocol<CanBePersistedProtocol,NSCoding>) -> protocol<CanBePersistedProtocol,NSCoding>
    
    func persist<
        T where
        T: CanBePersistedProtocol,
        T: ValueCoding,
        T.Coder: NSCoding,
        T.Coder.ValueType == T>(item: T) -> T
    
    func delete(identifier: String, type: CanBePersistedProtocol.Type)
    
    func delete(item: CanBePersistedProtocol) -> CanBePersistedProtocol
    
    func get<
        T where
        T: CanBePersistedProtocol,
        T: NSCoding>(identifier: String) -> T?
    
    func get<
        T where
        T: CanBePersistedProtocol,
        T: ValueCoding,
        T.Coder: NSCoding,
        T.Coder.ValueType == T>(identifier: String) -> T?
    
    
    func exists<T where
        T: CanBePersistedProtocol,
        T: NSCoding>(item : T) -> Bool
    
    
    func exists<T where
        T: CanBePersistedProtocol,
        T: ValueCoding,
        T.Coder: NSCoding,
        T.Coder.ValueType == T>(item: T) -> Bool
    
    
    func exists<T where
        T: CanBePersistedProtocol,
        T: NSCoding>(identifier : String,type : T.Type) -> Bool
    
    
    func exists<T where
        T: CanBePersistedProtocol,
        T: ValueCoding,
        T.Coder: NSCoding,
        T.Coder.ValueType == T>(identifier : String,type : T.Type) -> Bool
    
    
    func filter <T where
        T: CanBePersistedProtocol,
        T: NSCoding>(type: T.Type, includeElement: (T) -> Bool) -> [T]
    
    
    func filter <T where
        T: CanBePersistedProtocol,
        T: ValueCoding,
        T.Coder: NSCoding,
        T.Coder.ValueType == T>(type: T.Type, includeElement: (T) -> Bool) -> [T]
    
    
    func addView<T where
        T: CanBePersistedProtocol,
        T: NSCoding>
        (     viewName: String,
              groupingBlock:((collection: String,
        key: String,
        object: T)->String?),
              
              sortingBlock: ((     group: String,
        collection1: String,
        key1: String,
        object1: T,
        collection2: String,
        key2: String,
        object2: T) -> NSComparisonResult))
    
    func addView<T where
        T: CanBePersistedProtocol,
        T: ValueCoding,
        T.Coder: NSCoding,
        T.Coder.ValueType == T>
        (     viewName: String,
              groupingBlock:((collection: String,
        key: String,
        object: T)->String?),
              
              sortingBlock: ((     group: String,
        collection1: String,
        key1: String,
        object1: T,
        collection2: String,
        key2: String,
        object2: T) -> NSComparisonResult))
    
    func getAll<
        T where
        T: CanBePersistedProtocol,
        T: NSCoding>(type: T.Type) -> [T]
    
    func getAll<
        T where
        T: CanBePersistedProtocol,
        T: ValueCoding,
        T.Coder: NSCoding,
        T.Coder.ValueType == T>(type: T.Type) -> [T]
    
    
    func getAll< T where
        T: CanBePersistedProtocol,
        T: NSCoding>(viewName:String)->[T]
    
    
    func getAll< T where
        T: CanBePersistedProtocol,
        T: ValueCoding,
        T.Coder: NSCoding,
        T.Coder.ValueType == T>(viewName:String)->[T]
    
    
    func getAll< T where
        T: CanBePersistedProtocol,
        T: ValueCoding,
        T.Coder: NSCoding,
        T.Coder.ValueType == T>(viewName:String,groupName:String)->[T]
    
    
    func getAll< T where
        T: CanBePersistedProtocol,
        T: NSCoding>(viewName:String,groupName:String)->[T]
    
    
}