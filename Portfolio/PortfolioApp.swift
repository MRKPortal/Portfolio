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
    private let navCoordinator = NavigationCoordinator()
    
    var body: some View {
        NavigationWrapperView(
            factory: MainSceneFactory(coordinator: navCoordinator, injector: injector),
            coordinator: navCoordinator
        )
    }
}
