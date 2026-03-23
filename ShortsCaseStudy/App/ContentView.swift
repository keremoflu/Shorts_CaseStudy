//
//  ContentView.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 20.03.2026.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var navigation: AppNavigation
    
    var body: some View {
        SplashView()
    }
}

#Preview {
    ContentView()
        .environmentObject(AppNavigation())
        .environmentObject(SeriesStore())
}
