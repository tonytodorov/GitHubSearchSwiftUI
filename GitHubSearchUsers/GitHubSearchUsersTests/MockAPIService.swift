//
//  MockAPIService.swift
//  GitHubSearchUsersTests
//
//  Created by Aurora on 29.08.24.
//

import Foundation
@testable import GitHubSearchUsers

class MockAPIService: HTTPClient {
    var data: Data?
    var response: URLResponse?
    var error: Error?

    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        if let error = error {
            throw error
        }
        return (data ?? Data(), response ?? URLResponse())
    }
}
