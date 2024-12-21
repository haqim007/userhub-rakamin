//
//  UserRepository.swift
//  UserHub
//
//  Created by Haqim Macbook on 21/12/24.
//

import Foundation

protocol UserRepository {
    func fetchUsers() -> [User]
}

