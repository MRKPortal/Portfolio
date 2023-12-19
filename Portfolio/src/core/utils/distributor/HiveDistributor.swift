//
//  HiveDistributor.swift
//  Portfolio
//
//  Created by Marc Flores on 6/12/23.
//

import CoreGraphics

public class HiveDistributor: DistributorProtocol {

    public var positionGroups: [DistributorPosition] = [[.zero]]
    
    public init(_ radius: Int, horizontalLimit: CGFloat? = nil, verticalLimit: CGFloat? = nil) {
        print("hive calculation")
        calculatePositions(
            radius: radius,
            horizontalLimit: horizontalLimit,
            verticalLimit: verticalLimit
        )
    }
}

extension HiveDistributor {
    func calculatePositions(radius: Int, horizontalLimit: CGFloat?, verticalLimit: CGFloat?) {
        var initialValue = 0
        let groups = (0..<radius).map { radius in
            let finalValue = initialValue + max(1, radius * 6)
            let range: Range<Int> = initialValue ..< finalValue
            initialValue = finalValue
            return range
        }

        let vectors: [CGPoint] = (0..<6).map { index in
            let radian = 2 * .pi * CGFloat(index) / 6.0
            return .p(cos(radian), sin(radian))
        }

        var positions: [CGPoint] = [.zero]
        groups.forEach { _ in
            var newPositions = DistributorPosition()
            positions.forEach { initialPoint in
                vectors.forEach { vector in
                    let newPoint = vector + initialPoint
                    if let horizontalLimit, abs(newPoint.x) > horizontalLimit { return }
                    if let verticalLimit, abs(newPoint.y) > verticalLimit { return }
                    
                    if !positions.containsFloat(newPoint) {
                        positions.append(newPoint)
                        newPositions.append(newPoint)
                    }
                }
            }
            positionGroups.append(newPositions)
        }
    }
}
