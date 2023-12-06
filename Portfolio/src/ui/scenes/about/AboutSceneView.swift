//Generated by MRKTrace Yggdrasil

import SwiftUI

struct AboutSceneView<P: AboutScenePresenterProtocol>: View {

    private let presenter: P

    init(_ presenter: P) {
        self.presenter = presenter
    }

    var body: some View {
        ZStack {
            Color
                .base2
            Text("Rmember kids!\n Quality over quantity")
                .parallax(x: 100, y: 100)

            Color
                .red
                .frame(width: 100, height: 100)
                .clipShape(
                    Circle()
                )
                .parallax(x: -100, y: -160)
            Color
                .blue
                .frame(width: 100, height: 100)
                .clipShape(
                    Circle()
                )
                .parallax(x: -150, y: -180)
            Color
                .green
                .frame(width: 100, height: 100)
                .clipShape(
                    Circle()
                )
                .parallax(x: -200, y: -200)
            
            
            Color
                .red
                .frame(width: 100, height: 100)
                .clipShape(
                    Circle()
                )
                .parallax(x: 100, y: -160)
            Color
                .blue
                .frame(width: 100, height: 100)
                .clipShape(
                    Circle()
                )
                .parallax(x: 150, y: -180)
            Color
                .green
                .frame(width: 100, height: 100)
                .clipShape(
                    Circle()
                )
                .parallax(x: 200, y: -200)
        }
        .gestureRouter(directions: [.up, .down]) { direction in
            switch direction {
            case .down:
                presenter.didTapBack()
            default:
                presenter.didTapNext()
            }
        }
    }
}
