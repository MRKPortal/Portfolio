//Generated by MRKTrace Yggdrasil

import Foundation

protocol MainSceneRouterProtocol {
    func nextScene()
}

final class MainSceneRouter: MainSceneRouterProtocol {

    private let injector: ServicesInjectorProtocol
    private let coordinator: NavigationCoordinator

    init(_ injector: ServicesInjectorProtocol, coordinator: NavigationCoordinator) {
        self.injector = injector
        self.coordinator = coordinator
    }

    func nextScene() {
        coordinator.pushView(
            AboutSceneFactory(
                coordinator: coordinator, 
                injector: injector
            )
        )
    }
}
