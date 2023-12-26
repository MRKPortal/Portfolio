//
//  TextStyleModifier.swift
//  Portfolio
//
//  Created by Marc Flores on 4/12/23.
//

import SwiftUI

private struct TextStyleModifier: ViewModifier {
    
    let style: TextStyle
    let tint: Color

    func body(content: Content) -> some View {
        content
            .font(style.font)
            .foregroundColor(tint)
            .lineSpacing(style.lineSpacing)
            .kerning(style.kern)
    }
}

extension View {
    func applyTextStyle(_ style: TextStyle, tint: Color = .base1) -> some View {
        self.modifier(
            TextStyleModifier(style: style, tint: tint)
        )
    }
}
