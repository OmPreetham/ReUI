//
//  BumbleChatsView.swift
//  ReUI
//
//  Created by Om Preetham Bandi on 7/28/24.
//

import SwiftUI

struct BumbleChatsView: View {
    @State private var allUsers: [User] = []
    
    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding(16)
                
                matchQueueSection
                    .padding(.vertical, 16)

                
                recentsChatSection
            }
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        guard allUsers.isEmpty else { return }
        
        do {
            allUsers = try await DatabaseHelper().getUsers()
        } catch {
            // Handle the error appropriately
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Image(systemName: "line.horizontal.3")
            Spacer(minLength: 0)
            Image(systemName: "magnifyingglass")
        }
        .font(.title)
        .fontWeight(.medium)
    }
    
    private var matchQueueSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                Text("Match Queue")
                +
                Text(" (\(allUsers.count))")
                    .foregroundStyle(.bumbleGray)
            }
            .padding(.horizontal, 16)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    ForEach(allUsers) { user in
                        BumbleProfileImageCell(
                            imageName: user.image,
                            percentageRemaining: Double.random(in: 0...1),
                            hasNewMessage: Bool.random()
                        )
                    }
                }
                .padding(.leading, 16)
            }
            .scrollIndicators(.hidden)
            .frame(height: 100)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var recentsChatSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 0) {
                Group {
                    Text("Chats")
                    +
                    Text(" (Recent)")
                        .foregroundStyle(.bumbleGray)
                }
                
                Spacer(minLength: 0)
                
                Image(systemName: "line.horizontal.3.decrease")
                    .font(.title)
            }
            .padding(.horizontal, 16)
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 16) {
                    ForEach(allUsers) { user in
                        BumbleChatPreviewCell(
                            imageName: user.image,
                            percentageRemaining: Double.random(in: 0...1),
                            hasNewMessage: Bool.random(),
                            userName: user.firstName,
                            lastChatMessage: user.aboutMe,
                            isYourMove: Bool.random()
                        )
                    }
                }
                .padding(16)
            }
            .scrollIndicators(.hidden)
        }
        .frame(maxWidth: .infinity, alignment: .leading)

    }
}

#Preview {
    BumbleChatsView()
}
