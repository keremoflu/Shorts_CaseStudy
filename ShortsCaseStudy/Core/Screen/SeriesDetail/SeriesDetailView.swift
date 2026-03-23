//
//  SeriesDetailView.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 20.03.2026.
//

import SwiftUI
import CommonModule

struct SeriesDetailView: View {
    
    @StateObject private var viewModel: SeriesDetailViewModel
    
    @State private var isTitleImageLoading = false
    @State private var isBackgroundImageLoading = false
    @State private var isHeaderVisible = true
    
    init(series: Series) {
        self._viewModel = StateObject(wrappedValue: SeriesDetailViewModel(series: series, seriesService: MockSeriesService.shared))
    }
    
    private let headerHeight: CGFloat = 548
   
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 0) {
                    ZStack(alignment: .bottom) {
                        GeometryReader { geometry in
                            headerContent(geometry: geometry)
                        }
                        .frame(height: headerHeight)
                    }
                    
                    descriptionTextSectionView
                        .padding(.horizontal, AppSpacing.medium)
                        .padding(.top, AppSpacing.small)
                    
                    episodeTextSectionView
                    gridListView
                    .padding(.top, AppSpacing.medium)

                    Spacer()
                }
            }
            .task {
                print("fetchy!")
               await viewModel.fetchSeriesDetails()
            }
            .safeAreaInset(edge: .bottom) {
                bottomBarView
            }
            
        }
        .toolbar {
            toolbarShareItemView
            
            if !isHeaderVisible {
                ToolbarItem(placement: .title) {
                    Text(viewModel.series.title)
                }
            }
        }
        .scrollIndicators(.never)
        .ignoresSafeArea(edges: .top)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.surfaceBackgroundPrimary)
    }
    
    private var gridListView: some View {
        EpisodeGridListView(
            episodes: $viewModel.episodes,
            selectedEpisodeID: $viewModel.selectedEpisodeID) { episode in
                viewModel.handleEpisodeSelection(episode)
            } onUnlockableTap: { episode in
                viewModel.handleUnlockable(episode)
            } onLockedTap: { episode in
            viewModel.handleOnLocked(episode)
        }
    }
    
    @ToolbarContentBuilder
    private var toolbarShareItemView: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            ShareLink(item: viewModel.getShareText()) {
                Image(systemName: "square.and.arrow.up")
                    .foregroundStyle(.whiteOpacity100)
            }
        }
    }
    
    private var bottomBarView: some View {
        VStack(spacing: 0) {
            LinearGradient(
                colors: [.surfaceBackgroundPrimary, .surfaceBackgroundPrimary.opacity(0)],
                startPoint: .bottom,
                endPoint: .top
            )
            .frame(height: 20)
            
            HStack {
                PlayEpisodeButton (isEnabled: $viewModel.isPlayEpisodeEnabled) {
                    
                }
                .frame(width: 229)
                
                AddMyListButton(isAdded: $viewModel.isAddedToList) {
                    viewModel.isAddedToList.toggle()
                }
            }
            .padding(.top, AppSpacing.small)
            .padding(.horizontal, AppSpacing.medium)
            .padding(.bottom, AppSpacing.small)
            .background(.surfaceBackgroundPrimary)
        }
    }
    
    private var episodeTextSectionView: some View {
        ZStack(alignment: .leading) {
            if viewModel.episodes.isEmpty {
                RoundedRectangle(cornerRadius: AppRadius.xSmall)
                    .fill(Color.surfaceBackgroundSecondary)
                    .frame(width: 120, height: 20)
                    .transition(.opacity)
            } else {
                Text("\(viewModel.episodes.count - 1) Episodes")
                    .appFont(style: .title3Emphasized, color: .textPrimary)
                    .transition(.opacity)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, AppSpacing.medium)
        .padding(.top, AppSpacing.large)
        .animation(.easeIn(duration: 0.1), value: viewModel.episodes.isEmpty)
    }
    
    @ViewBuilder
    private func headerContent(geometry: GeometryProxy) -> some View {
        let minY = geometry.frame(in: .global).minY
        let scrollOffset = max(-minY, 0)
        let progress = min(scrollOffset / 548, 1)
        let scaleValue = 1 - (progress * 0.15)
        let parallaxOffsetY = scrollOffset * 0.3
        let titleScale = 1 - (progress * 0.3)
        let backgroundOpacity = 1 - (progress * 0.7)
        
        backgroundImageSectionView
            .frame(width: geometry.size.width, height: headerHeight)
            .offset(y: parallaxOffsetY)
            .scaleEffect(1.15)
            .scaleEffect(x: scaleValue, y: scaleValue, anchor: .center)
            .opacity (backgroundOpacity)
        
        VStack(spacing: 0) {
            titleImageView
                .frame(width: 281, height: 182)
                .scaleEffect(titleScale)
            
            Text("\(viewModel.series.tags.joined(separator: " • "))")
                .multilineTextAlignment(.center)
                .appFont(style: .captionCaption1Regular, color: .textPrimary)
        }
        .padding(.horizontal, AppSpacing.medium)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .padding(.bottom, AppSpacing.medium)
        .onChange(of: progress) { _, newValue in
            isHeaderVisible = newValue < 0.90
         }
    }
    
    private struct PlayEpisodeButton: View {
        @Binding var isEnabled: Bool
        var onTap: () -> Void
        
        var body: some View {
            Button(action: onTap) {
                HStack (spacing: AppSpacing.xSmall) {
                    Image(systemName: "play.fill")
                    Text("Play")
                }
                .appFont(style: .bodyEmphasized, color: isEnabled ? .textPrimary : .textDisabled)
                .padding(.vertical, 17)
                .frame(maxWidth: .infinity)
                .background(isEnabled ? .surfacePrimary : .surfaceDisabled)
                .transition(.opacity)
                .clipShape(.capsule)
                .disabled(!isEnabled)
                .animation(.easeIn(duration: 0.2), value: isEnabled)
            }
        }
    }
    
    private struct AddMyListButton: View {
        
        @Binding var isAdded: Bool
        
        var onTap: () -> Void
        
        var body: some View {
            Button(action: onTap) {
                HStack (spacing: AppSpacing.xSmall) {
                    Image(systemName: isAdded ? "checkmark" : "plus")
                        .contentTransition(.symbolEffect(.replace))
                    Text("My List")
                }
                .appFont(style: .bodyEmphasized, color: .textPrimary)
                .padding(.vertical, 17)
                .frame(maxWidth: .infinity)
                .background(.blackOpacity20)
                .clipShape(.capsule)
            }
            .applyGlassEffect(shape: .capsule)
        }
    }
    
    private var descriptionTextSectionView: some View {
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            ExpandableTextView(
                isExpanded: $viewModel.isDescriptionExpanded,
                text: MockSeriesData.series.description)
            
            Text("Starring: \(viewModel.series.cast.map(\.name).joined(separator: ","))")
                .appFont(style: .captionCaption1Regular, color: .textSeconday)
        }
    }
    
    private var backgroundImageSectionView: some View {
        ZStack(alignment: .bottom) {
            backgroundImageView
            LinearGradient(
                stops: [
                    .init(color: .detailsGradient.opacity(0), location: 0),
                    .init(color: .detailsGradient.opacity(0.4), location: 0.35),
                    .init(color: .detailsGradient, location: 1.0)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 150)
        }
    }
    
    private var titleImageView: some View {
        FadeAsyncImage(url: viewModel.series.coverTitleURL, contentMode: .fill) {
            isTitleImageLoading = true
        }
        .opacity((isBackgroundImageLoading && isTitleImageLoading) ? 1 : 0)
    }
    
    private var backgroundImageView: some View {
        FadeAsyncImage(url: viewModel.series.coverNoTextURL, contentMode: .fill) {
            isBackgroundImageLoading = true
        }
        .opacity((isBackgroundImageLoading && isTitleImageLoading) ? 1 : 0)
    }
}



#Preview {
    SeriesDetailView(series: MockSeriesData.series)
}
