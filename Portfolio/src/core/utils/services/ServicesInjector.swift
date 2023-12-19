//
//  ServicesInjector.swift
//  Portfolio
//
//  Created by Marc Flores on 19/11/23.
//

import Foundation

protocol ServicesInjectorProtocol {
    var api: APIServiceProtocol { get }
}

final class ServicesInjector: ServicesInjectorProtocol {
    lazy var api: APIServiceProtocol = APIServiceLocalMock()
}
