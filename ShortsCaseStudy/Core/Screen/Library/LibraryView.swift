//
//  LibraryView.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 20.03.2026.
//

import SwiftUI
import CommonModule

struct ToolbarYKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct LibraryView: View {
    
    @EnvironmentObject var store: SeriesStore
    @EnvironmentObject var navigation: AppNavigation
    @State private var currentComingSoonIndex: Int = 0
    
    @State private var toolbarMidY: CGFloat = 0

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 48) {
                heroCarouselView
                continueWatchingSectionView
                comingSoonSectionView
                mostTrendingSectionView
                onlyOnShortsSectionView
                topPicksSectionView
                newsOnShortsSectionView
                Spacer()
            }
        }
        .scrollIndicators(.never)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.surfaceBackgroundPrimary)
        .toolbar {
            profileToolbarContent
        }
        .onPreferenceChange(ToolbarYKey.self) { toolbarMidY = $0 }
        .overlay(alignment: .topLeading) {
            GeometryReader { geometry in
                customToolbarTextView(geometry: geometry)
            }
            .ignoresSafeArea(edges: .top)
            .allowsHitTesting(false)
        }
    }
    
    @ViewBuilder
    private func customToolbarTextView(geometry: GeometryProxy) -> some View {
        let overlayOriginY = geometry.frame(in: .global).minY
        
        HStack(spacing: AppSpacing.small) {
            Image(.appIcon)
                .resizable()
                .frame(width: 32, height: 32)
            
            Text("Shorts")
                .appFont(style: .bodyEmphasized, color: .textPrimary)
        }
        .padding(.leading, AppSpacing.medium)
        .offset(y: toolbarMidY - overlayOriginY - 16)
    }
    
    @ToolbarContentBuilder
    private var profileToolbarContent: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Image(systemName: "person.fill")
                .appFont(style: .bodyEmphasized, color: .textPrimary)
                .background(
                    GeometryReader { geo in
                        Color.clear.preference(
                            key: ToolbarYKey.self,
                            value: geo.frame(in: .global).midY
                        )
                    }
                )
        }
    }

    private var heroCarouselView: some View {
        let items = store.seriesList(for: .carousel)
        
        return HeroCarouselView(
            seriesList: Binding(
                get: { items },
                set: { _ in }
            ),
        ) { series in
            navigation.navigate(to: .seriesDetail(series))
        } onPlay: { series in
            
        } onMyList: { series in
            store.toggleMyList(series.id)
        }
        .onAppear { store.loadSectionIfNeeded(.carousel) }
    }

    @ViewBuilder
    private var continueWatchingSectionView: some View {
        let items = store.seriesList(for: .continueWatching)
        
        HorizontalSectionListView(title: "Continue Watching", items: items, placeholderCount: 4, isSnapActive: true, onViewAll: {
            
        }, itemView: { index, item in
            
            ContinueWatchingView(
                currentDuration: WatchHistoryManager.shared.getHistory(for: item).currentDuration,
                currentEpisodeIndex: WatchHistoryManager.shared.getHistory(for: item).lastEpisodeIndex,
                series: item)
                .frame(width: 112)
        }, placeholderView: {
            ContinueWatchingPlaceholderItem()
        })
        
        
        .onAppear { store.loadSectionIfNeeded(.continueWatching) }
    }

    private var comingSoonSectionView: some View {
        let items = store.seriesList(for: .comingSoon)
        
        return librarySectionHeaderText(title: "Coming Soon") {
            if items.isEmpty {
                ComingSoonPlaceholderItem()
                    .transition(.opacity)
            } else {
                TabView(selection: $currentComingSoonIndex) {
                    ForEach(items.indices, id: \.self) { index in
                        ComingSoonCardView(series: items[index])
                            .padding(.horizontal, AppSpacing.medium)
                            .tag(index)
                            .onTapGesture {
                                navigation.navigate(to: .seriesDetail(items[index]))
                            }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 188)
                .transition(.opacity)
                
                customPageIndicatorView(currentIndex: currentComingSoonIndex, totalPages: items.count)
                    .transition(.opacity)
            }
        }
        .animation(.easeIn(duration: 0.3), value: items.isEmpty)
        .onAppear { store.loadSectionIfNeeded(.comingSoon) }
    }

    @ViewBuilder
    private var mostTrendingSectionView: some View {
        let items = store.seriesList(for: .trending)
        
        HorizontalSectionListView(
            title: "Most Trending",
            items: items,
            placeholderCount: 4,
            isSnapActive: true,
            onViewAll: {
            print("onItemAll")
                
        }, itemView: { index, item in
            TrendingSeriesView(series: item, rank: index + 1)
                .onTapGesture {
                    navigation.navigate(to: .seriesDetail(item))
                }
        }, placeholderView: {
            TrendingPlaceholderItem()
        })
        .onAppear { store.loadSectionIfNeeded(.trending) }
    }

    @ViewBuilder
    private var onlyOnShortsSectionView: some View {
        let items = store.seriesList(for: .onlyOnShorts)
        
        HorizontalSectionListView(
            title: "Only on Shorts",
            items: items,
            placeholderCount: 3,
            isSnapActive: true,
            onViewAll: {
                //
            },
            itemView: { index, item in
                SeriesPreviewView(series: item)
                    .frame(width: 239, height: 407)
                    .onTapGesture {
                        navigation.navigate(to: .seriesDetail(item))
                    }
            },
            placeholderView: {
                OnlyOnShortsPlaceholderItem()
            })
        
        .onAppear { store.loadSectionIfNeeded(.onlyOnShorts) }
    }

    private var topPicksSectionView: some View {
        let items = store.seriesList(for: .topPicks)
        
        return librarySectionHeaderText(title: "Top Picks") {
            VStack(spacing: AppSpacing.normal) {
                if items.isEmpty {
                    ForEach(0..<5, id: \.self) { _ in
                        TopPicksPlaceholderItem()
                    }
                    .transition(.opacity)
                } else {
                    ForEach(items) { series in
                        SeriesDetailsCoverView(series: series)
                            .contentShape(RoundedRectangle(cornerRadius: AppRadius.xSmall))
                            .onTapGesture {
                                navigation.navigate(to: .seriesDetail(series))
                            }
                    }
                    .transition(.opacity)
                }
            }
            .padding(.horizontal, AppSpacing.medium)
            .animation(.easeIn(duration: 0.3), value: items.isEmpty)
        }
        .onAppear { store.loadSectionIfNeeded(.topPicks) }
    }
    
    @ViewBuilder
    private var newsOnShortsSectionView: some View {
        let items = store.seriesList(for: .newOnShorts)
        
        HorizontalSectionListView(
            title: "New on Shorts",
            items: items,
            placeholderCount: 4,
            isSnapActive: true,
            onViewAll: {
                //
            },
            itemView: { index, item in
                SeriesCoverView(series: item)
                    .frame(width: 112)
                    .onTapGesture {
                        navigation.navigate(to: .seriesDetail(item))
                    }
            },
            placeholderView: {
                NewOnShortsPlaceholderItem()
            })
        
        .onAppear { store.loadSectionIfNeeded(.newOnShorts) }
    }
    
    private func customPageIndicatorView(currentIndex: Int, totalPages: Int) -> some View {
        HStack(spacing: AppSpacing.small) {
            ForEach(0..<totalPages, id: \.self) { index in
                Circle()
                    .fill(index == currentIndex ? .textPrimary : .pageIndicatorDisabled)
                    .frame(width: 8, height: 8)
            }
        }
    }
    
    private func sectionHeaderView(title: String) -> some View {
        HStack {
            Text(title)
                .appFont(style: .title3Emphasized, color: .textPrimary)
            
            Spacer()
            
            Button {
                
            } label: {
                HStack(spacing: AppSpacing.xSmall) {
                    Text("View all")
                    Image(systemName: "chevron.right")
                }.appFont(style: .calloutRegular, color: .textPrimary)
            }
        }
        .padding(.horizontal, AppSpacing.medium)
    }
    
    @ViewBuilder
    func librarySectionHeaderText<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(spacing: AppSpacing.medium) {
            sectionHeaderView(title: title)
            content()
        }
    }
}

#Preview {
    LibraryView()
        .environmentObject(AppNavigation())
        .environmentObject(SeriesStore())
}
