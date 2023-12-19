//
//  SkillEntity.swift
//  Portfolio
//
//  Created by Marc Flores on 19/12/23.
//

import Foundation

struct SkillEntity: Codable {
    let title: String
    let icon: String
    let description: String
}

extension SkillEntity: IdentifiableEquatable {
    var id: String {
        title
    }
}
