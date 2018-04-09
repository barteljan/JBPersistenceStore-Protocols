//
//  CanBeIdentifiedProtocol.swift
//  Pods
//
//  Created by Jan Bartel on 06.05.16.
//
//

import Foundation
import VISPER_Entity

public protocol CanBeIdentifiedProtocol: CanBeIdentified {
    func identifier()->String
}
