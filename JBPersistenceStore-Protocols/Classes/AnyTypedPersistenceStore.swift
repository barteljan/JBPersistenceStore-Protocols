
//
//  AnyTypedPersistenceStore.swift
//  Pods
//
//  Created by Jan Bartel on 09.05.17.
//
//

import Foundation
import VISPER_Entity

class _AnyTypedPersistenceStoreBase<PersistedType> : TypedPersistenceStoreProtocol{
    
    typealias PersistableType = PersistedType
    
    init() {
        guard type(of: self) != _AnyTypedPersistenceStoreBase.self else {
            fatalError("_AnyTypedPersistenceStoreBase<PersistedType> instances can not be created; create a subclass instance instead")
        }
    }
    
    func version() -> Int {
        fatalError("override me")
    }
    
    func persist<T>(_ item: T!) throws {
        fatalError("override me")
    }
    
    func persist<T>(_ item: T!,completion: @escaping () -> ()) throws {
        fatalError("override me")
    }
    
    
    func delete<T>(_ item: T!) throws {
        fatalError("override me")
    }
    
    func delete<T>(_ item: T!, completion: @escaping () -> ()) throws {
        fatalError("override me")
    }
    
    func get<T>(_ identifier: String) throws -> T? {
        fatalError("override me")
    }
    
    func get<T>(_ identifier: String, completion: @escaping (_ item: T?) -> Void ) throws  {
        fatalError("override me")
    }
    
    func getAll<T>(_ type: T.Type) throws -> [T]  {
        fatalError("override me")
    }
    
    func getAll<T>(_ type: T.Type, completion: @escaping (_ items: [T]) -> Void) throws {
        fatalError("override me")
    }
    
    func getAll<T>(_ viewName:String) throws ->[T]{
        fatalError("override me")
    }
    
    func getAll<T>(_ viewName:String, completion: @escaping (_ items: [T]) -> Void) throws {
        fatalError("override me")
    }
    
    func getAll<T>(_ viewName:String,groupName:String) throws ->[T] {
        fatalError("override me")
    }
    
    func getAll<T>(_ viewName:String,groupName:String, completion: @escaping (_ items: [T]) -> Void) throws {
        fatalError("override me")
    }
    
    func exists<T>(_ item : T!) throws -> Bool {
        fatalError("override me")
    }
    
    func exists<T>(_ item : T!, completion: @escaping (_ exists: Bool) -> Void) throws{
        fatalError("override me")
    }
    
    func exists<T>(_ identifier : String,type : T.Type) throws -> Bool {
        fatalError("override me")
    }
    
    func exists<T>(_ identifier : String,type : T.Type,  completion: @escaping (_ exists: Bool) -> Void) throws{
        fatalError("override me")
    }
    
    func filter<T>(_ type: T.Type, includeElement: @escaping (T) -> Bool) throws -> [T] {
        fatalError("override me")
    }
    
    
    func filter<T>(_ type: T.Type, includeElement: @escaping (T) -> Bool, completion: @escaping (_ items: [T]) -> Void) throws {
        fatalError("override me")
    }
    
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
        _ object2: T) -> ComparisonResult)) throws {
        fatalError("override me")
    }
    
    func transaction(transaction: @escaping (_ transactionStore: EntityStore) throws -> Void) throws {
        fatalError("override me")
    }
    
}

final class _AnyTypedPersistenceStoreBox<Base: TypedPersistenceStoreProtocol>: _AnyTypedPersistenceStoreBase<Base.PersistableType> {
    
    var base: Base
    
    init(_ base: Base) { self.base = base }
    
    func isResponsible<T>(for object: T) -> Bool{
        return self.base.isResponsible(for: object)
    }
    
    func isResponsible<T>(forType type: T.Type) -> Bool{
        return self.base.isResponsible(forType: type)
    }
    
    override func version() -> Int {
        return self.base.version()
    }
    
    override func persist<T>(_ item: T!) throws {
        try self.base.persist(item)
    }
    
    override func persist<T>(_ item: T!,completion: @escaping () -> ()) throws {
        try self.base.persist(item, completion: completion)
    }
    
    
    override func delete<T>(_ item: T!) throws {
        try self.base.delete(item)
    }
    
    override func delete<T>(_ item: T!, completion: @escaping () -> ()) throws {
        try self.base.delete(item, completion: completion)
    }
    
    override func get<T>(_ identifier: String) throws -> T? {
        return try self.base.get(identifier)
    }
    
    override func get<T>(_ identifier: String, completion: @escaping (_ item: T?) -> Void ) throws  {
        try self.base.get(identifier,completion: completion)
    }
    
    override func getAll<T>(_ type: T.Type) throws -> [T]  {
        return try self.base.getAll(type)
    }
    
    override func getAll<T>(_ type: T.Type, completion: @escaping (_ items: [T]) -> Void) throws {
        try self.base.getAll(type, completion: completion)
    }
    
    override func getAll<T>(_ viewName:String) throws ->[T]{
        return try self.base.getAll(viewName)
    }
    
    override func getAll<T>(_ viewName:String, completion: @escaping (_ items: [T]) -> Void) throws {
        try self.base.getAll(viewName, completion: completion)
    }
    
    override func getAll<T>(_ viewName:String,groupName:String) throws ->[T] {
        return try self.base.getAll(viewName,groupName:groupName)
    }
    
    override func getAll<T>(_ viewName:String,groupName:String, completion: @escaping (_ items: [T]) -> Void) throws {
        try self.base.getAll(viewName, groupName: groupName, completion: completion)
    }
    
    override func exists<T>(_ item : T!) throws -> Bool {
        return try self.base.exists(item)
    }
    
    override func exists<T>(_ item : T!, completion: @escaping (_ exists: Bool) -> Void) throws {
        return try self.base.exists(item, completion: completion)
    }
    
    
    override func exists<T>(_ identifier : String,type : T.Type) throws -> Bool {
        return try self.base.exists(identifier,type: type)
    }
    
    override func exists<T>(_ identifier : String,type : T.Type,  completion: @escaping (_ exists: Bool) -> Void) throws{
        try self.base.exists(identifier, type: type, completion: completion)
    }
    
    override func filter<T>(_ type: T.Type, includeElement: @escaping (T) -> Bool) throws -> [T] {
        return try self.base.filter(type, includeElement: includeElement)
    }
    
    
    override func filter<T>(_ type: T.Type, includeElement: @escaping (T) -> Bool, completion: @escaping (_ items: [T]) -> Void) throws {
        try self.base.filter(type, includeElement: includeElement, completion: completion)
    }
    
    override func addView<T>(_ viewName: String,
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
        try self.base.addView(viewName, groupingBlock: groupingBlock, sortingBlock: sortingBlock)
    }
    
    
    override func transaction(transaction: @escaping (_ transactionStore: EntityStore) throws -> Void) throws {
        try self.base.transaction(transaction: transaction)
    }
    
}



open class AnyTypedPersistenceStore<PersistedType>: TypedPersistenceStoreProtocol{
    
    private let box: _AnyTypedPersistenceStoreBase<PersistedType>
    
    public typealias PersistableType = PersistedType
    
    public init<Base: TypedPersistenceStoreProtocol>(_ base: Base) where Base.PersistableType == PersistedType {
        box = _AnyTypedPersistenceStoreBox(base)
    }
    
    public func isResponsible<T>(for object: T) -> Bool{
        return self.box.isResponsible(for: object)
    }
    
    public func isResponsible<T>(forType type: T.Type) -> Bool{
        return self.box.isResponsible(forType: type)
    }
    
    public func version() -> Int {
        return self.box.version()
    }
    
    public func persist<T>(_ item: T!) throws {
        try self.box.persist(item)
    }
    
    public func persist<T>(_ item: T!,completion: @escaping () -> ()) throws {
        try self.box.persist(item, completion: completion)
    }
    
    
    public func delete<T>(_ item: T!) throws {
        try self.box.delete(item)
    }
    
    public func delete<T>(_ item: T!, completion: @escaping () -> ()) throws {
        try self.box.delete(item, completion: completion)
    }
    
    public func get<T>(_ identifier: String) throws -> T? {
        return try self.box.get(identifier)
    }
    
    public func get<T>(_ identifier: String, completion: @escaping (_ item: T?) -> Void ) throws  {
        try self.box.get(identifier,completion: completion)
    }
    
    public func getAll<T>(_ type: T.Type) throws -> [T]  {
        return try self.box.getAll(type)
    }
    
    public func getAll<T>(_ type: T.Type, completion: @escaping (_ items: [T]) -> Void) throws {
        try self.box.getAll(type, completion: completion)
    }
    
    public func getAll<T>(_ viewName:String) throws ->[T]{
        return try self.box.getAll(viewName)
    }
    
    public func getAll<T>(_ viewName:String, completion: @escaping (_ items: [T]) -> Void) throws {
        try self.box.getAll(viewName, completion: completion)
    }
    
    public func getAll<T>(_ viewName:String,groupName:String) throws ->[T] {
        return try self.box.getAll(viewName,groupName:groupName)
    }
    
    public func getAll<T>(_ viewName:String,groupName:String, completion: @escaping (_ items: [T]) -> Void) throws {
        try self.box.getAll(viewName, groupName: groupName, completion: completion)
    }
    
    public func exists<T>(_ item : T!) throws -> Bool {
        return try self.box.exists(item)
    }
    
    public func exists<T>(_ item : T!, completion: @escaping (_ exists: Bool) -> Void) throws {
        return try self.box.exists(item, completion: completion)
    }
    
    public func exists<T>(_ identifier : String,type : T.Type) throws -> Bool {
        return try self.box.exists(identifier,type: type)
    }
    
    public func exists<T>(_ identifier : String,type : T.Type,  completion: @escaping (_ exists: Bool) -> Void) throws{
        try self.box.exists(identifier, type: type, completion: completion)
    }
    
    public func filter<T>(_ type: T.Type, includeElement: @escaping (T) -> Bool) throws -> [T] {
        return try self.box.filter(type, includeElement: includeElement)
    }
    
    public func filter<T>(_ type: T.Type, includeElement: @escaping (T) -> Bool, completion: @escaping (_ items: [T]) -> Void) throws {
        try self.box.filter(type, includeElement: includeElement, completion: completion)
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
        try self.box.addView(viewName, groupingBlock: groupingBlock, sortingBlock: sortingBlock)
    }
    
    public func transaction(transaction: @escaping (_ transactionStore: EntityStore) throws -> Void) throws {
        try self.box.transaction(transaction: transaction)
    }
    
}
