//
//  GenericRouter.swift
//  Portfolio
//
//  Created by Marc Flores on 24/12/23.
//

import Foundation

protocol GenericRouterProtocol {
    func nextFactory(injector: ServicesInjectorProtocol, coordinator: NavigationCoordinator) -> Factory
    func routing(direction: NavigationDirection)
    func pop()
}

class GenericRouter: GenericRouterProtocol {
    
    private let injector: ServicesInjectorProtocol
    private let coordinator: NavigationCoordinator
    
    init(injector: ServicesInjectorProtocol, coordinator: NavigationCoordinator) {
        self.injector = injector
        self.coordinator = coordinator
    }
    
    //MARK: - GenericRouterProtocol
    
    func nextFactory(injector: ServicesInjectorProtocol, coordinator: NavigationCoordinator) -> Factory {
        //OVERRIDE
        fatalError()
    }
    
    final func routing(direction: NavigationDirection) {
        switch direction {
        case .down:
            pop()
        case .up:
            coordinator.pushView (
                nextFactory(
                    injector: injector,
                    coordinator: coordinator
                )
            )
        }
    }
    
    final func pop() {
        coordinator.pop()
    }
}
