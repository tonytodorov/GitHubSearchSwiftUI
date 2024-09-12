//
//  UserViewState.swift
//  GitHubSearchUsers
//
//  Created by Aurora on 21.08.24.
//

import Foundation

struct UserViewState {
    var users: [UserInfo] = []
    var loading: Bool = false
    var error: String? = nil
}
