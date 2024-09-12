//
//  GitHubUsers.swift
//  GitHubSearchUsers
//
//  Created by Aurora on 27.08.24.
//

import Foundation

protocol GitHubUsers: ObservableObject {
    func getUsers(query: String, page: Int)
    func getUserDetails(username: String)
    func loadMoreUsers()
}
