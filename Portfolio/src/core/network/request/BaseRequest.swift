//
//  BaseRequest.swift
//  Portfolio
//
//  Created by Marc Flores on 19/12/23.
//

import Alamofire
import Foundation

protocol BaseRequest: URLRequestConvertible {
    
    var path: String { get }
    var method: HTTPMethod { get }
    var header: [String: String]? { get }
    var parameters: [String: Any]? { get }
    
    var parameterEncoding: ParameterEncoding { get }
}

extension BaseRequest {
    var method: HTTPMethod { .get }
    var header: [String: String]? { nil }
    var parameters: [String: Any]? { nil }
    
    var parameterEncoding: ParameterEncoding {
        switch method {
        case .get: return URLEncoding.default
        default: return JSONEncoding.default
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        guard let url = URL(string: path) else {
            throw APIError.invalidURL(path)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = self.method.rawValue
        urlRequest.allHTTPHeaderFields = header
        return try parameterEncoding.encode(urlRequest, with: parameters)
    }
}
