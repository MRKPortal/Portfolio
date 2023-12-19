//
//  Date+Formatter.swift
//  Portfolio
//
//  Created by Marc Flores on 19/12/23.
//

import Foundation

extension DateFormatter {
    convenience init(format: String) {
        self.init()
        dateFormat = format
    }
    
    static func withFormat(_ format: String) -> DateFormatter {
        DateFormatter(format: format)
    }
}
