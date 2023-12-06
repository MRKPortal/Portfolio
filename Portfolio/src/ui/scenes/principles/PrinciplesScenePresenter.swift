//Generated by MRKTrace Yggdrasil

import Foundation

protocol PrinciplesScenePresenterProtocol {
    func didTapBack()
}

final class PrinciplesScenePresenter: PrinciplesScenePresenterProtocol {

	private let interactor: PrinciplesSceneInteractorProtocol
	private let router: PrinciplesSceneRouterProtocol

	init(_ interactor: PrinciplesSceneInteractorProtocol, router: PrinciplesSceneRouterProtocol) {
		self.interactor = interactor
		self.router = router
	}
    
    func didTapBack() {
        router.previousScene()
    }
}

