//
//  NetflixMovieDetailsView.swift
//  ReUI
//
//  Created by Om Preetham Bandi on 7/30/24.
//

import SwiftUI

struct NetflixMovieDetailsView: View {
    var product: Product = .mock
    
    @State private var progress: Double = 0.2
    @State private var isMyList: Bool = false
    
    @State private var products: [Product] = []
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            Color.netflixDarkGray.opacity(0.3).ignoresSafeArea()
            
            VStack(spacing: 0) {
                NetflixDetailsHeaderView(
                    imageName: product.firstImage,
                    progress: progress,
                    onAirplayPressed: {
                        
                    },
                    onXmarkPressed: {
                        
                    }
                )
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 16) {
                        NetflixDetailsProductView(
                            title: product.title,
                            isNew: true,
                            yearReleased: "2024",
                            isTopTen: 4,
                            seasonCount: 6,
                            hasClosedCaptions: true,
                            descriptionText: product.description,
                            caseText: "Cast: Om, Nirdesh",
                            onPlayPressed: {
                                
                            },
                            onDownloadPressed: {
                                
                            }
                        )
                        
                        HStack(spacing: 32) {
                            MyListButton(
                                isMyList: isMyList,
                                onButtonPressed: {
                                    isMyList.toggle()
                                }
                            )
                            RateButton(onRatingSelected: { selection in
                                
                            })
                            
                            ShareButton()
                        }
                        .padding(.leading, 32)
                        
                        VStack(alignment: .leading) {
                            Text("More Like This")
                                .font(.headline)
                            
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), alignment: .center, spacing: 8, pinnedViews: []) {
                                ForEach(products) { product in
                                    NetflixMovieCell(
                                        imageName: product.firstImage,
                                        title: product.title,
                                        isRecentlyAdded: product.recentlyAdded,
                                        topTenRanking: nil
                                    )

                                }
                            }
                        }
                        .foregroundStyle(.netflixWhite)
                    }
                    .padding(8)
                }
                .scrollIndicators(.hidden)
            }
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        guard products.isEmpty else { return }

        do {
            products = try await DatabaseHelper().getProducts()
        } catch {
            // Handle the error appropriately
        }
    }
}

#Preview {
    NetflixMovieDetailsView()
}
