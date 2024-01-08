//
//  NavigationWrapperView.swift
//  Portfolio
//
//  Created by Marc Flores on 19/11/23.
//

import SwiftUI

struct NavigationWrapperView: View {
    
    @ObservedObject private var navCoordinator: NavigationCoordinator
    @State private var push: Bool = true
    @State private var path: [Factory] = []
    
    init(coordinator: NavigationCoordinator) {
        self.navCoordinator = coordinator
    }

    var body: some View {
        ZStack {
            GeometryReader { reader in
                Color.base2
                    .edgesIgnoringSafeArea(.all)
                ZStack {
                    ForEach(path) { factory in
                        factory.build()
                            .zIndex(path.last == factory ? 1 : 0)
                            .opacity(path.last == factory ? 1 : 0)
                            .offset(y: reader.size.height * (path.last == factory ? 0 : -1))
                            .transition(
                                .move(edge: .bottom)
                                .combined(with: .opacity)
                            )
                    }
                }
            }
        }.onChange(of: navCoordinator.path) { old, new in
            push = old.count < new.count
            withAnimation {
                self.path = new
            }
        }
    }
}

