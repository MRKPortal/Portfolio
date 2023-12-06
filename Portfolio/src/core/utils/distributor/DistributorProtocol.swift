//
//  DistributorProtocol.swift
//  Portfolio
//
//  Created by Marc Flores on 6/12/23.
//

import CoreGraphics

public typealias DistributorGroup = Range<Int>

public protocol DistributorProtocol {
    var groups: [DistributorGroup] { get }
    func position(at index: Int) -> CGPoint
}
