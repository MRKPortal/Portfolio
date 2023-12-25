//Generated by MRKPortal Yggdrasil

import SwiftUI
import UIKit

struct MainSceneView<P: GenericScenePresenterProtocol>: View {
    private let presenter: P
    
    @State private var animate: Bool = false
    
    init(_ presenter: P) {
        self.presenter = presenter
    }
    
    var body: some View {
        ZStack {
            Color
                .base2
            VStack {
                Image
                    .logoFull
                    .resizable()
                    .scaledToFit()
                Text(Ls.appMoto)
                    .applyTextStyle(.h4)
                    .multilineTextAlignment(.center)
            }
            .padding(32)
            
            if animate {
                VStack {
                    Spacer()
                    Lotties.dragUp
                        .foregroundColor(.white)
                        .frame(height: 64)
                        .padding(.bottom, 16)
                        .rotationEffect(.degrees(180))
                }
                .transition(.push(from: .top))
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                withAnimation {
                    self.animate = true
                }
            }
        }
        .gestureRouter { _ in
            presenter.displayNext()
        }
    }
}
