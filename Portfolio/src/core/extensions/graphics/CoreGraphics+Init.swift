//
//  CoreGraphics+Init.swift
//  Portfolio
//
//  Created by Marc Flores on 19/11/23.
//

import CoreGraphics

extension CGSize {
    static func s(_ width: CGFloat, _ height: CGFloat) -> Self {
        .init(width: width, height: height)
    }
    
    static func s(_ side: CGFloat) -> Self {
        .s(side, side)
    }
}