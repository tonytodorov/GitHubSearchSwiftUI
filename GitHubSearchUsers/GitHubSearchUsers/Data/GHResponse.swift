//
//  GHReponse.swift
//  GitHubSearchUsers
//
//  Created by Aurora on 21.08.24.
//

import Foundation

struct GHResponse: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [UserInfo]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}
