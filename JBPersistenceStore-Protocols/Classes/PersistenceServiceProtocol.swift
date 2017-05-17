//
//  PersistenceServiceProtocol.swift
//  Pods
//
//  Created by Jan Bartel on 16.05.17.
//
//

import Foundation

public protocol PersistenceServiceProtocol{

     func isResponsible(forType type: Any.Type) -> Bool
     func store<T>(forType object: Any.Type) throws -> AnyTypedPersistenceStore<T>
    
}
