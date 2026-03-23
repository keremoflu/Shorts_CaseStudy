//
//  HeroCoverView.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 21.03.2026.
//

import SwiftUI
import CommonModule

struct HeroCoverView: View {
    
    let series: Series
    
    let onItem: () -> Void
    let onPlay: () -> Void
    let onMyList: () -> Void
    
    var body: some View {
        ZStack (alignment: .bottom) {
            backgroundImageView
            
            VStack (spacing: 0) {
                foreGroundImageView
                    .frame(width: 265, height: 172)
                    .onTapGesture {
                        onItem()
                    }
                
                ButtonSectionView(onPlay: {
                    onPlay()
                }, onMyList: {
                    onMyList()
                })
            }
            
            .padding(AppSpacing.large)

        }
        .frame(width: 313, height: 437)
        .clipShape(RoundedRectangle(cornerRadius: AppRadius.medium))
        .modifier(CardViewStrokeModifier(radius: AppRadius.medium))
    }
    
    private struct ButtonSectionView: View {
         var onPlay: () -> Void
         var onMyList: () -> Void
         
        var body: some View {
            HStack (spacing: AppSpacing.small) {
                PlayButton {
                    onPlay()
                }
                
                MyListButton {
                    onMyList()
                }
            }
        }
    }
    
    private struct PlayButton: View {
        
        var onTap: () -> Void
        
        var body: some View {
            Button {
                onTap()
            } label: {
                HStack (spacing: AppSpacing.xSmall) {
                    Image(systemName: "play.fill")
                    Text("Play")
                }
                .appFont(style: .bodyEmphasized, color: .surfaceBackgroundSecondary)
                .padding(.vertical, 13)
                .frame(maxWidth: .infinity)
                .background(.whiteOpacity100)
                .clipShape(RoundedRectangle(cornerRadius: AppRadius.normal))
                .modifier(InnerShadowModifier(
                    topColor: .white.opacity(0.25),
                    bottomColor: .surfaceBackgroundSecondary,
                    lineWidth: 1,
                    cornerRadius: AppRadius.normal
                ))
            }
            .buttonStyle(ButtonTapOpacityStyle())
        }
    }
    
    private struct MyListButton: View {
        
        @State var isAdded: Bool = false
        var onTap: () -> Void
        
        var body: some View {
            Button {
                onTap()
                isAdded.toggle()
            } label: {
                HStack (spacing: AppSpacing.xSmall) {
                    Image(systemName: isAdded ? "checkmark" : "plus")
                        .contentTransition(.symbolEffect(.replace))
                    Text("My List")
                }
                .appFont(style: .bodyEmphasized, color: .textPrimary)
                .padding(.vertical, 13)
                .frame(maxWidth: .infinity)
                .background(.surfaceBackgroundSecondary)
                .clipShape(RoundedRectangle(cornerRadius: AppRadius.normal))
            }
            .buttonStyle(ButtonTapOpacityStyle())
        }
    }
    
    private var foreGroundImageView: some View {
        FadeAsyncImage(url: series.coverTitleURL, placeholderColor: .clear, contentMode: .fill)
    }
    
    private var backgroundImageView: some View {
        FadeAsyncImage(url: series.coverNoTextURL, placeholderColor: .imagePlaceHolder, contentMode: .fill)
    }
}

#Preview {
    
    
    ZStack {
        Color.surfaceBackgroundPrimary.ignoresSafeArea()
        HeroCoverView(
            series: MockSeriesData.series
            ,onItem: {
                print("onItem")
            }, onPlay: { }, onMyList: { })
            .padding(32)
    }
}
