//
//  UserClient.swift
//  UserHub
//
//  Created by Haqim Macbook on 21/12/24.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
}

let baseURL = "https://jsonplaceholder.typicode.com"
struct UserClient {
    
    func fetchUsers() async throws -> UserResponse {
        let (data, response) = try await URLSession.shared.data(
            from: URL(string: "\(baseURL)/users")!
        )
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let userResponse = try JSONDecoder().decode(UserResponse.self, from: data)
        return userResponse
    }
}
