//
//  CanBePersistedProtocol.swift
//  Pods
//
//  Created by Jan Bartel on 06.05.16.
//
//

import Foundation


public protocol CanBePersistedProtocol {
    static func collectionName() -> String
    func identifier()->String
}

