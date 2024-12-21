//
//  UserClient.swift
//  UserHub
//
//  Created by Haqim Macbook on 21/12/24.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case sslError(description: String)
}

let baseURL = "https://jsonplaceholder.typicode.com"
struct UserClient {
    
    func fetchUsers() async throws -> [UserResponse] {
        do {
            let (data, response) = try await URLSession.shared.data(from: URL(string: "\(baseURL)/users")!)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NetworkError.invalidResponse
            }
            
            let userResponse = try JSONDecoder().decode([UserResponse].self, from: data)
            return userResponse
            
        } catch let error as NSError {
            // Check if the error is related to SSL
            if isSSLError(error) {
                throw NetworkError.sslError(description: "An SSL error occurred. \(error.localizedDescription)")
            } else {
                throw error
            }
        }
    }
    
    private func isSSLError(_ error: NSError) -> Bool {
        return error.domain == NSURLErrorDomain && error.code == -1200
    }
}
