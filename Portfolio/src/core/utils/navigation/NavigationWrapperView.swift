//
//  NavigationWrapperView.swift
//  Portfolio
//
//  Created by Marc Flores on 19/11/23.
//

import SwiftUI

enum NavigationType: String, RawRepresentable {
    case push, pop
}

struct NavigationWrapperView: View {
    
    @ObservedObject private var navCoordinator: NavigationCoordinator
    
    @State private var path: [Factory] = []
    
    init(coordinator: NavigationCoordinator) {
        self.navCoordinator = coordinator
    }
    
    var body: some View {
        ZStack {
            Color.base2
                .edgesIgnoringSafeArea(.all)
            ZStack {
                ForEach(Array(path.enumerated()), id: \.offset) { offset, scene in
                    scene.build()
                        .zIndex(CGFloat(offset))
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .didBecameTop(path.isLast(scene))
                }
            }
        }.onChange(of: navCoordinator.path) { path in
            withAnimation {
                self.path = path
            }
        }
    }
}
