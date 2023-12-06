//
//  IdentifiableEquatable.swift
//  Portfolio
//
//  Created by Marc Flores on 6/12/23.
//

import Foundation

public protocol IdentifiableEquatable: Identifiable, Equatable {
    var id: String { get }
}

public extension IdentifiableEquatable {
    var id: String {
        String(describing: self)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}
