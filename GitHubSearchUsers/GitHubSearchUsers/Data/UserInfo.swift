//
//  UserInfo.swift
//  GitHubSearchUsers
//
//  Created by Aurora on 21.08.24.
//

import Foundation

struct UserInfo: Codable, Identifiable, Equatable, Hashable {
    let id: Int
    let login: String
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarURL = "avatar_url"
    }
}
