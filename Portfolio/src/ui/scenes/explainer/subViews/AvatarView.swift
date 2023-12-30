//
//  AvatarView.swift
//  Portfolio
//
//  Created by Marc Flores on 26/12/23.
//

import SwiftUI

struct AvatarView: View {
    
    @State private var degrees: Double = 0
    @State private var animate: Bool = false
    
    private let shape = NgonShape(points: 4)
    
    var body: some View {
        ZStack {
            AngularGradient(
                colors: [.base1, .clear, .clear, .base1, .base1, .clear, .clear, .base1],
                center: .center,
                angle: .degrees(degrees)
            )
            
            Color
                .base2
                .clipShape(shape)
                .padding(8)
            
            Circle()
                .fill(Color.base1)
                .frame(size: .s(20))
                .offset(x: animate ? 20 : -20)
        }
        .clipShape(shape)
        .onAppear {
            withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                degrees = 360
            }
            
            withAnimation(.bouncy.delay(1).repeatForever()) {
                animate.toggle()
            }
        }
    }
}
