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
            ZStack {
                AnimatedBorderView(
                    colorName: skill?.color,
                    shape: NgonShape(points: 6)
                )

                if let skill {
                    Image(skill.icon)
                        .resizable()
                        .foregroundColor(Color(skill.color))
                        .scaledToFit()
                        .frame(size: .s(reader.size.width/2.3))
                }
            }
        }
    }
}
