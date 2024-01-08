//Generated by MRKPortal Yggdrasil

import Foundation

protocol ClientsScenePresenterProtocol: GenericScenePresenterProtocol {

}

final class ClientsScenePresenter: ClientsScenePresenterProtocol {

	private let interactor: ClientsSceneInteractorProtocol
	private let router: GenericRouterProtocol

	init(_ interactor: ClientsSceneInteractorProtocol, router: GenericRouterProtocol) {
		self.interactor = interactor
		self.router = router
	}

    func routing(direction: NavigationDirection) {
        router.routing(direction: direction)
    }
}

