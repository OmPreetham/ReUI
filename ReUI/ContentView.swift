//
//  ContentView.swift
//  ReUI
//
//  Created by Om Preetham Bandi on 7/27/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSpotify = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            Button("Open Spotify") {
                showingSpotify = true
            }
            .sheet(isPresented: $showingSpotify, content: {
                SpotifyHomeView()
            })
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        ContentView()
    }
}
