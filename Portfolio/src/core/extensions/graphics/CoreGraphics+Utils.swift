//
//  CoreGraphics+Utils.swift
//  Portfolio
//
//  Created by Marc Flores on 23/12/23.
//

import CoreGraphics

extension CGPoint {
    var toSize: CGSize {
        .init(width: x, height: y)
    }
}

extension CGSize {
    var abs: Self {
        .init(
            width: Swift.abs(width),
            height: Swift.abs(height)
        )
    }
    
    var max: CGFloat {
        Swift.max(width,height)
    }
}
