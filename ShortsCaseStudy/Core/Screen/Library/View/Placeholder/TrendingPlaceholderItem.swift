//
//  TrendingPlaceholderItem.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 22.03.2026.
//

import SwiftUI

struct TrendingPlaceholderItem: View {
    
    var body: some View {
        VStack(spacing: AppSpacing.small) {
            RoundedRectangle(cornerRadius: AppRadius.small)
                .fill(Color.surfaceBackgroundSecondary)
                .frame(width: 152, height: 158)
            
            RoundedRectangle(cornerRadius: 2)
                .fill(Color.surfaceBackgroundSecondary)
                .frame(width: 90, height: 12)
        }
        .frame(width: 152)
    }
}

#Preview {
    TrendingPlaceholderItem()
}
