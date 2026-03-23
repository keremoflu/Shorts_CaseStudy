//
//  ContinueWatchingPlaceholderItem.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 22.03.2026.
//

import SwiftUI

struct ContinueWatchingPlaceholderItem: View {
    
    var body: some View {
        VStack(spacing: AppSpacing.small) {
            ZStack {
                RoundedRectangle(cornerRadius: AppRadius.small)
                    .fill(Color.surfaceBackgroundSecondary)
                    .frame(height: 158)
                
                Circle()
                    .fill(Color.surfaceBackgroundPrimary.opacity(0.3))
                    .frame(width: 28, height: 28)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.surfaceBackgroundSecondary)
                    .frame(maxWidth: .infinity)
                    .frame(height: 10)
                
            }
        }
        .frame(width: 112, height: 182)
    }
}

#Preview {
    ContinueWatchingPlaceholderItem()
}
