//
//  DistributorProtocol.swift
//  Portfolio
//
//  Created by Marc Flores on 6/12/23.
//

import CoreGraphics

public typealias DistributorPosition = [CGPoint]

public protocol DistributorProtocol {
    var positionGroups: [DistributorPosition] { get }
}
