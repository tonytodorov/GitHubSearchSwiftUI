//
//  UserIntent.swift
//  GitHubSearchUsers
//
//  Created by Aurora on 04.09.24.
//

import Foundation

enum UserIntent {
    case getUsers(query: String, page: Int)
    case getUserDetails(username: String)
    case loadMoreUsers
}

