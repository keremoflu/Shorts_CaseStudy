//
//  NewOnShortsPlaceholderItem.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 22.03.2026.
//

import SwiftUI

struct NewOnShortsPlaceholderItem: View {
    
    var body: some View {
        RoundedRectangle(cornerRadius: AppRadius.small)
            .fill(Color.surfaceBackgroundSecondary)
            .frame(width: 112, height: 158)
    }
}

#Preview {
    NewOnShortsPlaceholderItem()
}
