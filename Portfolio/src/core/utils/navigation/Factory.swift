//
//  Factory.swift
//  Portfolio
//
//  Created by Marc Flores on 19/11/23.
//

import SwiftUI

class Factory: Hashable, Identifiable {
    let coordinator: NavigationCoordinator
    let injector: ServicesInjectorProtocol
    
    init(coordinator: NavigationCoordinator, injector: ServicesInjectorProtocol) {
        self.coordinator = coordinator
        self.injector = injector
    }
    
    let id: String = UUID().uuidString
    
    static func == (lhs: Factory, rhs: Factory) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    func build() -> AnyView {
        //OVERRIDE
        fatalError()
    }
}
