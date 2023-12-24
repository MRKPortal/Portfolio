//
//  AnimatedBorderView.swift
//  Portfolio
//
//  Created by Marc Flores on 24/12/23.
//

import SwiftUI

struct AnimatedBorderView<S: Shape>: View {
    
    private let colorName: String?
    private let shape: S
    
    init(colorName: String?, shape: S) {
        self.colorName = colorName
        self.shape = shape
    }
    
    var body: some View {
        ZStack {
            TimelineView(.animation) { context in
                let degree = (context.date.timeIntervalSince1970 * 200)
                    .truncatingRemainder(dividingBy: 360)
                
                AngularGradient(
                    colors: borderColors,
                    center: .center,
                    angle: .degrees(degree)
                )
            }
            
            Color
                .base2
                .clipShape(shape)
                .padding(3)
        }
        .clipShape(shape)
    }
}

private extension AnimatedBorderView {
    var background: Color {
        if let colorName {
            return Color(colorName)
        } else {
            return .base2
        }
    }
    var borderColors: [Color] {
        if let colorName {
            let color = Color(colorName)
            return [color, .clear, .clear, color]
        } else {
            return [.gray3, .clear, .clear, .gray3]
        }
    }
}
