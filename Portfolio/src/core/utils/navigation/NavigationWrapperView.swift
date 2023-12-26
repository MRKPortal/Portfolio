//
//  NavigationWrapperView.swift
//  Portfolio
//
//  Created by Marc Flores on 19/11/23.
//

import SwiftUI

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
                if let factory = path.last {
                    factory.build()
                        .transition(
                            .push(from: .bottom)
                        )
                }
            }
        }.onChange(of: navCoordinator.path) { path in
            withAnimation {
                self.path = path
            }
        }
    }
}
