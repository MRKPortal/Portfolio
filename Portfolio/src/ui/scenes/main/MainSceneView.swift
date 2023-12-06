//Generated by MRKTrace Yggdrasil

import SwiftUI
import UIKit

struct MainSceneView<P: MainScenePresenterProtocol>: View {
    private let presenter: P
    private let generator = UINotificationFeedbackGenerator()

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
                    .applyTextStyle(.h4())
            }
            .padding(32)
            
            VStack {
                Spacer()
                Lotties.dragUp
                    .foregroundColor(.white)
                    .frame(height: 64)
                    .padding(.bottom, 16)
            }   
        }
        .gestureRouter { _ in
            generator.notificationOccurred(.success)
            presenter.didSwipe()
        }
    }
}
