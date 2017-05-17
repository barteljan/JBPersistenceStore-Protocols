
//
//  AnyTypedPersistenceStore.swift
//  Pods
//
//  Created by Jan Bartel on 09.05.17.
//
//

import Foundation

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
    
    func persist(_ item: PersistableType) throws {
        fatalError("override me")
    }
    
    func persist(_ item: PersistableType,completion: @escaping () -> ()) throws {
        fatalError("override me")
    }
    
    
    func delete(_ item: PersistableType) throws {
        fatalError("override me")
    }
    
    func delete(_ item: PersistableType, completion: @escaping () -> ()) throws {
        fatalError("override me")
    }
    
    func delete(_ identifier: String, type: PersistableType.Type) throws {
        fatalError("override me")
    }
    
    func delete(_ identifier: String, type: PersistableType.Type, completion: @escaping () -> ()) throws {
        fatalError("override me")
    }
    
    func get(_ identifier: String) throws -> PersistableType? {
        fatalError("override me")
    }
    
    func get(_ identifier: String, completion: @escaping (_ item: PersistableType?) -> Void ) throws  {
        fatalError("override me")
    }
    
    func get(_ identifier: String, type: PersistableType.Type) throws -> PersistableType? {
        fatalError("override me")
    }
    
    func get(_ identifier: String, type: PersistableType.Type, completion: @escaping (_ item: PersistableType?) -> Void ) throws {
        fatalError("override me")
    }
    
    func getAll(_ type: PersistableType.Type) throws -> [PersistableType]  {
        fatalError("override me")
    }
    
    func getAll(_ type: PersistableType.Type, completion: @escaping (_ items: [PersistableType]) -> Void) throws {
        fatalError("override me")
    }
    
    func getAll(_ viewName:String) throws ->[PersistableType]{
        fatalError("override me")
    }
    
    func getAll(_ viewName:String, completion: @escaping (_ items: [PersistableType]) -> Void) throws {
        fatalError("override me")
    }
    
    func getAll(_ viewName:String,groupName:String) throws ->[PersistableType] {
        fatalError("override me")
    }
    
    func getAll(_ viewName:String,groupName:String, completion: @escaping (_ items: [PersistableType]) -> Void) throws {
        fatalError("override me")
    }
    
    func exists(_ item : Any!) throws -> Bool {
        fatalError("override me")
    }
    
    func exists(_ item : Any!, completion: @escaping (_ exists: Bool) -> Void) throws{
        fatalError("override me")
    }
    
    func exists(_ identifier : String,type : Any.Type) throws -> Bool {
        fatalError("override me")
    }
    
    func exists(_ identifier : String,type : Any.Type,  completion: @escaping (_ exists: Bool) -> Void) throws{
        fatalError("override me")
    }
    
    func filter(_ type: PersistableType.Type, includeElement: @escaping (PersistableType) -> Bool) throws -> [PersistableType] {
        fatalError("override me")
    }
    
    
    func filter(_ type: PersistableType.Type, includeElement: @escaping (PersistableType) -> Bool, completion: @escaping (_ items: [PersistableType]) -> Void) throws {
        fatalError("override me")
    }
    
    func addView(_ viewName: String,
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
        fatalError("override me")
    }
    
}

final class _AnyTypedPersistenceStoreBox<Base: TypedPersistenceStoreProtocol>: _AnyTypedPersistenceStoreBase<Base.PersistableType> {
    
    var base: Base
    
    init(_ base: Base) { self.base = base }
    
    func isResponsible(for object: Any) -> Bool{
        return self.base.isResponsible(for: object)
    }
    
    func isResponsible(forType type: Any.Type) -> Bool{
        return self.base.isResponsible(forType: type)
    }
    
    override func version() -> Int {
        return self.base.version()
    }
    
    override func persist(_ item: Base.PersistableType) throws {
        try self.base.persist(item)
    }
    
    override func persist(_ item: Base.PersistableType,completion: @escaping () -> ()) throws {
        try self.base.persist(item, completion: completion)
    }
    
    
    override func delete(_ item: Base.PersistableType) throws {
        try self.base.delete(item)
    }
    
    override func delete(_ item: Base.PersistableType, completion: @escaping () -> ()) throws {
        try self.base.delete(item, completion: completion)
    }
    
    override func delete(_ identifier: String, type: Base.PersistableType.Type) throws {
        try self.base.delete(identifier, type: type)
    }
    
    override func delete(_ identifier: String, type: Base.PersistableType.Type, completion: @escaping () -> ()) throws {
        try self.base.delete(identifier, type: type, completion: completion)
    }
    
    /*
    override func get(_ identifier: String) throws -> Base.PersistableType? {
        return try self.base.get(identifier)
    }
    
    override func get(_ identifier: String, completion: @escaping (_ item: Base.PersistableType?) -> Void ) throws  {
        try self.base.get(identifier,completion: completion)
    }
    */
    override func get(_ identifier: String, type: Base.PersistableType.Type) throws -> Base.PersistableType? {
        return try self.base.get(identifier, type: type)
    }
    
    override func get(_ identifier: String, type: Base.PersistableType.Type, completion: @escaping (_ item: Base.PersistableType?) -> Void ) throws {
        try self.base.get(identifier, type: type, completion: completion)
    }
    
    override func getAll(_ type: Base.PersistableType.Type) throws -> [Base.PersistableType]  {
        return try self.base.getAll(type)
    }
    
    override func getAll(_ type: Base.PersistableType.Type, completion: @escaping (_ items: [Base.PersistableType]) -> Void) throws {
        try self.base.getAll(type, completion: completion)
    }
    
    override func getAll(_ viewName:String) throws ->[Base.PersistableType]{
        return try self.base.getAll(viewName)
    }
    
    override func getAll(_ viewName:String, completion: @escaping (_ items: [Base.PersistableType]) -> Void) throws {
        try self.base.getAll(viewName, completion: completion)
    }
    
    override func getAll(_ viewName:String,groupName:String) throws ->[Base.PersistableType] {
        return try self.getAll(viewName,groupName:groupName)
    }
    
    override func getAll(_ viewName:String,groupName:String, completion: @escaping (_ items: [Base.PersistableType]) -> Void) throws {
        try getAll(viewName, groupName: groupName, completion: completion)
    }
    
    override func exists(_ item : Any!) throws -> Bool {
        return try self.base.exists(item)
    }
    
    override func exists(_ item : Any!, completion: @escaping (_ exists: Bool) -> Void) throws {
        return try self.base.exists(item, completion: completion)
    }
    
    override func exists(_ identifier : String,type : Any.Type) throws -> Bool {
        return try self.base.exists(identifier,type: type)
    }
    
    override func exists(_ identifier : String,type : Any.Type,  completion: @escaping (_ exists: Bool) -> Void) throws{
        try self.base.exists(identifier, type: type, completion: completion)
    }
    
    override func filter(_ type: Base.PersistableType.Type, includeElement: @escaping (Base.PersistableType) -> Bool) throws -> [Base.PersistableType] {
        return try self.base.filter(type, includeElement: includeElement)
    }
    
    
    override func filter(_ type: Base.PersistableType.Type, includeElement: @escaping (Base.PersistableType) -> Bool, completion: @escaping (_ items: [Base.PersistableType]) -> Void) throws {
        try self.base.filter(type, includeElement: includeElement, completion: completion)
    }
    
    override func addView(_ viewName: String,
                          groupingBlock: @escaping ((_ collection: String,
                                                            _ key: String,
                                                         _ object: Base.PersistableType)->String?),
                          
                          sortingBlock: @escaping ((     _ group: String,
                                                   _ collection1: String,
                                                          _ key1: String,
                                                       _ object1: Base.PersistableType,
                                                   _ collection2: String,
                                                          _ key2: String,
                                                       _ object2: Base.PersistableType) -> ComparisonResult)) throws {
        try self.base.addView(viewName, groupingBlock: groupingBlock, sortingBlock: sortingBlock)
    }
    
}



open class AnyTypedPersistenceStore<PersistedType> : TypedPersistenceStoreProtocol{
    
    private let box: _AnyTypedPersistenceStoreBase<PersistedType>
    
    public typealias PersistableType = PersistedType
    
    public init<Base: TypedPersistenceStoreProtocol>(_ base: Base) where Base.PersistableType == PersistedType {
        box = _AnyTypedPersistenceStoreBox(base)
    }
    
    public func isResponsible(for object: Any) -> Bool{
        return self.box.isResponsible(for: object)
    }
    
    public func isResponsible(forType type: Any.Type) -> Bool{
        return self.box.isResponsible(forType: type)
    }
    
    public func version() -> Int {
        return self.box.version()
    }
    
    public func persist(_ item: PersistableType) throws {
        try self.box.persist(item)
    }
    
    public func persist(_ item: PersistableType,completion: @escaping () -> ()) throws {
        try self.box.persist(item, completion: completion)
    }
    
    
    public func delete(_ item: PersistableType) throws {
        try self.box.delete(item)
    }
    
    public func delete(_ item: PersistableType, completion: @escaping () -> ()) throws {
        try self.box.delete(item, completion: completion)
    }
    
    public func delete(_ identifier: String, type: PersistableType.Type) throws {
        try self.box.delete(identifier, type: type)
    }
    
    public func delete(_ identifier: String, type: PersistableType.Type, completion: @escaping () -> ()) throws {
        try self.box.delete(identifier, type: type, completion: completion)
    }
    
    public func get(_ identifier: String) throws -> PersistableType? {
        return try self.box.get(identifier)
    }
    
    public func get(_ identifier: String, completion: @escaping (_ item: PersistableType?) -> Void ) throws  {
        try self.box.get(identifier,completion: completion)
    }
    
    public func get(_ identifier: String, type: PersistableType.Type) throws -> PersistableType? {
        return try self.box.get(identifier, type: type)
    }
    
    public func get(_ identifier: String, type: PersistableType.Type, completion: @escaping (_ item: PersistableType?) -> Void ) throws {
        try self.box.get(identifier, type: type, completion: completion)
    }
    
    public func getAll(_ type: PersistableType.Type) throws -> [PersistableType]  {
        return try self.box.getAll(type)
    }
    
    public func getAll(_ type: PersistableType.Type, completion: @escaping (_ items: [PersistableType]) -> Void) throws {
        try self.box.getAll(type, completion: completion)
    }
    
    public func getAll(_ viewName:String) throws ->[PersistableType]{
        return try self.box.getAll(viewName)
    }
    
    public func getAll(_ viewName:String, completion: @escaping (_ items: [PersistableType]) -> Void) throws {
        try self.box.getAll(viewName, completion: completion)
    }
    
    public func getAll(_ viewName:String,groupName:String) throws ->[PersistableType] {
        return try self.getAll(viewName,groupName:groupName)
    }
    
    public func getAll(_ viewName:String,groupName:String, completion: @escaping (_ items: [PersistableType]) -> Void) throws {
        try getAll(viewName, groupName: groupName, completion: completion)
    }
    
    public func exists(_ item : Any!) throws -> Bool {
        return try self.box.exists(item)
    }
    
    public func exists(_ item : Any!, completion: @escaping (_ exists: Bool) -> Void) throws {
        return try self.box.exists(item, completion: completion)
    }
    
    public func exists(_ identifier : String,type : Any.Type) throws -> Bool {
        return try self.box.exists(identifier,type: type)
    }
    
    public func exists(_ identifier : String,type : Any.Type,  completion: @escaping (_ exists: Bool) -> Void) throws{
        try self.box.exists(identifier, type: type, completion: completion)
    }
    
    public func filter(_ type: PersistableType.Type, includeElement: @escaping (PersistableType) -> Bool) throws -> [PersistableType] {
        return try self.box.filter(type, includeElement: includeElement)
    }
    
    
    public func filter(_ type: PersistableType.Type, includeElement: @escaping (PersistableType) -> Bool, completion: @escaping (_ items: [PersistableType]) -> Void) throws {
        try self.box.filter(type, includeElement: includeElement, completion: completion)
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
        try self.box.addView(viewName, groupingBlock: groupingBlock, sortingBlock: sortingBlock)
    }
    
}
