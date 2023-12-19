//
//  APIServiceLocalMock.swift
//  Portfolio
//
//  Created by Marc Flores on 19/12/23.
//

import Foundation

final class APIServiceLocalMock: APIServiceProtocol {
    func getSkills() async throws -> GetSkillsResponse {
        let bundle = Bundle.main.url(forResource: "GetSkillsRequestMock", withExtension: ".json")!
        let data = try Data(contentsOf: bundle)
        return try JSONDecoder().decode(GetSkillsResponse.self, from: data)
    }
}
