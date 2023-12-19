//
//  NetworkWrapper.swift
//  Portfolio
//
//  Created by Marc Flores on 19/12/23.
//

import Alamofire
import Foundation

protocol NetworkWrapperProtocol {
    func request<D: Decodable>(_ request: BaseRequest) async throws -> D
    func requestSimple(_ request: BaseRequest) async throws
}

final class NetworkWrapper: NetworkWrapperProtocol {

    private lazy var decoder = NetworkDecoder()
    
    private lazy var session = Session(
        configuration: URLSessionConfiguration.af.default
    )
    
    func request<D>(_ request: BaseRequest) async throws -> D where D : Decodable {
        let urlRequest = try request.asURLRequest()
        return try await withCheckedThrowingContinuation { continuation in
            session.request(urlRequest)
                .validate()
                .responseDecodable(of: D.self, decoder: decoder) { response in
                    switch response.result {
                    case .success(let data):
                        continuation.resume(with: .success(data))
                        break
                    case .failure(let error):
                        continuation.resume(with: .failure(self.handleError(error, request: request)))
                        break
                    }
                }
        }
    }
    
    func requestSimple(_ request: BaseRequest) async throws {
        let urlRequest = try request.asURLRequest()
        return try await withCheckedThrowingContinuation { continuation in
            session.request(urlRequest)
                .validate()
                .response{ response in
                    switch response.result {
                    case .success:
                        continuation.resume()
                    case .failure(let error):
                        continuation.resume(with: .failure(self.handleError(error, request: request)))
                    }
                }
        }
    }
}

private extension NetworkWrapper {
    func handleError(_ error: AFError, request: BaseRequest) -> APIError {
        let code = error.responseCode ?? 0
        let method = request.method.rawValue.uppercased()
        return .statusError(code, method, request.path)
    }
}
