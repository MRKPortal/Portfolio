//
//  HiveDistributor.swift
//  Portfolio
//
//  Created by Marc Flores on 6/12/23.
//

import CoreGraphics

public class HiveDistributor: DistributorProtocol {
    
    private var positions: [CGPoint] = [.zero]
    
    public let groups: [DistributorGroup]
    
    public init(_ maxRadius: Int) {
        var initialValue = 0
        groups = (0..<maxRadius).map { radius in
            let finalValue = initialValue + max(1, radius * 6)
            let range: Range<Int> = initialValue ..< finalValue
            initialValue = finalValue
            return range
        }
        calculatePositions()
    }
    
    public func position(at index: Int) -> CGPoint {
        positions[index]
    }
}

extension HiveDistributor {
    func calculatePositions() {
        let vectors: [CGPoint] = (0..<6).map { index in
            let radian = 2 * .pi * CGFloat(index) / 6.0
            return .p(cos(radian), sin(radian))
        }
        
        groups.forEach { _ in
            positions.forEach { initialPoint in
                vectors.forEach { vector in
                    let newPoint = vector + initialPoint
                    if !positions.containsFloat(newPoint) {
                        positions.append(newPoint)
                    }
                }
            }
        }
    }
}
