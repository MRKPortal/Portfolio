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
