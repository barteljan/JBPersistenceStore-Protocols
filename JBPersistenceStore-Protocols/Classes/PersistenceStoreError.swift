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
    
    /*
    case CannotRetrieveValue(type: Any.Type,fromStoreWithType: Any.Type, valueWas: Any )
    case CannotRetrieve(type: Any.Type,fromStoreWithType: Any.Type)
    case CannotCheckForExistence(ofItem: Any, inStoreWithType: Any.Type)
    case CannotCheckForExistenceOfIdentifier(identifier: String, withType: Any.Type, inStoreWithType: Any.Type)
    case CannotCreateViewForValues(ofType: Any.Type, inStoreWithType: Any.Type)
    */
    case MethodHasToBeImplemented
}
