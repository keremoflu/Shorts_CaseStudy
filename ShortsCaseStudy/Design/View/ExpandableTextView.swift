//
//  ExpandableTextView.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 22.03.2026.
//

import SwiftUI
import CommonModule

struct ExpandableTextView: View {
    
    @Binding var isExpanded: Bool
    let text: String
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 4) {
            ZStack(alignment: .bottomTrailing) {
                Text(text)
                    .font(.callout)
                    .foregroundColor(.textPrimary)
                    .lineLimit(isExpanded ? nil : 3)
                    .animation(.easeInOut(duration: 0.25), value: isExpanded)
                
                if !isExpanded {
                    moreTextSection
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.25)) {
                                isExpanded = true
                        }
                    }
                }
            }
            if isExpanded {
                lessTextSection
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            isExpanded = false
                    }
               }
            }
        }
    }
    
    private var lessTextSection: some View {
        Text(" less")
            .font(.callout.bold())
            .foregroundColor(.textPrimary)
            .underline()
    }
    
    private var moreTextSection: some View {
        Text("more...")
            .font(.callout.bold())
            .foregroundColor(.textPrimary)
            .underline()
            .padding(.leading, 20)
            .background(
                LinearGradient(
                    colors: [
                        .surfaceBackgroundPrimary.opacity(0),
                        .surfaceBackgroundPrimary,
                        .surfaceBackgroundPrimary
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
    }
}
#Preview {
    @Previewable @State var isExpanded: Bool = false
    
    ZStack(alignment: .top) {
        Color.surfaceBackgroundPrimary.ignoresSafeArea()
        ExpandableTextView(isExpanded: $isExpanded, text: MockSeriesData.series.description)
            .padding()
    }
}
