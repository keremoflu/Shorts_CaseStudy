//
//  ComingSoonPlaceholderItem.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 22.03.2026.
//

import SwiftUI

struct ComingSoonPlaceholderItem: View {
    
    var body: some View {
        VStack(spacing: AppSpacing.medium) {
            
            RoundedRectangle(cornerRadius: AppRadius.medium)
                .fill(Color.surfaceBackgroundSecondary)
                .frame(height: 188)
                .overlay(alignment: .bottomLeading) {
                    VStack(alignment: .leading, spacing: AppSpacing.normal) {
                        RoundedRectangle(cornerRadius: AppRadius.xSmall)
                            .fill(Color.surfaceBackgroundPrimary.opacity(0.3))
                            .frame(width: 70, height: 16)
                        
                        RoundedRectangle(cornerRadius: 2)
                            .fill(Color.surfaceBackgroundPrimary.opacity(0.3))
                            .frame(width: 180, height: 20)
                    }
                    .padding(AppSpacing.medium)
                }
                .padding(.horizontal, AppSpacing.medium)
            
            HStack(spacing: AppSpacing.small) {
                ForEach(0..<3, id: \.self) { index in
                    Circle()
                        .fill(index == 0 ? Color.surfaceBackgroundSecondary : Color.surfaceBackgroundSecondary.opacity(0.4))
                        .frame(width: 8, height: 8)
                }
            }
        }
    }
}

#Preview {
    ComingSoonPlaceholderItem()
}
