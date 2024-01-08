//
//  GestureRouterModifier.swift
//  Portfolio
//
//  Created by Marc Flores on 4/12/23.
//

import SwiftUI

enum NavigationDirection {
    case down
    case up
}

private struct GestureRouterModifier: ViewModifier {
    @State private var offset: CGSize = .zero
    
    private let generator = UIImpactFeedbackGenerator(style: .light)
    
    let routingCallback: DirectionCallback
    let speedThreshold: CGFloat
    let directions: [NavigationDirection]
    
    func body(content: Content) -> some View {
        GeometryReader { reader in
            content
                .offset(offset)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            withAnimation(.spring) {
                                if let direction = directions.first(where: { $0.satisfiesUpdate(gesture) }) {
                                    offset = direction.calculateOffset(gesture)
                                }
                            }
                        }
                        .onEnded { gesture in
                            withAnimation(.spring(duration: 0.5)) {
                                if let direction = directions.first(where: { $0.satisfiesEnd(gesture, reader.size, speedThreshold) }) {
                                    routingCallback(direction)
                                    generator.impactOccurred()
                                    offset = direction.finalOffset(reader.size)
                                } else {
                                    offset = .zero
                                }
                            } completion: {
                                offset = .zero
                            }
                        }
                )
        }
    }
}

extension NavigationDirection {
    func satisfiesUpdate(_ gesture: DragGesture.Value) -> Bool {
        switch self {
        case .down: gesture.translation.height > 0 && gesture.translation.isHeightBigger
        case .up: gesture.translation.height < 0 && gesture.translation.isHeightBigger
        }
    }
    
    func satisfiesEnd(_ gesture: DragGesture.Value, _ screenSize: CGSize, _ speedThreshold: CGFloat) -> Bool {
        switch self {
        case .up: -gesture.translation.height > screenSize.height/4 || -gesture.velocity.height > speedThreshold
        case .down: gesture.translation.height > screenSize.height/4 || gesture.velocity.height > speedThreshold
        }
    }
    
    func calculateOffset(_ gesture: DragGesture.Value) -> CGSize {
        switch self {
        case .down, .up:
                .s(h: gesture.translation.height)
        }
    }
    
    func finalOffset(_ screenSize: CGSize) -> CGSize {
        switch self {
        case .down: .s(h: screenSize.height)
        case .up: .s(h: -screenSize.height)
        }
    }
}

extension View {
    func gestureRouter(
        directions: [NavigationDirection] = [.up, .down],
        speedThreshold: CGFloat = 1000,
        routingCallback: @escaping DirectionCallback)-> some View {
            self.modifier(
                GestureRouterModifier(
                    routingCallback: routingCallback,
                    speedThreshold: speedThreshold,
                    directions: directions
                )
            )
        }
}
