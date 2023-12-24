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
    
    static func *(p: CGPoint, scale: CGFloat) -> Self {
        .init(x: p.x * scale, y: p.y * scale)
    }
}

extension CGSize {
    static func *(lhs: CGSize, rhs: CGSize) -> Self {
        .init(
            width: lhs.width * rhs.width,
            height: lhs.height * rhs.height
        )
    }

    static func *(lhs: CGSize, scale: CGFloat) -> Self {
        .init(
            width: lhs.width * scale,
            height: lhs.height * scale
        )
    }

    static func /(lhs: CGSize, div: CGFloat) -> Self {
        .init(
            width: lhs.width / div,
            height: lhs.height / div
        )
    }
    
    static func +(lhs: CGSize, rhs: CGSize) -> Self {
        .init(
            width: lhs.width + rhs.width,
            height: lhs.height + rhs.height
        )
    }
}

extension CGAffineTransform {
    static func +(lhs: CGAffineTransform, rhs: CGAffineTransform) -> Self {
        lhs.concatenating(rhs)
    }
}
