//
//  SpotifyNewReleaseCell.swift
//  ReUI
//
//  Created by Om Preetham Bandi on 7/27/24.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    var imageName: String = Constants.randomImage
    var headline: String? = "Headline"
    var subheadline: String? = "Subheadline"
    var title: String? = "Title"
    var subtitle: String? = "Subtitle"
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 8) {
                ImageLoaderView()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    if let headline {
                        Text(headline)
                            .foregroundStyle(.spotifyLightGray)
                            .font(.callout)
                    }
                    
                    if let subheadline {
                        Text(subheadline)
                            .foregroundStyle(.spotifyWhite)
                            .font(.title2)
                            .fontWeight(.medium)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                ImageLoaderView()
                    .frame(width: 140, height: 140)
                
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading, spacing: 2) {
                        if let title {
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.spotifyWhite)
                                .lineLimit(1)
                        }
                        
                        if let subtitle {
                            Text(subtitle)
                                .foregroundStyle(.spotifyLightGray)
                                .lineLimit(2)
                        }
                    }
                    .font(.callout)
                    
                    HStack(spacing: 0) {
                        Image(systemName: "plus.circle")
                            .font(.title3)
                            .padding(4)
                            .background(Color.black.opacity(0.001))
                            .foregroundStyle(.spotifyLightGray)
                            .onTapGesture {
                                onAddToPlaylistPressed?()
                            }
                            .offset(x: -4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image(systemName: "play.circle.fill")
                            .font(.title)
                            .foregroundStyle(.spotifyLightGray)
                    }
                }
            }
            .themeColors(isSelected: false)
            .clipShape(RoundedRectangle(cornerRadius: 8.0))
            .onTapGesture {
                onPlayPressed?()
            }
        }
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        
        SpotifyNewReleaseCell()
            .padding()
    }
}
