//
//  NavigationCoordinator.swift
//  Portfolio
//
//  Created by Marc Flores on 19/11/23.
//

import Combine
import SwiftUI

final class NavigationCoordinator: ObservableObject {

    @Published var path: [Factory] = []

    //MARK: PUSH

    func pushView(_ factory: Factory) {
        path.append(
            factory
        )
    }
    
    func pop() {
        guard path.count > 1 else {
            return
        }

        path.removeLast()
    }
}
