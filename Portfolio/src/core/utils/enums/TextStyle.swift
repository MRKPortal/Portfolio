//
//  TextStyle.swift
//  Portfolio
//
//  Created by Marc Flores on 4/12/23.
//

import SwiftUI

enum TextStyle {
    case h2(Color = .base1)
    case h3(Color = .base1)
    case h4(Color = .base1)
    
    //MARK: Attributes
    
    var color: Color {
        return switch self {
        case .h2(let color),
                .h3(let color),
                .h4(let color): color
        }
    }
    
    var font: Font {
        switch self {
        case .h2: .montserrat_20_600
        case .h3: .montserrat_22_400
        case .h4: .montserrat_16_600
        }
    }
    
    var lineSpacing: CGFloat {
        return switch self {
            ///Line height: 24px, Font size: 20px
        case .h2: (24 - 20)/2
            ///Line height: 22px, Font size: 20px
        case .h3: (22 - 20)/2
            ///Line height: 24px, Font size: 16px
        case .h4: (24 - 16)/2
        }
    }
}
