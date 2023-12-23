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
                    VStack(spacing: 32) {
                        SkillCellView(skill)
                            .clipShape(NgonShape(points: 6))
                            .frame(size: .s(reader.size.width/2))
                            .scaleEffect(entry ? 1 : 2/3)
                        if entry {
                            VStack(spacing: 8) {
                                Text(skill.title)
                                    .applyTextStyle(.h4, tint: .white)
                                Text(ipsum)
                                    .applyTextStyle(.body, tint: .white)
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
                        Color
                            .black
                            .cornerRadius(8)
                            .padding(1)
                            .background(
                                Color
                                    .white
                                    .cornerRadius(8)
                            )
                            .opacity(entry ? 0.5 : 0)
                    }
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


let ipsum = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
"""
