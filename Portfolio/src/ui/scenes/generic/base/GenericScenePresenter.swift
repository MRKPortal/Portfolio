//
//  GenericScenePresenter.swift
//  Portfolio
//
//  Created by Marc Flores on 24/12/23.
//

import Foundation

protocol GenericScenePresenterProtocol {
    func displayNext()
    func pop()
}

extension GenericScenePresenterProtocol {
    func displayNext() { }
    func pop() { }
}

final class GenericScenePresenter: GenericScenePresenterProtocol {
    
    private let router: GenericRouterProtocol
    
    init(_ router: GenericRouterProtocol) {
        self.router = router
    }
    
    //MARK: - GenericScenePresenterProtocol

    func displayNext() {
        router.displayNext()
    }
    
    func pop() {
        router.pop()
    }
}


