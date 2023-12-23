//
//  CoreGraphics+Init.swift
//  Portfolio
//
//  Created by Marc Flores on 19/11/23.
//

import CoreGraphics

extension CGSize {
    static func s(w: CGFloat = 0, h: CGFloat = 0) -> Self {
        .init(width: w, height: h)
    }
    
    static func s(_ side: CGFloat) -> Self {
        .s(w: side, h: side)
    }
}

extension CGAffineTransform {
    static func t(_ x: CGFloat, y: CGFloat) -> Self {
        .init(translationX: x, y: y)
    }

    static func t(_ p: CGPoint) -> Self {
        .init(translationX: p.x, y: p.y)
    }
    
    static func s(_ scale: CGFloat) -> Self {
        .init(scaleX: scale, y: scale)
    }
}

extension CGPoint {
    static func p(_ x: CGFloat, _ y: CGFloat) -> Self {
        .init(x: x, y: y)
    }
}
