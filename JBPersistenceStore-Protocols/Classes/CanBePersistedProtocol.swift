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

