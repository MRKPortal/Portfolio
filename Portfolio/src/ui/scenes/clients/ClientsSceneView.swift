//Generated by MRKPortal Yggdrasil

import SwiftUI

struct ClientsSceneView<P: ClientsScenePresenterProtocol>: View {
    
    private let presenter: P
    private let clients = [Image.clientsProton, .clientsEthermail, .clientsTilt]
    @State private var degree: CGFloat = 0
    
    init(_ presenter: P) {
        self.presenter = presenter
    }
    
    var body: some View {
        ZStack {
            Color
                .base2
            ForEach(0..<clients.count, id: \.self) { id in
                let percent = Double(id)/3
                let radius = Double(100)
                VStack {
                    clients[id]
                        .resizable()
                        .frame(size: .s(100))
                        .cornerRadius(16)
                    Text("Company")
                        .applyTextStyle(.h4, tint: .base0)
                }
                .rotationEffect(.degrees(degree))
                .offset(.angle(.degrees(360 * percent)) * radius)
                .rotationEffect(.degrees(-degree))
            }
        }
        .onAppear {
            withAnimation(.linear(duration: 7).repeatForever(autoreverses: false)) {
                degree = 360
            }
        }
        .gestureRouter {
            presenter.routing(direction: $0)
        }
    }
}
