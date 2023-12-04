//
//  NavigationWrapperView.swift
//  Portfolio
//
//  Created by Marc Flores on 19/11/23.
//

import SwiftUI

struct NavigationWrapperView: View {
    
    @ObservedObject private var navCoordinator: NavigationCoordinator
    
    @State var path: [Factory] = []
    
    init(coordinator: NavigationCoordinator) {
        self.navCoordinator = coordinator
    }
    
    var body: some View {
        ZStack {
            Color.base2
                .edgesIgnoringSafeArea(.all)
            ZStack {
                ForEach(path) { scene in
                    scene.build()
                        .zIndex(CGFloat(path.count))
                        .transition(.move(edge: .bottom))
                }
            }
        }.onChange(of: navCoordinator.path) { path in
            withAnimation {
                self.path = path
            }
        }
    }
}
