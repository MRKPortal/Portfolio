//Generated by MRKTrace Yggdrasil

import SwiftUI

final class ContactSceneFactory: Factory {
    private lazy var router = ContactSceneRouter(injector, coordinator: coordinator)
    private lazy var interactor = ContactSceneInteractor(injector)
    private lazy var presenter = ContactScenePresenter(interactor, router: router)
    
    override func build() -> AnyView {
        AnyView(ContactSceneView(presenter))
    }
}
