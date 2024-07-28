//
//  SongRowCell.swift
//  ReUI
//
//  Created by Om Preetham Bandi on 7/27/24.
//

import SwiftUI

struct SongRowCell: View {
    var imageSize: CGFloat = 50
    var imageName: String = Constants.randomImage
    var title: String = "Title"
    var subtitle: String? = "Subtitle"
    var onCellPressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    
    var body: some View {
        HStack {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundStyle(.spotifyWhite)
                
                if let subtitle {
                    Text(subtitle)
                        .font(.callout)
                        .foregroundStyle(.spotifyLightGray)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .lineLimit(2)
            
            Image(systemName: "ellipsis")
                .font(.subheadline)
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                    
                }
        }
        .foregroundStyle(.red)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack {
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
        }
    }
}
