//
//  GestureRouterModifier.swift
//  Portfolio
//
//  Created by Marc Flores on 4/12/23.
//

import SwiftUI

enum GestureRouterDirection {
    case down
    case up
    case left
    case right
}

private struct GestureRouterModifier: ViewModifier {
    @EnvironmentObject private var navConfig: NavigationConfig

    @State private var offset: CGSize = .zero
    @State private var opacity: CGFloat = 1
    
    let routingCallback: DirectionCallback
    let speedThreshold: CGFloat
    let directions: [GestureRouterDirection]
    
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

extension GestureRouterDirection {
    func satisfiesUpdate(_ gesture: DragGesture.Value) -> Bool {
        switch self {
        case .down: gesture.translation.height > 0
        case .up: gesture.translation.height < 0
        case .left: gesture.translation.width > 0
        case .right: gesture.translation.width < 0
        }
    }

    func satisfiesEnd(_ gesture: DragGesture.Value, _ screenSize: CGSize, _ speedThreshold: CGFloat) -> Bool {
        switch self {
        case .up: -gesture.translation.height > screenSize.height/2 || -gesture.velocity.height > speedThreshold
        case .down: gesture.translation.height > screenSize.height/2 || gesture.velocity.height > speedThreshold
        case .left: false
        case .right: false
        }
    }
    
    func calculateOffset(_ gesture: DragGesture.Value) -> CGSize {
        switch self {
        case .down, .up: .s(0, gesture.translation.height)
        case .left, .right: .s(gesture.translation.width, 0)
        }
    }
    
    func calculateOpacity(_ gesture: DragGesture.Value, _ screenSize: CGSize) -> CGFloat {
        switch self {
        case .down: 1 + 2 * gesture.translation.height / screenSize.height
        case .up: 1
        case .left: 1
        case .right: 1
        }
    }
    
    func finalOffset(_ screenSize: CGSize) -> CGSize {
        switch self {
        case .down: .s(0, screenSize.height)
        case .up: .s(0, -screenSize.height)
        case .left: .zero
        case .right: .zero
        }
    }
}

extension View {
    func gestureRouter(
        directions: [GestureRouterDirection] = [.up],
        speedThreshold: CGFloat = 2000,
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
