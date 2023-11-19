//Generated by MRKTrace Yggdrasil

import SwiftUI

final class AboutSceneFactory: Factory {
    private lazy var router = AboutSceneRouter(injector, coordinator: coordinator)
    private lazy var interactor = AboutSceneInteractor(injector)
    private lazy var presenter = AboutScenePresenter(interactor, router: router)
    
    override func build() -> AnyView {
        AnyView(AboutSceneView(presenter))
    }
}