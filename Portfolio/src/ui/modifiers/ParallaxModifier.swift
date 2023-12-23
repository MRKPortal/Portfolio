//
//  ParallaxModifier.swift
//  Portfolio
//
//  Created by Marc Flores on 4/12/23.
//

import SwiftUI
import CoreMotion

private class MotionManager: ObservableObject {
    
    static let shared = MotionManager()
    private let manager = CMMotionManager()
    @Published var offset: CGSize = .zero
    
    private init() {
        manager.deviceMotionUpdateInterval = 1 / 10
        manager.startDeviceMotionUpdates(to: .main) { data, error in
            guard let data else {
                return
            }
            withAnimation {
                self.offset = .s(w: data.gravity.x, h: data.gravity.y)
            }
        }
    }
    
}

private struct ParallaxModifier: ViewModifier {

    @ObservedObject private var motionManager = MotionManager.shared
    @State var offset: CGSize = .zero
    private let size: CGSize
    
    init(_ size: CGSize) {
        self.size = size
    }
    
    func body(content: Content) -> some View {
        content
            .offset(motionManager.offset * size)
    }
}

// A View wrapper to make the modifier easier to use
extension View {
    func parallax(x: CGFloat = 0, y: CGFloat = 0) -> some View {
        self.modifier(ParallaxModifier(.s(w: x,h: y)))
    }
}
