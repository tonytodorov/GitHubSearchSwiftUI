//
//  MainRepository.swift
//  GitHubSearchUsers
//
//  Created by Aurora on 21.08.24.
//

import Foundation

class MainRepository: GitHubUsersRepository {
    private let httpClient: HTTPClient

    init(httpClient: HTTPClient = URLSession.shared) {
        self.httpClient = httpClient
    }

    func fetchUsers(query: String, page: Int, perPage: Int = 20) async throws -> [UserInfo] {
        let url = try makeURL(from: URLService.searchUsers(query: query, page: page, perPage: perPage))
        let data = try await fetchData(from: url)
        
        return try JSONDecoder().decode(GHResponse.self, from: data).items
    }

    func fetchUserDetails(username: String) async throws -> UserDetailsInfo {
        let url = try makeURL(from: URLService.userDetails(username: username))
        let data = try await fetchData(from: url)
        
        return try JSONDecoder().decode(UserDetailsInfo.self, from: data)
    }

    private func makeURL(from optionalURL: URL?) throws -> URL {
        guard let url = optionalURL else {
            throw URLError(.badURL)
        }
        
        return url
    }

    private func fetchData(from url: URL) async throws -> Data {
        var request = URLRequest(url: url)
        request.setValue("Bearer \(GitHubAPI.token)", forHTTPHeaderField: "Authorization")

        let (data, response) = try await httpClient.data(for: request)
        try validateResponse(response)
        
        return data
    }

    private func validateResponse(_ response: URLResponse) throws {
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
    }
}

extension URLSession: HTTPClient {}
