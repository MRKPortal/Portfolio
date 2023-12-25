//
//  IconButton.swift
//  Portfolio
//
//  Created by Marc Flores on 25/12/23.
//

import SwiftUI

struct IconButton: View {
    
    private let generator = UIImpactFeedbackGenerator(style: .light)

    let icon: Image
    let callback: VoidCallback?
    
    var body: some View {
        Button {
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(250)) {
                generator.impactOccurred()
                callback?()
            }
        } label: {
            icon
                .resizable()
                .foregroundColor(.base1)
                .scaledToFit()
        }
        .buttonStyle(BouncingButtonStyle())
    }
}

struct BouncingButtonStyle: ButtonStyle {
    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        GeometryReader { reader in
            configuration
                .label
                .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
                .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
        }
    }
}
