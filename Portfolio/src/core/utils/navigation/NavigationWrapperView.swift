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
            Color.base2
                .edgesIgnoringSafeArea(.all)
            if let factory = path.last {
                factory.build()
                    .zIndex(Double(path.count))
                    .transition(
                        push ? .push(from: .bottom).combined(with: .opacity) :
                                .push(from: .top).combined(with: .opacity)
                    )
            }
        }.onChange(of: navCoordinator.path) { path in
            push = path.count > self.path.count
            withAnimation {
                self.path = path
            }
        }
    }
}
