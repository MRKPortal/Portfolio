//Generated by MRKPortal Yggdrasil

import Foundation

final class SkillsSceneRouter: GenericRouterProtocol {

    private let injector: ServicesInjectorProtocol
    private let coordinator: NavigationCoordinator

    init(_ injector: ServicesInjectorProtocol, coordinator: NavigationCoordinator) {
        self.injector = injector
        self.coordinator = coordinator
    }

    func pop() {
        coordinator.pop()
    }
    
    func displayNext() {
        coordinator.pushView(
            factory: ClientsSceneFactory(coordinator: coordinator, injector: injector),                 
            direction: .left
        )
    }
}

