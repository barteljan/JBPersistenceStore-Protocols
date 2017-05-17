//
//  PersistenceStoreServiceProviderProtocol.swift
//  Pods
//
//  Created by Jan Bartel on 16.05.17.
//
//

import Foundation

public protocol PersistenceServiceProviderProtocol : PersistenceServiceProtocol {

    func isResponsible(for object: Any) -> Bool
    func isResponsible(forType type: Any.Type) -> Bool
    
    func store<T>(forObject object: Any) throws -> AnyTypedPersistenceStore<T>
    func store<T>(forType object: Any.Type) throws -> AnyTypedPersistenceStore<T>
    
    func add(service: PersistenceServiceProtocol)
    
}
