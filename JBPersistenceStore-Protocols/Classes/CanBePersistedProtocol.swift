//
//  CanBePersistedProtocol.swift
//  Pods
//
//  Created by Jan Bartel on 06.05.16.
//
//

import Foundation


public protocol CanBePersistedProtocol : CanBeIdentifiedProtocol{
    static func collectionName() -> String
}

public extension CanBePersistedProtocol {
    static func ==(lhs:Self, rhs:Self) -> Bool {
        
        return (type(of:lhs).collectionName() == type(of:rhs).collectionName()) && lhs.identifier() == rhs.identifier()
        
    }
}
