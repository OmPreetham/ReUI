//
//  ImageTitleRowCell.swift
//  ReUI
//
//  Created by Om Preetham Bandi on 7/27/24.
//

import SwiftUI

struct ImageTitleRowCell: View {
    var imageSize: CGFloat = 100
    var imageName: String = Constants.randomImage
    var title: String = "Title"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            
            Text(title)
                .font(.callout)
                .foregroundStyle(.spotifyLightGray)
                .lineLimit(2)
                .padding(4)
        }
        .frame(width: imageSize)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        ImageTitleRowCell()
    }
}
