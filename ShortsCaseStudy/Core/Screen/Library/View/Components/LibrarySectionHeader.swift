//
//  LibrarySectionHeader.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 23.03.2026.
//

import SwiftUI
import CommonModule

struct LibrarySectionHeader<Content: View>: View {
    
    let title: String
    @ViewBuilder var content: () -> Content
    let onViewAll: () -> Void
    
    var body: some View {
        VStack (spacing: AppSpacing.medium) {
            HStack {
                Text(title)
                    .appFont(style: .title3Emphasized, color: .textPrimary)
                Spacer()
                
                Button {
                    onViewAll()
                } label: {
                    HStack (spacing: AppSpacing.small) {
                        Text("View All")
                        Image(systemName: "chevron.right")
                    }.appFont(style: .calloutRegular, color: .textPrimary)
                }
            }.padding(.horizontal, AppSpacing.medium)
            content()
        }
    }
}

#Preview {
    LibrarySectionHeader(title: "Testing", content: { }, onViewAll: { })
}
