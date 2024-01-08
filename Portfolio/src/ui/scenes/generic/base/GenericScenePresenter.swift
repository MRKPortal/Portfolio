//
//  GenericScenePresenter.swift
//  Portfolio
//
//  Created by Marc Flores on 24/12/23.
//

import Foundation

protocol GenericScenePresenterProtocol {
    func routing(direction: NavigationDirection)
}

final class GenericScenePresenter: GenericScenePresenterProtocol {
    
    private let router: GenericRouterProtocol
    
    init(_ router: GenericRouterProtocol) {
        self.router = router
    }
    
    //MARK: - GenericScenePresenterProtocol

    func routing(direction: NavigationDirection) {
        router.routing(direction: direction)
    }
}


