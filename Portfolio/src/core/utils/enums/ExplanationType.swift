//
//  ExplanationType.swift
//  Portfolio
//
//  Created by Marc Flores on 26/12/23.
//

import Foundation

enum ExplanationType: IdentifiableEquatable {
    ///Simple text with default style
    case plainText(String)
    case titledText(String, String)
}
