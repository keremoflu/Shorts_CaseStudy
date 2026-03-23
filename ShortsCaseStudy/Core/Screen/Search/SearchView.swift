//
//  SearchView.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 20.03.2026.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText: String = ""
    @FocusState private var focused: Bool
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Color.clear
            }
            .background(Color.surfaceBackgroundPrimary)
            .scrollDismissesKeyboard(.immediately)
            .contentShape(Rectangle())
            .hideKeyboardOnTap()
        }
        .searchable(
            text: $searchText,
            prompt: Text("Shows, Actors, Genres ...")
        )
       
    }
}

#Preview {
    SearchView()
}
