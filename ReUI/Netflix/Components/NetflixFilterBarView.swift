//
//  NetflixFilterBarView.swift
//  ReUI
//
//  Created by Om Preetham Bandi on 7/29/24.
//

import SwiftUI

struct FilterModal: Hashable, Equatable {
    let title: String
    let isDropdown: Bool
    
    static var mockArray: [FilterModal] {
        [
            FilterModal(title: "TV Shows", isDropdown: false),
            FilterModal(title: "Movies", isDropdown: false),
            FilterModal(title: "Categories", isDropdown: true)
        ]
    }
}

struct NetflixFilterBarView: View {
    var filters: [FilterModal] = FilterModal.mockArray
    
    var selectedFilter: FilterModal? = nil
    var onFilterPressed: ((FilterModal) -> Void)? = nil
    var onXMarkPressed: (() -> Void)? = nil
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                if selectedFilter != nil {
                    Image(systemName: "xmark")
                        .padding(8)
                        .background(
                            Circle()
                                .stroke(lineWidth: 1.0)
                        )
                        .foregroundStyle(.netflixLightGray)
                        .onTapGesture {
                            onXMarkPressed?()
                        }
                        .transition(AnyTransition.move(edge: .leading))
                        .padding(.leading, 16)
                }
                
                ForEach(filters, id: \.self) { filter in
                    if selectedFilter == nil || selectedFilter == filter {
                        NetflixFilterCell(
                            title: filter.title,
                            isDropdown: filter.isDropdown,
                            isSelected: selectedFilter == filter
                        )
                        .background(Color.black.opacity(0.001))
                        .onTapGesture {
                            onFilterPressed?(filter)
                        }
                        .padding(.leading, (selectedFilter == nil) && (filter == filters.first) ? 16 : 0)
                        
                    }
                }
            }
            .padding(.vertical, 4)
        }
        .scrollIndicators(.hidden)
        .animation(.bouncy, value: selectedFilter)
    }
}

fileprivate struct NetflixFilterBarPreview: View {
    @State private var filters = FilterModal.mockArray
    @State private var selectedFilter: FilterModal? = nil
    
    var body: some View {
        NetflixFilterBarView(
            filters: filters,
            selectedFilter: selectedFilter,
            onFilterPressed: { newFilter in
                selectedFilter = newFilter
            },
            onXMarkPressed: {
                selectedFilter = nil
            }
        )
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        NetflixFilterBarPreview()
    }
}
