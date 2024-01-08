//
//  AboutSceneInteractor.swift
//  Portfolio
//
//  Created by Marc Flores on 26/12/23.
//

import Foundation

protocol AboutSceneInteractorProtocol {
    var explanations: [ExplanationType] { get }
}

final class AboutSceneInteractor: AboutSceneInteractorProtocol {
    let explanations: [ExplanationType] = [
        .titledText(Ls.aboutExplainer01, Ls.aboutExplainer02),
        .plainText(Ls.aboutExplainer03),
        .plainText(Ls.aboutExplainer04),
        .plainText(Ls.aboutExplainer05)
    ]
}
