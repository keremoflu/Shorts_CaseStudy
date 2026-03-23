//
//  ComingSoonView.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 21.03.2026.
//

import SwiftUI
import CommonModule

struct ComingSoonCardView: View {
    
    let series: Series
    
    var body: some View {
        ZStack{
            imageSectionView
        }
        .frame(maxWidth: .infinity)
        .frame(height: 188)
        .cornerRadius(AppRadius.medium)
        .overlay(alignment: .topTrailing) {
            NotifyButton()
            .padding(AppSpacing.medium)
        }
        .overlay(alignment: .bottomLeading) {
            titleDateView(
                title: series.title,
                date: series.releaseDate
            )
            .padding(AppSpacing.medium)
        }
        .modifier(CardViewStrokeModifier(radius: AppRadius.medium))
    }
    
    private var imageSectionView: some View {
        FadeAsyncImage(url: series.comingSoonCardURL, contentMode: .fill)
    }
    
    @ViewBuilder
    private func titleDateView(title: String, date: Date) -> some View {
        VStack (alignment: .leading, spacing: AppSpacing.normal) {
            
            Text(date.shortFormDate)
                .appFont(style: .captionCaption2Emphasized, color: .textPrimary)
                .padding(.vertical, 3.5)
                .padding(.horizontal, AppSpacing.small)
                .background(.blackOpacity20)
                .cornerRadius(AppRadius.xSmall)
            
            Text(title)
                .appFont(style: .title2Emphasized, color: .textPrimary)
        }
    }
    
    private struct NotifyButton: View {
        
        @State var isEnabled: Bool = false
        
        var body: some View {
            Button {
                isEnabled.toggle()
            } label: {
                Image(systemName: isEnabled ? "bell.fill" : "bell")
                    .foregroundStyle(.textPrimary)
                    .appFont(style: .captionCaption1Emphasized, color: .textPrimary)
                    .contentTransition(.symbolEffect(.replace))
            }
            .padding(.horizontal, 5)
            .padding(.vertical, 8)
            .background(Circle().foregroundStyle(.blackOpacity50))
        }
    }
}

#Preview {
    @Previewable @State var isNotifyEnabled: Bool = false
    ZStack {
        Color.surfaceBackgroundPrimary.ignoresSafeArea()
        
        ComingSoonCardView(series: MockSeriesData.series)
            .padding()
    }
        
}
