//
//  HTTPClient.swift
//  GitHubSearchUsers
//
//  Created by Aurora on 29.08.24.
//

import Foundation

protocol HTTPClient {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}
