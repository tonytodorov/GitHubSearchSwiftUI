//
//  APIServiceTest.swift
//  GitHubSearchUsersTests
//
//  Created by Aurora on 29.08.24.
//

import XCTest
@testable import GitHubSearchUsers

final class APIServiceTest: XCTestCase {
    var mockClient: MockAPIService!
    var repository: MainRepository!

    override func setUp() {
        mockClient = MockAPIService()
        repository = MainRepository(httpClient: mockClient)
    }

    override func tearDown() {
        mockClient = nil
        repository = nil
    }

    func testFetchUsersSuccess() async throws {
        let jsonString = Users.init().users
        
        mockClient.data = jsonString.data(using: .utf8)
        mockClient.response = HTTPURLResponse(url: URL(string: "https://api.github.com/search/users")!,
                                               statusCode: 200,
                                               httpVersion: nil,
                                               headerFields: nil)

        let users = try await repository.fetchUsers(query: "asdfeq", page: 1)
        XCTAssertEqual(users.count, 10)
    }

    func testFetchUsersFailure() async throws {
        mockClient.error = URLError(.badServerResponse)

        do {
            _ = try await repository.fetchUsers(query: "asdfeq", page: 1)
            XCTFail("Expected to throw an error, but no error was thrown.")
        } catch {
            XCTAssertEqual((error as? URLError)?.code, .badServerResponse)
        }
    }
}
