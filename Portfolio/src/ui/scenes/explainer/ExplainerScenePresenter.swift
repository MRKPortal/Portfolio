//
//  ExplainerScenePresenter.swift
//  Portfolio
//
//  Created by Marc Flores on 26/12/23.
//

import Foundation

protocol ExplainerScenePresenterProtocol: GenericScenePresenterProtocol {
}

final class ExplainerScenePresenter: ExplainerScenePresenterProtocol {

    private let router: GenericRouterProtocol
    
    init(_ interactor: ExplainerSceneInteractorProtocol, rotuer: GenericRouterProtocol) {
        self.router = rotuer
    }
    
    //MARK: - GenericScenePresenterProtocol
    
    func routing(direction: NavigationDirection) {
        router.routing(direction: direction)
    }
    
}
