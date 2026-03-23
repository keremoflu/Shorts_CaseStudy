//
//  ListSnapModifier.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 23.03.2026.
//

import SwiftUI

struct ListSnapModifier: ViewModifier {
    let isSnapActive: Bool
    
    func body(content: Content) -> some View {
        if isSnapActive {
            content
                .scrollTargetBehavior(.viewAligned)
                .scrollIndicators(.never)
        } else {
            content
        }
    }
}
