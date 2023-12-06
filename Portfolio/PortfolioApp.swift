//
//  PortfolioApp.swift
//  Portfolio
//
//  Created by Marc Flores on 19/11/23.
//

import SwiftUI

@main
struct PortfolioApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

private struct ContentView: View {
    private let injector = ServicesInjector()
    private var navCoordinator = NavigationCoordinator()
    
    var body: some View {
        NavigationWrapperView(coordinator: navCoordinator)
            .onAppear {
                navCoordinator.pushView(
                    factory: MainSceneFactory(coordinator: navCoordinator, injector: injector),
                    direction: .up
                )
            }
    }
}
