//
//  ExplainerSceneView.swift
//  Portfolio
//
//  Created by Marc Flores on 26/12/23.
//

import SwiftUI

struct ExplainerSceneView<P: ExplainerScenePresenterProtocol>: View {
    
    private let presenter: P
    
    @State private var animate: Bool = false
    
    init(_ presenter: P) {
        self.presenter = presenter
    }
    
    var body: some View {
        GeometryReader { reader in
            ZStack {
                Color
                    .base2
                
                AvatarView()
                    .frame(size: .s(w: 100, h: 180))
            }
//            .offset(y: animate ? 0 : reader.size.height)
        }
        .gestureRouter {
            presenter.routing(direction: $0)
        }
        .onAppear {
            withAnimation(.bouncy.delay(1)) {
                animate.toggle()
            }
        }
    }
}
