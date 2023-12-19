//
//  DetailedContentView.swift
//  Portfolio
//
//  Created by Marc Flores on 8/12/23.
//

import SwiftUI

struct DetailedContentView: View {
    
    @State private var entry: Bool = false
    @State private var dismiss: Bool = true
    
    var body: some View {
        GeometryReader { reader in
            VStack(spacing: 32) {
                Color.red
                    .clipShape(NgonShape(points: 6))
                    .frame(size: .s(reader.size.width / 2))
                VStack(spacing: 8) {
                    Text("VIPER")
                        .applyTextStyle(.h4, tint: .white)
                    Text(ipsum)
                        .applyTextStyle(.body, tint: .white)
                }
                .opacity(entry ? 1 : 0)
                .scaleEffect(entry ? 1 : 0.8)
                .animation(.spring.delay(0.25), value: entry)
            }
            .padding(32)
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
                    .opacity(entry ? 1 : 0)
                    .animation(.linear.delay(0.25), value: entry)
                    .scaleEffect(entry ? 1 : 0.8)
                    .animation(.bouncy(duration: 0.5, extraBounce: 0.5).delay(0.25), value: entry)
                    .opacity(dismiss ? 0 : 1)
                    .animation(.linear(duration: 0.1), value: dismiss)
            }
        }
        .onAppear {
            entry.toggle()
        }
        .onDisappear {
            dismiss.toggle()
        }
    }
}


let ipsum = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
"""
