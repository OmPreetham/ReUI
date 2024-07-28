//
//  SpotifyRecentsCell.swift
//  ReUI
//
//  Created by Om Preetham Bandi on 7/27/24.
//

import SwiftUI

struct SpotifyRecentsCell: View {
    var imageName: String = Constants.randomImage
    var title: String = "Some random title"
    
    var body: some View {
        HStack(spacing: 16) {
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.trailing, 8)
        .themeColors(isSelected: false)
        .clipShape(RoundedRectangle(cornerRadius: 6.0))
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        
        VStack {
            HStack {
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
            
            HStack {
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
        }
    }
}
