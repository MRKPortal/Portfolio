//
//  ParallaxModifier.swift
//  Portfolio
//
//  Created by Marc Flores on 4/12/23.
//

import SwiftUI
import CoreMotion

private struct ParallaxModifier: ViewModifier {
    
    private let x: CGFloat
    private let y: CGFloat
    private let motionManager = CMMotionManager()
    
    @State var offset: CGSize = .zero
    
    init(x: CGFloat, y: CGFloat) {
        self.x = x
        self.y = y
    }
    
    func body(content: Content) -> some View {
        content
            .offset(offset)
            .onAppear {
                motionManager.deviceMotionUpdateInterval = 1/60
                motionManager.startDeviceMotionUpdates(to: .main) { data, error in
                    guard let data else {
                        return
                    }
                    
                    offset = .s(
                        data.gravity.x * x,
                        data.gravity.z * y
                    )
                }
            }
    }
}

// A View wrapper to make the modifier easier to use
extension View {
    func parallax(x: CGFloat = 0, y: CGFloat = 0) -> some View {
        self.modifier(ParallaxModifier(x: x, y: y))
    }
}
