//Generated by MRKPortal Yggdrasil

import Foundation

protocol ContactScenePresenterProtocol {

}

final class ContactScenePresenter: ContactScenePresenterProtocol {

	private let interactor: ContactSceneInteractorProtocol
	private let router: ContactSceneRouterProtocol

	init(_ interactor: ContactSceneInteractorProtocol, router: ContactSceneRouterProtocol) {
		self.interactor = interactor
		self.router = router
	}

}

