//
//  ExplainerSceneView.swift
//  Portfolio
//
//  Created by Marc Flores on 26/12/23.
//

import SwiftUI

struct ExplainerSceneView<P: ExplainerScenePresenterProtocol>: View {
    
    @ObservedObject private var presenter: P
    
    init(_ presenter: P) {
        self.presenter = presenter
    }
    
    var body: some View {
        ZStack {
            Color
                .base2
            Text("Welcome to MRKPortal!")
                .applyTextStyle(.h2)
        }
        .gestureRouter(directions: presenter.directions) { direction in
            presenter.didSwipe(direction)
        }
    }
}
