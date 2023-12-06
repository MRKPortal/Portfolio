//
//  NavigationCoordinator.swift
//  Portfolio
//
//  Created by Marc Flores on 19/11/23.
//

import Combine
import SwiftUI

final class NavigationNode: IdentifiableEquatable {
    
    var id: String {
        factory.id
    }
    
    let factory: Factory
    let direction: NavigationDirection
    
    init(factory: Factory, direction: NavigationDirection) {
        self.factory = factory
        self.direction = direction
    }
}

final class NavigationCoordinator: ObservableObject {

    @Published var path: [NavigationNode] = []

    //MARK: PUSH

    func pushView(factory: Factory, direction: NavigationDirection) {
        path.append(
            NavigationNode(
                factory: factory,
                direction: direction
            )
        )
    }
    
    func pop() {
        guard path.count > 1 else {
            return
        }

        path.removeLast()
    }
}
