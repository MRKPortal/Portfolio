//
//  DragDownModifier.swift
//  Portfolio
//
//  Created by Marc Flores on 23/12/23.
//

import SwiftUI

private struct DragDownModifier: ViewModifier {
    
    @Binding var completed: Bool
    @State private var offset: CGSize = .zero
    
    func body(content: Content) -> some View {
        content
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        withAnimation(.bouncy) {
                            offset = gesture.translation
                        }
                    }
                    .onEnded { gesture in
                        let speed = gesture.velocity.abs.max
                        withAnimation(.bouncy(duration: 0.40)) {
                            offset = .zero
                            if speed > 1000 {
                                completed.toggle()
                            }
                        }
                    }
            )
    }
}

extension View {
    func dragDown(completed: Binding<Bool>) -> some View {
        self.modifier(
            DragDownModifier(completed: completed)
        )
    }
}
