//
//  HorizontalSectionListView.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 23.03.2026.
//

import SwiftUI

struct HorizontalSectionListView<Item: Identifiable, ItemView: View, PlaceHolderView: View>: View {
    
    let title: String
    let items: [Item]
    let placeholderCount: Int
    let isSnapActive: Bool
    
    let onViewAll: () -> Void
    @ViewBuilder var itemView: (Int, Item) -> ItemView
    @ViewBuilder var placeholderView: () -> PlaceHolderView
    
    var body: some View {
        LibrarySectionHeader(title: title) {
            ScrollView (.horizontal) {
                HStack (spacing: AppSpacing.normal) {
                    if items.isEmpty {
                        ForEach(0..<placeholderCount, id: \.self) { _ in
                            placeholderView()
                        }
                    } else {
                        ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                            itemView(index, item)
                        }
                    }
                }
                .padding(.horizontal, AppSpacing.medium)
                .scrollTargetLayout()
            }
            .modifier(ListSnapModifier(isSnapActive: isSnapActive))
            .scrollIndicators(.never)
            .animation(.easeIn(duration: 0.3), value: items.isEmpty)
        } onViewAll: {
            onViewAll()
        }

    }
}

