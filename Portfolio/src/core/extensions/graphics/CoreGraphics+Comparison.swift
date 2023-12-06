//
//  CoreGraphics+Comparison.swift
//  Portfolio
//
//  Created by Marc Flores on 6/12/23.
//

import CoreGraphics

extension CGSize {
    var isHeightBigger: Bool {
        abs(height) > abs(width)
    }

    var isWidthBigger: Bool {
        abs(height) < abs(width)
    }
}

extension CGFloat {
    func isEqual(value: Self, errorThreshold: CGFloat) -> Bool {
        abs(self - value) < errorThreshold
    }
}

extension CGPoint {
    func isEqual(value: Self, errorThreshold: CGFloat) -> Bool {
        x.isEqual(value: value.x, errorThreshold: errorThreshold) &&
        y.isEqual(value: value.y, errorThreshold: errorThreshold)
    }
}
