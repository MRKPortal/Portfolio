//
//  ExplainerScenePresenter.swift
//  Portfolio
//
//  Created by Marc Flores on 26/12/23.
//

import Foundation

protocol ExplainerScenePresenterProtocol: ObservableObject {
    var directions: [NavigationDirection] { get }
    func didSwipe(_ direction: NavigationDirection)
}

final class ExplainerScenePresenter: ExplainerScenePresenterProtocol {

    init(_ interactor: ExplainerSceneInteractorProtocol, rotuer: GenericRouterProtocol) {
        
    }
    
    var directions: [NavigationDirection] {
        [.down]
    }
    
    func didSwipe(_ direction: NavigationDirection) {

    }
}
