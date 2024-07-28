//
//  ImageLoaderView.swift
//  ReUI
//
//  Created by Om Preetham Bandi on 7/27/24.
//

import SwiftUI

struct ImageLoaderView: View {
    var urlString: String = Constants.randomImage
    var resizingMode: ContentMode = .fill
    
    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay {
                AsyncImage(url: URL(string: urlString)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView() // Show a loading spinner while the image is loading
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: resizingMode)
                            .allowsHitTesting(false)
                    case .failure:
                        Image(systemName: "xmark.circle") // Show a failure image if there's an error
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .foregroundColor(.red)
                    @unknown default:
                        EmptyView() // Handle any future cases that might be added
                    }
                }
            }
            .clipped()
    }
}

#Preview {
    ImageLoaderView()
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding(40)
        .padding(.vertical, 60)
}
