//Generated by MRKTrace Yggdrasil

import SwiftUI

struct MainSceneView<P: MainScenePresenterProtocol>: View {
    
    private let presenter: P
    
    @State private var animate: Bool = false
    @State private var color = [Color.yellow, .red, .blue, .green].randomElement()!
    @State private var offset: CGSize = .zero
    @State private var opacity: CGFloat = 1

    init(_ presenter: P) {
        self.presenter = presenter
    }
    
    var body: some View {
        GeometryReader { reader in
            ZStack {
                Color.base2
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
            .opacity(opacity)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        let y = min(0, gesture.translation.height)
                        offset = .s(0, y)
                        opacity = 1 + 2 * offset.height / reader.size.height
                    }
                    .onEnded { _ in
                        withAnimation(.bouncy) {
                            offset = .zero
                            opacity = 1
                        }
                    }
            )
        }
    }
}
