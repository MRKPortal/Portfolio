//
//  NavigationWrapperView.swift
//  Portfolio
//
//  Created by Marc Flores on 19/11/23.
//

import SwiftUI

struct NavigationWrapperView: View {
    
    @ObservedObject private var navCoordinator: NavigationCoordinator
    
    @State private var path: [NavigationNode] = []
    
    init(coordinator: NavigationCoordinator) {
        self.navCoordinator = coordinator
    }
    
    var body: some View {
        ZStack {
            Color.base2
                .edgesIgnoringSafeArea(.all)
            ZStack {
                ForEach(Array(path.enumerated()), id: \.offset) { offset, node in
                    node.factory.build()
                        .zIndex(CGFloat(offset))
                        .transition(node.direction.transition.combined(with: .opacity))
                        .didBecameTop(path.isLast(node))
                }
            }
        }.onChange(of: navCoordinator.path) { path in
            withAnimation {
                self.path = path
            }
        }
    }
}

private extension NavigationDirection {
    var transition: AnyTransition {
        switch self {
        case .down: .move(edge: .top)
        case .up: .move(edge: .bottom)
        case .left: .move(edge: .trailing)
        case .right: .move(edge: .leading)
        }
    }
}
