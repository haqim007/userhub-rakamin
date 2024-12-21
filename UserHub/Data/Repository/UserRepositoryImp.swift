//
//  UserRepositoryImp.swift
//  UserHub
//
//  Created by Haqim Macbook on 21/12/24.
//

import Foundation

final class UserRepositoryImp: UserRepository {
    
    let client: UserClient
    
    init(client: UserClient = UserClient()) {
        self.client = client
    }
    func fetchUsers() async throws -> [User] {
        let response = try await client.fetchUsers()
        let users = response.map { item in
            User(
                id: item.id,
                name: item.name,
                username: item.username,
                email: item.email,
                address: Address(street: item.address.street, suite: item.address.suite, city: item.address.city, zipcode: item.address.zipcode),
                phone:item.phone,
                website: item.website,
                smallAvatar: "https://i.pravatar.cc/150?img=\(item.id)",
                largeAvatar: "https://i.pravatar.cc/1000?img=\(item.id)"
            )
        }
        return users
    }
}
