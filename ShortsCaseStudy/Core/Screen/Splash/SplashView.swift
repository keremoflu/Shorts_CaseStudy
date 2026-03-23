//
//  SplashView.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 22.03.2026.
//

import SwiftUI
import CommonModule

struct SplashView: View {
    @EnvironmentObject var navigation: AppNavigation
    @EnvironmentObject var store: SeriesStore
    @StateObject private var viewModel = SplashViewModel()
    @State private var showMain = false
    @State private var iconScale: CGFloat = 0.25
    
    var body: some View {
        ZStack {
            Color.surfaceBackgroundPrimary.ignoresSafeArea()
            
            MainView()
                .opacity(showMain ? 1 : 0)
            
            if !showMain {
                splashLoadingView
            }
        }
        .task {
            await viewModel.prefetch(store: store)
            await MainActor.run {
                showMain = true
            }
        }
    }
    
    private var splashLoadingView: some View {
        VStack(spacing: AppSpacing.xLarge) {
            
            Image(.appIcon)
                .resizable()
                .frame(width: 160, height: 160)
                .scaleEffect(iconScale)
            
            Text("Shorts - Drama App")
                .appFont(style: .title1Regular, color: .textSeconday)
            
            ProgressView()
                .progressViewStyle(.circular)
                .tint(.whiteOpacity50)
        }
        .onAppear {
            withAnimation(.bouncy(duration: 1, extraBounce: 0.2)) {
                iconScale = 1
            }
        }
    }
}

#Preview {
    SplashView()
        .environmentObject(AppNavigation())
        .environmentObject(SeriesStore())
}
