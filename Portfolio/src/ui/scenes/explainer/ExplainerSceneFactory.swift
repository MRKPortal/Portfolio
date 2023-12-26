//
//  ExplainerSceneFactory.swift
//  Portfolio
//
//  Created by Marc Flores on 26/12/23.
//

import SwiftUI

final class AboutSceneFactory: Factory {

    private lazy var presenter = ExplainerScenePresenter(interactor, rotuer: router)
    
    private lazy var interactor = ExplainerSceneInteractor([
        .titledText(Ls.aboutExplainer01, Ls.aboutExplainer02),
        .plainText(Ls.aboutExplainer03),
        .plainText(Ls.aboutExplainer04),
        .plainText(Ls.aboutExplainer05)
    ])

    private lazy var router = ExplainerSceneRouter<SkillsSceneFactory>(
        injector: injector,
        coordinator: coordinator
    )
    
    override func build() -> AnyView {
        AnyView(ExplainerSceneView(presenter))
    }
}
