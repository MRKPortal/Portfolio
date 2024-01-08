//
//  AboutScenePresenter.swift
//  Portfolio
//
//  Created by Marc Flores on 26/12/23.
//

import Foundation

protocol AboutScenePresenterProtocol: GenericScenePresenterProtocol {
}

final class AboutScenePresenter: AboutScenePresenterProtocol {

    private let router: GenericRouterProtocol
    
    init(_ interactor: AboutSceneInteractorProtocol, rotuer: GenericRouterProtocol) {
        self.router = rotuer
    }
    
    //MARK: - GenericScenePresenterProtocol
    
    func routing(direction: NavigationDirection) {
        router.routing(direction: direction)
    }
    
}
