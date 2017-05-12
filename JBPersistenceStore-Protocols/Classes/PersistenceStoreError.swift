//
//  PersistenceStoreError.swift
//  Pods
//
//  Created by ATINO CI USER on 11.05.17.
//
//

import Foundation

public enum PersistenceStoreError : Error {
    case CannotUse(object : Any, inStoreWithType: Any.Type)
    case CannotUseType(type : Any.Type, inStoreWithType: Any.Type)
    case MethodHasToBeImplemented
}
