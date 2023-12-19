//
//  SkillCellView.swift
//  Portfolio
//
//  Created by Marc Flores on 19/12/23.
//

import SwiftUI

struct SkillCellView: View {
    
    private let skill: SkillEntity?
    
    init(_ skill: SkillEntity?) {
        self.skill = skill
    }
    
    var body: some View {
        Group {
            if let skill {
                ZStack {
                    Color.red
                    Image(skill.icon)
                        .resizable()
                        .foregroundColor(.white)
                        .scaledToFit()
                        .padding(32)
                }
                
            } else {
                Color.black
            }
        }
        .clipShape(NgonShape(points: 6))
    }
}
