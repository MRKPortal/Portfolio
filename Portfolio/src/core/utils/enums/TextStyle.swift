//
//  TextStyle.swift
//  Portfolio
//
//  Created by Marc Flores on 4/12/23.
//

import SwiftUI

enum TextStyle {
    case h2, h3, h4
    case body
    
    //MARK: Attributes

    var font: Font {
        switch self {
        case .h2: .montserrat_20_600
        case .h3: .montserrat_22_400
        case .h4: .montserrat_16_600
        case .body: .roboto_14_400
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
            ///Line height: 20px, Font size: 14px
        case .body: (20 - 14)/2
        }
    }
}
