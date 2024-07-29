//
//  User.swift
//  ReUI
//
//  Created by Om Preetham Bandi on 7/27/24.
//

import Foundation

struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let email, phone, username, password: String
    let birthDate: String
    let image: String
    let height, weight: Double
    
    var work: String {
        "Work"
    }
    var education: String {
        "Education"
    }
    var aboutMe: String {
        "About Me"
    }
    var basics: [UserInterest] {
        [
            UserInterest(iconName: "ruler", emoji: nil, text: "\(height)"),
            UserInterest(iconName: "graduationcap", emoji: nil, text: education),
            UserInterest(iconName: "wineglass", emoji: nil, text: "Socially"),
            UserInterest(iconName: "moon.starts.fill", emoji: nil, text: "Virgo")
        ]
    }
    var interests: [UserInterest] {
        [
            UserInterest(iconName: nil, emoji: "🤠", text: "\(height)"),
            UserInterest(iconName: nil, emoji: "😂", text: education),
            UserInterest(iconName: nil, emoji: "☎️", text: "Socially"),
            UserInterest(iconName: nil, emoji: "🥹", text: "Virgo")
        ]
    }
    var images: [String] {
        ["https://picsum.photos/500/500", "https://picsum.photos/700/700"]
    }
    
    static var mock: User {
        User(
            id: 123,
            firstName: "Om",
            lastName: "Bandi",
            maidenName: "",
            age: 76,
            email: "om@om.com",
            phone: "",
            username: "",
            password: "",
            birthDate: "",
            image: Constants.randomImage,
            height: 180,
            weight: 200
        )
    }
}

