//
//  HeroCarouselView.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 21.03.2026.
//

import SwiftUI

struct HeroCarouselView: View {
    
    @Binding var seriesList: [Series]
    
    var onItem: (Series) -> Void
    var onPlay: (Series) -> Void
    var onMyList: (Series) -> Void
    
    @State private var currentPage = 0
    
    private let itemWidth: CGFloat = 313

    var body: some View {
        GeometryReader { geo in
            
            ZStack {
                if seriesList.isEmpty {
                    placeHolderView
                } else {
                    scrollListView
                }
            }
            .transition(.opacity)
            .animation(.easeIn(duration: 0.2), value: seriesList.isEmpty)
            
        }
        .frame(height: 437)
    }
    
    private var scrollListView: some View {
        
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                ForEach(Array(seriesList.enumerated()), id: \.offset) { index, series in
                    HeroCoverView(
                        series: series,
                        onItem: { onItem(series) },
                        onPlay: { onPlay(series) },
                        onMyList: { onMyList(series) }
                    )
                    .frame(width: itemWidth)
                    .scrollTransition { content, phase in
                        content
                            .scaleEffect(phase.isIdentity ? 1.0 : (397 / 437))
                    }
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(.horizontal, 40)
        .scrollTargetBehavior(.viewAligned)
        .scrollIndicators(.never)
    }
    
    private var placeHolderView: some View {
        HStack {
            Spacer()
            RoundedRectangle(cornerRadius: AppRadius.medium)
                .fill(Color.surfaceBackgroundSecondary)
                .frame(width: 313, height: 437)
            Spacer()
        }
    }
}
