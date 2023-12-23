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
                ZStack {
                    TimelineView(.animation) { context in
                        let degree = (context.date.timeIntervalSince1970 * 370)
                            .truncatingRemainder(dividingBy: 360)

                        AngularGradient(
                            colors: borderColors,
                            center: .center,
                            angle: .degrees(degree)
                        )
                    }

                    Color
                        .base2
                        .clipShape(NgonShape(points: 6))
                        .padding(6)
                    
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
        .clipShape(NgonShape(points: 6))
    }
}

private extension SkillCellView {
    var background: Color {
        if let color = skill?.color {
            return Color(color)
        } else {
            return .base2
        }
    }
    var borderColors: [Color] {
        if let skill {
            return [
                Color(skill.color), .base1, .base1, Color(skill.color)
            ]
        } else {
            return [.gray3, .base1,  .base1, .gray3]
        }
    }
}
