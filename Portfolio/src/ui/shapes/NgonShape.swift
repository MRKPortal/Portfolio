//
//  NgonShape.swift
//  Portfolio
//
//  Created by Marc Flores on 19/11/23.
//

import SwiftUI

struct NgonShape: Shape {
    
    let points: Int
    
    func path(in rect: CGRect) -> Path {
        let radius = min(rect.size.width, rect.size.height)/2
        let center = CGPoint(x: rect.midX, y: rect.midY)

        let floatTotal = CGFloat(points)
        var path = Path()
        (0..<points).forEach { point in
            let floatPoint = CGFloat(point)
            let angle = floatPoint * (2 * .pi) / floatTotal
            let coords = center + CGPoint(
                x: radius * cos(angle),
                y: radius * sin(angle)
            )
            
            if point == 0 {
                path.move(to: coords)
            } else {
                path.addLine(to: coords)
            }
        }

        path.closeSubpath()
        return path
    }
}
