//
//  Array+Secure.swift
//  Portfolio
//
//  Created by Marc Flores on 19/12/23.
//

import Foundation

extension Array {
    subscript(secured index: Int?) -> Element? {
        guard let index, index > -1 && index < count else {
            return nil
        }
        return self[index]
    }
}
