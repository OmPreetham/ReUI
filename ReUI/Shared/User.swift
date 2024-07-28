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

