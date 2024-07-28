//
//  SpotifyCategoryCell.swift
//  ReUI
//
//  Created by Om Preetham Bandi on 7/27/24.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    var title: String = "All"
    var isSelected: Bool = false
    
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .themeColors(isSelected: isSelected)
            .clipShape(RoundedRectangle(cornerRadius: 30.0))
    }
}

extension View {
    
    func themeColors(isSelected: Bool) -> some View {
        self
            .foregroundStyle(isSelected ? Color.spotifyBlack : Color.spotifyWhite)
            .background(isSelected ? Color.spotifyGreen : Color.spotifyDarkGray)
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        
        VStack(spacing: 40) {
            SpotifyCategoryCell()
            SpotifyCategoryCell(title: "Hello")
            SpotifyCategoryCell(isSelected: true)
        }
    }
}
