//
//  ExplainerSceneInteractor.swift
//  Portfolio
//
//  Created by Marc Flores on 26/12/23.
//

import Foundation

protocol ExplainerSceneInteractorProtocol {
    var explanations: [ExplanationType] { get }
}

final class ExplainerSceneInteractor: ExplainerSceneInteractorProtocol {
    let explanations: [ExplanationType]
    
    init(_ explanations: [ExplanationType] ) {
        self.explanations = explanations
    }
}
