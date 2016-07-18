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
    
    
    func persist(item: CanBePersistedProtocol) -> CanBePersistedProtocol
    func persist(item: CanBePersistedProtocol,completion: ((persistedItem: CanBePersistedProtocol) -> Void)) -> Void
    
    /*
    func persist<
        T where
        T: CanBePersistedProtocol,
        T: NSCoding>(item: T) -> T
    
    func persist<
        T where
        T: CanBePersistedProtocol,
        T: NSCoding>(item: T, completion: ((persistedItem: T) -> Void)) -> Void
    
    
    func persist(item: protocol<CanBePersistedProtocol,NSCoding>) -> protocol<CanBePersistedProtocol,NSCoding>
    
    func persist(item: protocol<CanBePersistedProtocol,NSCoding> ,
           completion: ( persitedItem: protocol<CanBePersistedProtocol,NSCoding> ) -> (Void) ) -> (Void)
    
    func persist<
        T where
        T: CanBePersistedProtocol,
        T: ValueCoding,
        T.Coder: NSCoding,
        T.Coder.ValueType == T>(item: T) -> T
    
    func persist<
        T where
        T: CanBePersistedProtocol,
        T: ValueCoding,
        T.Coder: NSCoding,
        T.Coder.ValueType == T>(item: T, completion: ((persistedItem: T) -> Void)) -> Void
    */
    
    
    
    
    /*
    func delete<
        T where
        T: CanBePersistedProtocol,
        T: NSCoding>(identifier: String, type: T.Type)
    */
    
    func delete(item: CanBePersistedProtocol) -> CanBePersistedProtocol
    func delete(item: CanBePersistedProtocol,completion: ((persistedItem: CanBePersistedProtocol) -> Void)) -> CanBePersistedProtocol
    
 
    /*
    func get<
        T where
        T: CanBePersistedProtocol,
        T: NSCoding>(identifier: String) -> T?
 
    func get(identifier: String, type: CanBePersistedProtocol.Type) -> CanBePersistedProtocol?
 
 
    func get<
        T where
        T: CanBePersistedProtocol,
        T: ValueCoding,
        T.Coder: NSCoding,
        T.Coder.ValueType == T>(identifier: String) -> T?
    */
    
    
    func get<T where T: CanBePersistedProtocol>(identifier: String) -> T?
    func get(identifier: String, type: CanBePersistedProtocol.Type) -> CanBePersistedProtocol?
    func get<T where T: CanBePersistedProtocol>(identifier: String, completion: ((persistedItem: T?) -> Void)) -> Void
    
    /*
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
    */
    
    func exists(item : CanBePersistedProtocol) -> Bool
    func exists(item : CanBePersistedProtocol, completion: ((exists: Bool) -> Void)) -> Void
    
    
    
    func filter(type: CanBePersistedProtocol.Type, includeElement: (CanBePersistedProtocol) -> Bool) -> [CanBePersistedProtocol]
    func filter(type: CanBePersistedProtocol.Type, includeElement: (CanBePersistedProtocol) -> Bool, completion:(result: [CanBePersistedProtocol])) -> Void
    
    /*
    func filter <T where
        T: CanBePersistedProtocol,
        T: NSCoding>(type: T.Type, includeElement: (T) -> Bool) -> [T]
    
    
    func filter <T where
        T: CanBePersistedProtocol,
        T: ValueCoding,
        T.Coder: NSCoding,
        T.Coder.ValueType == T>(type: T.Type, includeElement: (T) -> Bool) -> [T]
    */
   
    
    func addView<T where
                 T: CanBePersistedProtocol>
                 (          viewName: String,
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


    func addView(     viewName: String,
                 groupingBlock:((collection: String,
                                        key: String,
                                     object: CanBePersistedProtocol)->String?),
                 
                sortingBlock:  ((      group: String,
                                 collection1: String,
                                        key1: String,
                                     object1: CanBePersistedProtocol,
                                 collection2: String,
                                        key2: String,
                                     object2: CanBePersistedProtocol) -> NSComparisonResult))


    
    
    
    
    /*
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
 */
 
 
    /*
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
    
    
    */
    
    func getAll(type: CanBePersistedProtocol.Type) -> [CanBePersistedProtocol]
    func getAll(type: CanBePersistedProtocol.Type, completion: (result: [CanBePersistedProtocol]?) -> Void ) -> Void
    
    func getAll<T where T: CanBePersistedProtocol>() -> [T]
    func getAll<T where T: CanBePersistedProtocol>(completion: (result: [T]?) -> Void) -> Void
    
    

    /*
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
    
    */
    
    
    func getAll(viewName:String)->[CanBePersistedProtocol]
    func getAll(viewName:String, result: ([CanBePersistedProtocol]?) -> Void ) -> Void
    
    func getAll< T where T: CanBePersistedProtocol>(viewName:String)->[T]
    func getAll< T where T: CanBePersistedProtocol>(viewName:String, completion: (result: [T]?) -> Void) -> Void
    

    
    /*
    func getAll< T where
        T: CanBePersistedProtocol,
        T: NSCoding>(viewName:String,groupName:String)->[T]
    */
    
    func getAll(viewName:String,groupName:String)->[CanBePersistedProtocol]
    func getAll(viewName:String,groupName:String, result: ([CanBePersistedProtocol]?) -> Void ) -> Void
    
    
    func getAll< T where T: CanBePersistedProtocol>(viewName:String,groupName:String)->[T]
    func getAll< T where T: CanBePersistedProtocol>(viewName:String, completion: (result: [T]?) -> Void) -> Void
    
}