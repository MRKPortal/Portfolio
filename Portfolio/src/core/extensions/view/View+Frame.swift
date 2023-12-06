//
//  View+Frame.swift
//  Portfolio
//
//  Created by Marc Flores on 6/12/23.
//

import SwiftUI

extension View {
    @ViewBuilder
    func frame(size: CGSize, alignment: Alignment = .center) -> some View {
        frame (
            width: size.width,
            height: size.height,
            alignment: alignment
        )
    }
}

