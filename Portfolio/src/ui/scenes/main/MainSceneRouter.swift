//Generated by MRKPortal Yggdrasil

import Foundation

final class MainSceneRouter: GenericRouterProtocol {
    
    private let injector: ServicesInjectorProtocol
    private let coordinator: NavigationCoordinator
    
    init(_ injector: ServicesInjectorProtocol, coordinator: NavigationCoordinator) {
        self.injector = injector
        self.coordinator = coordinator
    }
    
    func pop() { }
    
    func displayNext() {
        coordinator.pushView(
            AboutSceneFactory(
                coordinator: coordinator,
                injector: injector
            )
        )
    }
}
