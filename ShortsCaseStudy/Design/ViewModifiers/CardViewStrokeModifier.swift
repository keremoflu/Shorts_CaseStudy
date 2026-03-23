//
//  CardViewModifier.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 21.03.2026.
//

import Foundation
import SwiftUI

struct CardViewStrokeModifier: ViewModifier {
    
    let radius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay {
                RoundedRectangle(cornerRadius: radius)
                    .strokeBorder(.white.opacity(0.2), lineWidth: 1)
            }
    }
}
