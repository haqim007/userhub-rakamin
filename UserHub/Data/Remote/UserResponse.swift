//
//  User.swift
//  UserHub
//
//  Created by Haqim Macbook on 21/12/24.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let user = try? JSONDecoder().decode(User.self, from: jsonData)

import Foundation

// MARK: - User
struct UserResponse: Codable {
    let id: Int
    let name, username, email: String
    let address: AddressResponse
    let phone, website: String
    let company: CompanyResponse
}

// MARK: - Address
struct AddressResponse: Codable {
    let street, suite, city, zipcode: String
    let geo: GeoResponse
}

// MARK: - Geo
struct GeoResponse: Codable {
    let lat, lng: String
}

// MARK: - Company
struct CompanyResponse: Codable {
    let name, catchPhrase, bs: String
}
