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
struct User: Identifiable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let smallAvatar, largeAvatar: String
}

// MARK: - Address
struct Address {
    let street, suite, city, zipcode: String
}


let dummyUsers: [User] = [
    User(id: 1, name: "Alice Johnson", username: "alice.j", email: "alice.johnson@email.com",
         address: Address(street: "123 Main St", suite: "Apt 4B", city: "Springfield", zipcode: "12345"),
         phone: "+1 555-1234", website: "https://alicejohnson.com",
         smallAvatar: "https://i.pravatar.cc/150?img=1", largeAvatar: "https://i.pravatar.cc/1000?img=1"),
    
    User(id: 2, name: "Bob Smith", username: "bob_smith", email: "bob.smith@email.com",
         address: Address(street: "456 Elm St", suite: "Apt 2C", city: "Greenville", zipcode: "54321"),
         phone: "+1 555-5678", website: "https://bobsmith.org",
         smallAvatar: "https://i.pravatar.cc/150?img=2", largeAvatar: "https://i.pravatar.cc/1000?img=2"),
    
    User(id: 3, name: "Charlie Brown", username: "charlie.b", email: "charlie.brown@email.com",
         address: Address(street: "789 Oak St", suite: "Suite 3D", city: "Riverdale", zipcode: "67890"),
         phone: "+1 555-8765", website: "https://charliebrown.dev",
         smallAvatar: "https://i.pravatar.cc/150?img=3", largeAvatar: "https://i.pravatar.cc/1000?img=3"),
    
    User(id: 4, name: "David Lee", username: "david_lee", email: "david.lee@email.com",
         address: Address(street: "135 Pine St", suite: "Suite 1A", city: "Lakeside", zipcode: "11223"),
         phone: "+1 555-2345", website: "https://davidlee.io",
         smallAvatar: "https://i.pravatar.cc/150?img=4", largeAvatar: "https://i.pravatar.cc/1000?img=4"),
    
    User(id: 5, name: "Eva Green", username: "eva.green", email: "eva.green@email.com",
         address: Address(street: "246 Birch St", suite: "Apt 5E", city: "Mountainview", zipcode: "33445"),
         phone: "+1 555-6789", website: "https://evagreen.com",
         smallAvatar: "https://i.pravatar.cc/150?img=5", largeAvatar: "https://i.pravatar.cc/1000?img=5"),
    
    User(id: 6, name: "Frank Miller", username: "frank_miller", email: "frank.miller@email.com",
         address: Address(street: "357 Maple St", suite: "Suite 6B", city: "Hilltop", zipcode: "55667"),
         phone: "+1 555-3456", website: "https://frankmiller.net",
         smallAvatar: "https://i.pravatar.cc/150?img=6", largeAvatar: "https://i.pravatar.cc/1000?img=6"),
    
    User(id: 7, name: "Grace Adams", username: "grace.a", email: "grace.adams@email.com",
         address: Address(street: "468 Cedar St", suite: "Apt 7F", city: "Greenwich", zipcode: "77889"),
         phone: "+1 555-4567", website: "https://graceadams.com",
         smallAvatar: "https://i.pravatar.cc/150?img=7", largeAvatar: "https://i.pravatar.cc/1000?img=7"),
    
    User(id: 8, name: "Henry Wilson", username: "henry_wilson", email: "henry.wilson@email.com",
         address: Address(street: "579 Redwood St", suite: "Suite 8C", city: "Sunnydale", zipcode: "99001"),
         phone: "+1 555-2345", website: "https://henrywilson.org",
         smallAvatar: "https://i.pravatar.cc/150?img=8", largeAvatar: "https://i.pravatar.cc/1000?img=8"),
    
    User(id: 9, name: "Ivy Clark", username: "ivy_clark", email: "ivy.clark@email.com",
         address: Address(street: "680 Ash St", suite: "Apt 9D", city: "Riverside", zipcode: "10222"),
         phone: "+1 555-6780", website: "https://ivyclark.dev",
         smallAvatar: "https://i.pravatar.cc/150?img=9", largeAvatar: "https://i.pravatar.cc/1000?img=9"),
    
    User(id: 10, name: "Jack Turner", username: "jack.turner", email: "jack.turner@email.com",
         address: Address(street: "791 Fir St", suite: "Suite 10E", city: "Baytown", zipcode: "22334"),
         phone: "+1 555-8901", website: "https://jackturner.info",
         smallAvatar: "https://i.pravatar.cc/150?img=10", largeAvatar: "https://i.pravatar.cc/1000?img=10")
]

