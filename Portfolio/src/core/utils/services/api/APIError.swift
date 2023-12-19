//
//  APIError.swift
//  Portfolio
//
//  Created by Marc Flores on 19/12/23.
//

import Foundation

enum APIError: LocalizedError {
    ///PATH
    case invalidURL(String)
    ///STATUS, METHOD, PATH
    case statusError(Int, String, String)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL(let urlString):
            "[API] the endpoint (\(urlString)) couldn't be turned into request"
        case .statusError(let code, let method, let urlString):
            "[API] [\(code)] \(method): " + urlString
        }
    }
}
