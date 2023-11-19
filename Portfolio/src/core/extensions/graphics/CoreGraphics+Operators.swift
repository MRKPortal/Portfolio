//
//  CoreGraphics+Operators.swift
//  Portfolio
//
//  Created by Marc Flores on 19/11/23.
//

import CoreGraphics

extension CGPoint {
    static func +(lhs: CGPoint, rhs: CGPoint) -> Self {
        .init(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
}
