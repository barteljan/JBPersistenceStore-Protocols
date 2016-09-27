//
//  PersistenceStoreProtocol.swift
//  Pods
//
//  Created by Jan Bartel on 06.05.16.
//
//

import Foundation

public protocol PersistenceStoreProtocol{
    
    
    
    func isResponsible(type: CanBePersistedProtocol.Type) -> Bool
    //func isResponsible<T where T: CanBePersistedProtocol>(type: T.Type) -> Bool
    
    // MARK: Persist persistable object
    func persist(item: CanBePersistedProtocol) -> CanBePersistedProtocol
    func persist(item: CanBePersistedProtocol,completion: ((CanBePersistedProtocol) -> Void)) -> Void
    
    // MARK: Delete persistable object
    func delete(item: CanBePersistedProtocol) -> CanBePersistedProtocol
    func delete(item: CanBePersistedProtocol,completion: ((CanBePersistedProtocol) -> Void)) -> CanBePersistedProtocol
    
    // MARK: Get specific persistable object
    func get<T where T: CanBePersistedProtocol>(identifier: String) -> T?
    func get(identifier: String, type: CanBePersistedProtocol.Type) -> CanBePersistedProtocol?
    func get<T where T: CanBePersistedProtocol>(identifier: String, completion: ((T?) -> Void)) -> Void
    
    // MARK: Check if specific object exists
    func exists(item : CanBePersistedProtocol) -> Bool
    func exists(item : CanBePersistedProtocol, completion: ((Bool) -> Void)) -> Void
    
    
    // MARK: Filter all elements of a specific type
    func filter(type: CanBePersistedProtocol.Type, includeElement: (CanBePersistedProtocol) -> Bool) -> [CanBePersistedProtocol]
    func filter(type: CanBePersistedProtocol.Type, includeElement: (CanBePersistedProtocol) -> Bool, completion:([CanBePersistedProtocol])) -> Void
    
    // MARK: Get all elements of a specific type
    func getAll<T where T: CanBePersistedProtocol>(type: T.Type) -> [T]
    func getAll<T where T: CanBePersistedProtocol>(type: T.Type, completion: ([T]?) -> Void ) -> Void
    func getAll<T where T: CanBePersistedProtocol>() -> [T]
    func getAll<T where T: CanBePersistedProtocol>(completion: ([T]?) -> Void) -> Void
    
    
    // MARK: Add a view (filtered collection) by grouping and sorting your data
    // groupingBlock(collection, key, object)
    // sortingBlock(group, collection1, key1, object 1, collection2, key2, object2)
    func addView<T where
                 T: CanBePersistedProtocol>
                 (          viewName: String,
                      groupingBlock:((String,
                                      String,
                                      T)->String?),

                      sortingBlock: ((String,
                                      String,
                                      String,
                                      T,
                                      String,
                                      String,
                                      T) -> NSComparisonResult))


    func addView(     viewName: String,
                 groupingBlock:((String,
                                 String,
                                 CanBePersistedProtocol)->String?),
                 
                sortingBlock:  ((String,
                                 String,
                                 String,
                                 CanBePersistedProtocol,
                                 String,
                                 String,
                                 CanBePersistedProtocol) -> NSComparisonResult))


    
    
    
    
    // MARK: Get all objects from a view
    func getAll(viewName:String)->[CanBePersistedProtocol]
    func getAll(viewName:String, result: ([CanBePersistedProtocol]?) -> Void ) -> Void
    
    func getAll< T where T: CanBePersistedProtocol>(viewName:String)->[T]
    func getAll< T where T: CanBePersistedProtocol>(viewName:String, completion: ([T]?) -> Void) -> Void
    
    func getAll(viewName:String,groupName:String)->[CanBePersistedProtocol]
    func getAll(viewName:String,groupName:String, result: ([CanBePersistedProtocol]?) -> Void ) -> Void
    
    
    func getAll< T where T: CanBePersistedProtocol>(viewName:String,groupName:String)->[T]
    
}
