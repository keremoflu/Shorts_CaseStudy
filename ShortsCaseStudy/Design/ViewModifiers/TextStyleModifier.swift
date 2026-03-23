//
//  TextStyleModifier.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 20.03.2026.
//

import Foundation
import SwiftUI
import CommonModule

struct AppTextStyle: ViewModifier {
    let fontStyle: FontStyle
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(fontStyle.font)
            .lineSpacing(fontStyle.lineHeight - fontStyle.size)
            .tracking(fontStyle.letterSpacing)
            .foregroundStyle(color)
    }
}
