//
//  TextStyleModifier.swift
//  Portfolio
//
//  Created by Marc Flores on 4/12/23.
//

import SwiftUI

private struct TextStyleModifier: ViewModifier {
    
    let style: TextStyle

    func body(content: Content) -> some View {
        content
            .font(style.font)
            .foregroundColor(style.color)
            .lineSpacing(style.lineSpacing)
    }
}

extension View {
    func applyTextStyle(_ style: TextStyle) -> some View {
        self.modifier(
            TextStyleModifier(style: style)
        )
    }
}
