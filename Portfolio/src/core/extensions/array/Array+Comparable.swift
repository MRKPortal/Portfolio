//
//  Array+Comparable.swift
//  Portfolio
//
//  Created by Marc Flores on 6/12/23.
//

import Foundation

extension Array where Element: Equatable {
    func isLast(_ element: Element) -> Bool {
        return last == element
    }

    func isFirst(_ element: Element) -> Bool {
        return first == element
    }
}
