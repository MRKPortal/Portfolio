//
//  AboutSceneFactory.swift
//  Portfolio
//
//  Created by Marc Flores on 26/12/23.
//

import SwiftUI

final class AboutSceneFactory: Factory {

    private lazy var presenter = AboutScenePresenter(interactor, rotuer: router)
    private lazy var interactor = AboutSceneInteractor()

    private lazy var router = AboutSceneRouter(
        injector: injector,
        coordinator: coordinator
    )
    
    override func build() -> AnyView {
        AnyView(AboutSceneView(presenter))
    }
}
