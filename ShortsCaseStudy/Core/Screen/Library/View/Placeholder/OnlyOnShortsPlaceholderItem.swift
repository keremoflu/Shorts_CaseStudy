//
//  OnlyOnShortsPlaceholderItem.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 22.03.2026.
//

import SwiftUI

struct OnlyOnShortsPlaceholderItem: View {
    
    var body: some View {
        RoundedRectangle(cornerRadius: AppRadius.medium)
            .fill(Color.surfaceBackgroundSecondary)
            .frame(width: 239, height: 407)
        
    }
}

#Preview {
    OnlyOnShortsPlaceholderItem()
}
