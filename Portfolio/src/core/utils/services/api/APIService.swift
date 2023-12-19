//
//  APIService.swift
//  Portfolio
//
//  Created by Marc Flores on 19/12/23.
//

import Foundation

protocol APIServiceProtocol {
    func getSkills() async throws -> GetSkillsResponse
}

final class APIService: APIServiceProtocol {
    
    private let wrapper: NetworkWrapperProtocol
    
    init(_ wrapper: NetworkWrapperProtocol) {
        self.wrapper = wrapper
    }
    
    func getSkills() async throws -> GetSkillsResponse {
        try await wrapper.request(GetSkillsRequest())
    }
}
