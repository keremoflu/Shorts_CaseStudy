//
//  MainView.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 20.03.2026.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedTab: AppTabs = .library
    @EnvironmentObject var navigation: AppNavigation
    
    var body: some View {
        if #available(iOS 26, *) {
            glassTabView
        } else {
            classicTabView
        }
    }
    
    @available(iOS 26, *)
    private var glassTabView: some View {
        TabView(selection: $selectedTab) {
            Tab(AppTabs.library.text,
                image: AppTabs.library.activeImageName,
                value: .library) {
                NavigationStack (path: $navigation.navigationPath) {
                    LibraryView()
                        .navigationDestination(for: AppDestination.self) { destination in
                            destinationView(for: destination)
                        }
                }
            }
            
            Tab(AppTabs.forYou.text,
                image: AppTabs.forYou.activeImageName,
                value: .forYou) {
                    ForYouView()
            }
            
            Tab(AppTabs.myList.text,
                image: AppTabs.myList.activeImageName,
                value: .myList) {
                    MyListView()
            }
            
            Tab(AppTabs.rewards.text,
                image: AppTabs.rewards.activeImageName,
                value: .rewards) {
                    RewardsView()
            }
            
            Tab(value: .search, role: .search) {
                SearchView()
            }
        }
        .tint(.white)
        
    }
    
    private var classicTabView: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                LibraryView()
            }
            .tabItem { tabLabel(.library) }
            .tag(AppTabs.library)
            
            ForYouView()
            .tabItem { tabLabel(.forYou) }
            .tag(AppTabs.forYou)
            
            MyListView()
            .tabItem { tabLabel(.myList) }
            .tag(AppTabs.myList)
            
            RewardsView()
            .tabItem { tabLabel(.rewards) }
            .tag(AppTabs.rewards)
            
            SearchView()
            .tabItem { tabLabel(.search) }
            .tag(AppTabs.search)
        }
        .tint(.surfacePrimary)
        .toolbarBackground(.surfaceBackgroundPrimary, for: .tabBar)
    }
    
    private func tabLabel(_ tab: AppTabs) -> some View {
        Label {
            Text(tab.text)
        } icon: {
            if selectedTab == tab && tab != .rewards {
                Image(tab.activeImageName)
                    
            } else {
                Image(tab.inactiveImageName)
            }
        }
    }
    
    @ViewBuilder
    private func destinationView(for destination: AppDestination) -> some View {
        switch destination {
        case .splash:
            EmptyView()
        case .tabbar:
            EmptyView()
        case .seriesDetail(let series):
            SeriesDetailView(series: series)
        }
    }
}

#Preview {
    MainView()
        .environmentObject(AppNavigation())
}
