//
//  TopPicksPlaceholderItem.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 22.03.2026.
//

import SwiftUI

struct TopPicksPlaceholderItem: View {
    
    var body: some View {
        HStack(spacing: AppSpacing.small) {
            RoundedRectangle(cornerRadius: AppRadius.small)
                .fill(Color.surfaceBackgroundSecondary)
                .frame(width: 112, height: 158)
            
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                Spacer()
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.surfaceBackgroundSecondary)
                    .frame(width: 120, height: 14)
                
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.surfaceBackgroundSecondary)
                    .frame(width: 80, height: 10)
                
                HStack(spacing: AppSpacing.small) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.surfaceBackgroundSecondary)
                        .frame(width: 50, height: 20)
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.surfaceBackgroundSecondary)
                        .frame(width: 50, height: 20)
                }
                .padding(.top, AppSpacing.xSmall)
                Spacer()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 158)
    }
}

#Preview {
    TopPicksPlaceholderItem()
}
