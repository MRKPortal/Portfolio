//
//  GetSkillsResponse.swift
//  Portfolio
//
//  Created by Marc Flores on 19/12/23.
//

import Foundation

struct GetSkillsResponse: Decodable {
    let results: [SkillEntity]
}
