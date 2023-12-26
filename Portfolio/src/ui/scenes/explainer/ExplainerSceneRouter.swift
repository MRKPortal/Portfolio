//
//  ExplainerSceneRouter.swift
//  Portfolio
//
//  Created by Marc Flores on 26/12/23.
//

import Foundation

final class ExplainerSceneRouter<F: Factory>: GenericRouter {
    override func nextFactory(injector: ServicesInjectorProtocol, coordinator: NavigationCoordinator) -> Factory {
        F.init(coordinator: coordinator, injector: injector)
    }
}
