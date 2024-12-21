//
//  UsersViewModel.swift
//  UserHub
//
//  Created by Haqim Macbook on 21/12/24.
//

import Foundation
import Combine

@MainActor // to guarantee that all updates to the state are performed on the main thread
class UsersViewModel: ObservableObject {
    @Published var users: Resource<[User], Error> = .idle
    private var dataUsers: [User] = []
    
    private let repository: UserRepository
    init(repository: UserRepository = UserRepositoryImp()) {
        self.repository = repository
    }
    
    func fetchUsers() {
        users = .loading()
        Task {
            do {
                let users = try await repository.fetchUsers()
                self.users = .success(users)
                self.dataUsers = users
            } catch {
                self.users = .error(error)
                self.dataUsers = []
            }
        }
    }
    
    func findUser(keyword: String) {
        if keyword.isEmpty {
            users = .success(dataUsers)
        }
        else if case .success(let data) = users {
            users = .loading()
            let filteredUsers = data.filter{
                $0.name.lowercased().contains(keyword.lowercased()) || $0.username.lowercased().contains(keyword.lowercased())
            }
            users = .success(filteredUsers)
        }
    }
}
