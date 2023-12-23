//
//  CoreGraphics+Comparison.swift
//  Portfolio
//
//  Created by Marc Flores on 6/12/23.
//

import CoreGraphics

extension CGSize {
    var isHeightBigger: Bool {
        Swift.abs(height) > Swift.abs(width)
    }
    
    var isWidthBigger: Bool {
        !isHeightBigger
    }
}

extension CGFloat {
    func isEqual(value: Self?, errorThreshold: CGFloat = 0.0001) -> Bool {
        guard let value else { return false }
        return abs(self - value) < errorThreshold
    }
}

extension CGPoint {
    func isEqual(value: Self?, errorThreshold: CGFloat = 0.0001) -> Bool {
        guard let value else { return false }
        return x.isEqual(value: value.x, errorThreshold: errorThreshold) && y.isEqual(value: value.y, errorThreshold: errorThreshold)
    }
}
