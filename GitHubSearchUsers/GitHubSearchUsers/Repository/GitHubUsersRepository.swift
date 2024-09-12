//
//  GitHubUsersRepository.swift
//  GitHubSearchUsers
//
//  Created by Aurora on 27.08.24.
//

import Foundation

protocol GitHubUsersRepository {
    func fetchUsers(query: String, page: Int, perPage: Int) async throws -> [UserInfo]
    func fetchUserDetails(username: String) async throws -> UserDetailsInfo
}
