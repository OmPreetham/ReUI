//
//  ContentView.swift
//  ReUI
//
//  Created by Om Preetham Bandi on 7/27/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSpotify = false
    @State private var showingBumble = false
    @State private var showingNetflix = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                Button("Open Spotify") {
                    showingSpotify = true
                }
                .sheet(isPresented: $showingSpotify, content: {
                    SpotifyHomeView()
                })
                
                Button("Open Bumble") {
                    showingBumble = true
                }
                .sheet(isPresented: $showingBumble, content: {
                    BumbleHomeView()
                })          
                
                Button("Open Netflix") {
                    showingNetflix = true
                }
                .sheet(isPresented: $showingNetflix, content: {
                    NetflixHomeView()
                })
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        ContentView()
    }
}
