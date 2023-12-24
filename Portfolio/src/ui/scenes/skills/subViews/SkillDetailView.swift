//
//  SkillDetailView.swift
//  Portfolio
//
//  Created by Marc Flores on 19/12/23.
//

import SwiftUI

struct SkillDetailView: View {
    @Binding var selection: SkillSelection?
    @State private var entry: Bool = false
    @State private var reference: CGPoint = .zero
    
    var body: some View {
        GeometryReader { reader in
            ZStack {
                Color
                    .black
                    .ignoresSafeArea()
                    .opacity(entry ? 0.3 : 0)
                
                if let skill = selection?.skill, let start = selection?.start {
                    VStack(spacing: 16) {
                        SkillCellView(skill)
                            .clipShape(NgonShape(points: 6))
                            .frame(size: .s(reader.size.width/2))
                            .scaleEffect(entry ? 1 : 2/3)
                        if entry {
                            VStack(spacing: 8) {
                                Text(skill.title)
                                    .applyTextStyle(.h4, tint: .base1)
                                Text(skill.description)
                                    .applyTextStyle(.body, tint: .base1)
                            }
                            .opacity(entry ? 1 : 0)
                            .scaleEffect(entry ? 1 : 0.8)
                            .onDisappear {
                                selection = nil
                            }
                        }
                    }
                    .padding(entry ? 32 : 0)
                    .background {
                        ZStack {
                            TimelineView(.animation) { context in
                                let degree = (context.date.timeIntervalSince1970 * 200)
                                    .truncatingRemainder(dividingBy: 360)
                                
                                AngularGradient(
                                    colors: borderColors,
                                    center: .center,
                                    angle: .degrees(degree)
                                )
                                .cornerRadius(8)
                            }
                            
                            Color
                                .base2
                                .cornerRadius(8)
                                .padding(3)
                        }
                        .opacity(entry ? 1: 0)
                    }
                    .padding(16)
                    .offset(entry ? .zero : start.toSize)
                    .onAppear {
                        withAnimation {
                            entry.toggle()
                        }
                    }
                    .dragDown(completed: $entry)
                }
            }
        }
    }
}

private extension SkillDetailView {
    var background: Color {
        if let color = selection?.skill.color {
            return Color(color)
        } else {
            return .base2
        }
    }
    var borderColors: [Color] {
        if let skill = selection?.skill {
            return [
                Color(skill.color), .clear, .clear, Color(skill.color)
            ]
        } else {
            return [.gray3, .clear, .clear, .gray3]
        }
    }
}
