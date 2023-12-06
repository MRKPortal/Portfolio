//Generated by MRKTrace Yggdrasil

import SwiftUI

struct ExperiencesSceneView<P: ExperiencesScenePresenterProtocol>: View {

    private let presenter: P
    
    init(_ presenter: P) {
        self.presenter = presenter
    }
    
    var body: some View {
        ZStack {
            Color
                .base2
            Text("RIGHT")
                .applyTextStyle(.h2())
        }
        .gestureRouter(directions: [.right]) { _ in
            presenter.didTapBack()
        }
    }
}
