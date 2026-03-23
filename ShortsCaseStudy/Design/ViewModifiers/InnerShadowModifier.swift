//
//  InnerShadowModifier.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 21.03.2026.
//

import Foundation
import SwiftUI

struct InnerShadowModifier: ViewModifier {
    
    let topColor: Color
    let bottomColor: Color
    let lineWidth: CGFloat
    let cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(
                        LinearGradient(
                            colors: [topColor.opacity(0.25), bottomColor.opacity(0.25)],
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: lineWidth
                    )
            }
    }
}
