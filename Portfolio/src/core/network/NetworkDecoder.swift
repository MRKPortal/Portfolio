//
//  NetworkDecoder.swift
//  Portfolio
//
//  Created by Marc Flores on 19/12/23.
//

import Foundation

final class NetworkDecoder: JSONDecoder {
    override init() {
        super.init()
        dateDecodingStrategy = .millisecondsSince1970
    }
}
