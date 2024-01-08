//
//  AboutSceneRouter.swift
//  Portfolio
//
//  Created by Marc Flores on 26/12/23.
//

import Foundation

final class AboutSceneRouter: GenericRouter {
    override func nextFactory(injector: ServicesInjectorProtocol, coordinator: NavigationCoordinator) -> Factory {
        SkillsSceneFactory(
            coordinator: coordinator,
            injector: injector
        )
    }
}
