//
//  AboutSceneView.swift
//  Portfolio
//
//  Created by Marc Flores on 26/12/23.
//

import SwiftUI

struct AboutSceneView<P: AboutScenePresenterProtocol>: View {
    
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
                
                VStack {
                    Spacer()
                    Text(Ls.aboutExplainer01)
                        .applyTextStyle(.h1)
                        .multilineTextAlignment(.center)
                    Text(Ls.aboutExplainer02)
                        .applyTextStyle(.h2)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .padding(.vertical, 36)
                
                VStack {
                    Spacer() 
                    AvatarView()
                        .frame(size: .s(w: 100, h: 180))
                }
                .offset(y: animate ? 0 : -reader.size.height)
                .onAppear {
                    withAnimation(.bouncy.delay(1)) {
                        animate.toggle()
                    }
                }
            }
        }
        .gestureRouter {
            presenter.routing(direction: $0)
        }
    }
}
