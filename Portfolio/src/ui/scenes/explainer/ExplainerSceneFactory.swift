//
//  ExplainerSceneFactory.swift
//  Portfolio
//
//  Created by Marc Flores on 26/12/23.
//

import SwiftUI
//
//final class ExplainerSceneFactory: Factory {
//    
//    private let interactor: ExplainerSceneInteractorProtocol
//    private let router: GenericRouterProtocol
//    private lazy var presenter = ExplainerScenePresenter(interactor, rotuer: router)
//    
//    init(router: GenericRouterProtocol, explanations: [ExplanationType]) {
//        self.interactor = ExplainerSceneInteractor(explanations)
//        self.router = router
//        super.init(coordinator: coordinator, injector: injector)
//    }
//
//    override func build() -> AnyView {
//        AnyView(ExplainerSceneView(presenter))
//    }
//}
//
//extension ExplainerSceneFactory {
//    static func about(coordinator: NavigationCoordinator, injector: ServicesInjectorProtocol) -> Self {
//        Self.init(
//            coordinator: coordinator,
//            injector: injector,
//            routerClass: ClientsSceneRouter.Type,
//            explanations: [
//                .titledText(Ls.aboutExplainer01, Ls.aboutExplainer02),
//                .plainText(Ls.aboutExplainer03),
//                .plainText(Ls.aboutExplainer04),
//                .plainText(Ls.aboutExplainer05)
//            ]
//        )
//    }
//}
