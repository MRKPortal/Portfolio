//
//  NavigationWrapperView.swift
//  Portfolio
//
//  Created by Marc Flores on 19/11/23.
//

import SwiftUI

struct NavigationWrapperView: View {
    
    @ObservedObject private var navCoordinator: NavigationCoordinator
    
    private let factory: Factory
    
    init(factory: Factory, coordinator: NavigationCoordinator) {
        self.factory = factory
        self.navCoordinator = coordinator
    }
    
    var body: some View {
        NavigationStack(path: $navCoordinator.path) {
            factory
                .build()
                .modifier(AppBackgroundModifier())
                .navigationDestination(for: Factory.self) { factory in
                    factory.build()
                        .modifier(AppBackgroundModifier())
                }
        }.fullScreenCover(item: $navCoordinator.presentedFactory) { factory in
            NavigationWrapperView(
                factory: factory,
                coordinator: factory.coordinator
            )
        }
    }
}

private struct AppBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            Color.base2
                .edgesIgnoringSafeArea(.all)
            content
                .navigationBarBackButtonHidden(true)
        }
    }
}
