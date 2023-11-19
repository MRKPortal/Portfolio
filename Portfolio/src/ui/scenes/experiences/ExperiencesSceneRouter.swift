//Generated by MRKTrace Yggdrasil

import Foundation

protocol ExperiencesSceneRouterProtocol {

}

final class ExperiencesSceneRouter: ExperiencesSceneRouterProtocol {

    private let injector: ServicesInjectorProtocol
    private let coordinator: NavigationCoordinator

    init(_ injector: ServicesInjectorProtocol, coordinator: NavigationCoordinator) {
        self.injector = injector
        self.coordinator = coordinator
    }

}

