//
//  URLService.swift
//  GitHubSearchUsers
//
//  Created by Aurora on 27.08.24.
//

import Foundation

struct URLService {
    static func searchUsers(query: String, page: Int, perPage: Int) -> URL? {
        let urlString = "\(GitHubAPI.baseURL)search/users?q=\(query)&page=\(page)&per_page=\(perPage)"
        return URL(string: urlString)
    }

    static func userDetails(username: String) -> URL? {
        let urlString = "\(GitHubAPI.baseURL)users/\(username)"
        return URL(string: urlString)
    }
}
