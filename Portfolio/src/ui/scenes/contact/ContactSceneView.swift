//Generated by MRKPortal Yggdrasil

import SwiftUI

struct ContactSceneView<P: ContactScenePresenterProtocol>: View {
    
    private let presenter: P
    
    init(_ presenter: P) {
        self.presenter = presenter
    }
    
    var body: some View {
        GeometryReader { reader in
            ZStack {
                Color.base2
                
                ForEach(Array(presenter.contacts.enumerated()), id: \.offset) { offset, contact in
                    let percet = Double(offset)/Double(presenter.contacts.count)
                    IconButton(icon: contact.icon) {
                        presenter.didTapContact(contact)
                    }
                    .frame(size: .s(reader.size.width/5))
                    .offset(.angle(.degrees(percet * 360)) * reader.size.width/4)
                }
                VStack {
                    
                }
            }
        }
        .gestureRouter(directions: [.down]) { _ in
            presenter.pop()
        }
        .onAppear {
            
        }
    }
}

extension ContactType {
    var icon: Image {
        switch self {
        case .mail: .contactEmail
        case .git: .contactGithub
        case .linkedIn: .contactLinkedin
        case .social: .contactInstagram
        }
    }
}
