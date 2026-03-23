//
//  MyListView.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 20.03.2026.
//

import SwiftUI

struct MyListView: View {
    var body: some View {
        ZStack {
            Color.surfaceBackgroundPrimary.ignoresSafeArea()
            Text("My list view")
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    MyListView()
}
