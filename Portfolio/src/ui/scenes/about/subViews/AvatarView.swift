//
//  AvatarView.swift
//  Portfolio
//
//  Created by Marc Flores on 26/12/23.
//

import SwiftUI

struct AvatarView: View {

    @State private var animate: Bool = false
    
    private let shape = NgonShape(points: 4)
    
    var body: some View {
        ZStack {
            TimelineView(.animation) { context in
                let degree = (context.date.timeIntervalSince1970 * 200)
                    .truncatingRemainder(dividingBy: 360)
                AngularGradient(
                    colors: [.base1, .clear, .clear, .base1, .base1, .clear, .clear, .base1],
                    center: .center,
                    angle: .degrees(degree)
                )
            }
            
            Color
                .base2
                .clipShape(shape)
                .padding(8)
            
            Circle()
                .fill(Color.base1)
                .frame(size: .s(20))
                .offset(y: animate ? 0 : -20)
                .onAppear {
                    withAnimation(.bouncy.delay(1).repeatForever()) {
                        animate.toggle()
                    }
                }
        }
        .clipShape(shape)
        
    }
}
