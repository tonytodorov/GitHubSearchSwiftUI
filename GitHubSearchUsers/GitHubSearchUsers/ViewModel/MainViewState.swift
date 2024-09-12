//
//  MainViewState.swift
//  GitHubSearchUsers
//
//  Created by Aurora on 4.09.24.
//

import Foundation

struct MainViewState {
    var users: [UserInfo] = []
    var loading: Bool = false
    var error: String? = nil
    var selectedUserDetails: UserDetailsInfo? = nil
    var currentPage: Int = 1
    var currentQuery: String?
    var hasMoreUsers: Bool = true
}
