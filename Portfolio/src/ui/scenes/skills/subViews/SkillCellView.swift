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
        GeometryReader { reader in
            Group {
                if let skill {
                    ZStack {
                        Color.red
                        Image(skill.icon)
                            .resizable()
                            .foregroundColor(.white)
                            .scaledToFit()
                            .frame(size: .s(reader.size.width/2))
                    }
                    
                } else {
                    Color.black
                }
            }
            .clipShape(NgonShape(points: 6))
        }
    }
}
