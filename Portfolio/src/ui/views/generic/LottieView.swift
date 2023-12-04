//
//  LottieView.swift
//  Portfolio
//
//  Created by Marc Flores on 4/12/23.
//

import SwiftUI
import UIKit
import Lottie

struct LottieView: UIViewRepresentable {

    let name: String
    let loopMode: LottieLoopMode
    
    func makeUIView(context: Context) -> UIView {
        let animationView = LottieAnimationView(name: name)
        let view = UIView(frame: .zero)

        view.addSubview(animationView)
        animationView.loopMode = loopMode
        animationView.play()
        animationView.contentMode = .scaleAspectFit
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor),
            animationView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor),
            animationView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            animationView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {

    }
}
