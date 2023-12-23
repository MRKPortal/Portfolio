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
    case left
    case right
}

private struct GestureRouterModifier: ViewModifier {
    @EnvironmentObject private var navConfig: NavigationConfig

    @State private var offset: CGSize = .zero
    @State private var opacity: CGFloat = 1

    private let generator = UIImpactFeedbackGenerator(style: .light)

    let routingCallback: DirectionCallback
    let speedThreshold: CGFloat
    let directions: [NavigationDirection]
    
    func body(content: Content) -> some View {
        GeometryReader { reader in
            content
                .opacity(opacity)
                .offset(offset)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            withAnimation(.spring) {
                                if let direction = directions.first(where: { $0.satisfiesUpdate(gesture) }) {
                                    offset = direction.calculateOffset(gesture)
                                    opacity = direction.calculateOpacity(gesture, reader.size)
                                }
                            }
                        }
                        .onEnded { gesture in
                            withAnimation(.bouncy) {
                                if let direction = directions.first(where: { $0.satisfiesEnd(gesture, reader.size, speedThreshold) }) {
                                    routingCallback(direction)
                                    generator.impactOccurred()
                                    offset = direction.finalOffset(reader.size)
                                    opacity = 0
                                } else {
                                    offset = .zero
                                    opacity = 1
                                }
                            }
                        }
                )
        }
        .onChange(of: navConfig.isTop) { value in
            guard value else { return }
            //RESET STATE
            withAnimation(.bouncy) {
                offset = .zero
                opacity = 1
            }
        }
    }
}

extension NavigationDirection {
    func satisfiesUpdate(_ gesture: DragGesture.Value) -> Bool {
        switch self {
        case .down: gesture.translation.height > 0 && gesture.translation.isHeightBigger
        case .up: gesture.translation.height < 0 && gesture.translation.isHeightBigger
        case .left: gesture.translation.width < 0 && gesture.translation.isWidthBigger
        case .right: gesture.translation.width > 0 && gesture.translation.isWidthBigger
        }
    }

    func satisfiesEnd(_ gesture: DragGesture.Value, _ screenSize: CGSize, _ speedThreshold: CGFloat) -> Bool {
        switch self {
        case .up: -gesture.translation.height > screenSize.height/4 || -gesture.velocity.height > speedThreshold
        case .down: gesture.translation.height > screenSize.height/4 || gesture.velocity.height > speedThreshold
        case .left: -gesture.translation.height > screenSize.height/4 || -gesture.velocity.width > speedThreshold
        case .right: gesture.translation.width > screenSize.width/4 || gesture.velocity.width > speedThreshold
        }
    }
    
    func calculateOffset(_ gesture: DragGesture.Value) -> CGSize {
        switch self {
        case .down, .up: .s(h: gesture.translation.height)
        case .left, .right: .s(w: gesture.translation.width)
        }
    }
    
    func calculateOpacity(_ gesture: DragGesture.Value, _ screenSize: CGSize) -> CGFloat {
        switch self {
        case .down: 1 - 2 * gesture.translation.height / screenSize.height
        case .up: 1 + 2 * gesture.translation.height / screenSize.height
        case .left: 1 + 2 * gesture.translation.width / screenSize.width
        case .right: 1 - 2 * gesture.translation.width / screenSize.width
        }
    }
    
    func finalOffset(_ screenSize: CGSize) -> CGSize {
        switch self {
        case .down: .s(h: screenSize.height)
        case .up: .s(h: -screenSize.height)
        case .left: .s(w: -screenSize.width)
        case .right: .s(w: screenSize.width)
        }
    }
}

extension View {
    func gestureRouter(
        directions: [NavigationDirection] = [.up],
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
