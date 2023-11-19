//
//  NavigationCoordinator.swift
//  Portfolio
//
//  Created by Marc Flores on 19/11/23.
//

import Combine
import SwiftUI

final class NavigationCoordinator: ObservableObject {
    
    private let id = UUID().uuidString
    
    private let presentingCoordinator: NavigationCoordinator?
    
    @Published var path = NavigationPath()
    
    @Published var presentedFactory: Factory? = nil
    
    init(_ presentingCoordinator: NavigationCoordinator? = nil ) {
        self.presentingCoordinator = presentingCoordinator
    }
    
    //MARK: PRESENT
    func presentView(_ factory: Factory) {
        presentedFactory = factory
    }

    //MARK: PUSH

    func pushView(_ factory: Factory) {
        path.append(factory)
    }
    
    func pop() {
        guard path.count > 0 else {
            return
        }
        path.removeLast()
    }
}
