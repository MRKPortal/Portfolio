//
//  View+Navigation.swift
//  Portfolio
//
//  Created by Marc Flores on 6/12/23.
//

import SwiftUI

final class NavigationConfig: ObservableObject {
    let isTop: Bool
    
    init(isTop: Bool) {
        self.isTop = isTop
    }
}

extension View {
    @ViewBuilder
    func didBecameTop(_ bool: Bool) -> some View {
        environmentObject(
            NavigationConfig(isTop: bool)
        )
    }
}

