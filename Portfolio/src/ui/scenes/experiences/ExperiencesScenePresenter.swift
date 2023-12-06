//Generated by MRKTrace Yggdrasil

import Foundation

protocol ExperiencesScenePresenterProtocol {
    func didTapBack()
}

final class ExperiencesScenePresenter: ExperiencesScenePresenterProtocol {

	private let interactor: ExperiencesSceneInteractorProtocol
	private let router: ExperiencesSceneRouterProtocol

	init(_ interactor: ExperiencesSceneInteractorProtocol, router: ExperiencesSceneRouterProtocol) {
		self.interactor = interactor
		self.router = router
	}

    func didTapBack() {
        router.pop()
    }
}

