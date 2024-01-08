//Generated by MRKPortal Yggdrasil

import Foundation
import UIKit

protocol ContactScenePresenterProtocol: GenericScenePresenterProtocol, ObservableObject {
    var dialogs: [String] { get }
    var contacts: [ContactType] { get }

    func didTapContact(_ type: ContactType)
}

final class ContactScenePresenter: ContactScenePresenterProtocol {
    
    @Published var contacts: [ContactType] = ContactType.allCases
    @Published var dialogs = [
        Ls.contactMailDescription,
        Ls.contactGitDescription,
        Ls.contactSocialDescription,
        Ls.contactLinkedinDescription
    ]

	private let router: GenericRouterProtocol

	init(_ router: GenericRouterProtocol) {
		self.router = router
	}

    //MARK: - ContactScenePresenterProtocol

    func didTapContact(_ type: ContactType) {
        let urlString = switch type {
        case .mail:
            C.Contact.contactMail
        case .git:
            C.Contact.gitHubURL
        case .linkedIn:
            C.Contact.linkedInURL
        case .social:
            C.Contact.socialURL
        }
        
        guard let url = URL(string: urlString) else {
            return
        }

        UIApplication.shared.open(url)
    }

    //MARK: - GenericScenePresenterProtocol
    
    func routing(direction: NavigationDirection) {
        router.routing(direction: direction)
    }
}

