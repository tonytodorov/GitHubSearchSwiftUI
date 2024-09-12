//
//  MainViewModel.swift
//  GitHubSearchUsers
//
//  Created by Aurora on 21.08.24.
//

import SwiftUI

class MainViewModel: GitHubUsers {
    @Published private(set) var state = MainViewState()
    
    private let repository: GitHubUsersRepository
    
    init(repository: GitHubUsersRepository) {
        self.repository = repository
    }
    
    func handleIntent(_ intent: UserIntent) {
        switch intent {
        case .getUsers(let query, let page):
            getUsers(query: query, page: page)
        case .loadMoreUsers:
            loadMoreUsers()
        case .getUserDetails(let username):
            getUserDetails(username: username)
        }
    }
    
    internal func getUsers(query: String, page: Int = 1) {
        guard !state.loading else { return }
        updateLoading(true)
        Task {
            do {
                let fetchedUsers = try await repository.fetchUsers(query: query, page: page, perPage: 20)
                updateUsers(fetchedUsers, for: query, at: page)
            } catch {
                handleError(error)
            }
        }
    }
    
    internal func loadMoreUsers() {
        guard let currentQuery = state.currentQuery, state.hasMoreUsers else { return }
        getUsers(query: currentQuery, page: state.currentPage + 1)
    }
    
    internal func getUserDetails(username: String) {
        updateLoading(true)
        Task {
            do {
                let userDetails = try await repository.fetchUserDetails(username: username)
                DispatchQueue.main.async {
                    self.state.selectedUserDetails = userDetails
                    self.state.loading = false
                }
            } catch {
                handleError(error)
            }
        }
    }
    
    private func updateUsers(_ fetchedUsers: [UserInfo], for query: String, at page: Int) {
        DispatchQueue.main.async {
            if page == 1 {
                self.state.users = fetchedUsers
            } else {
                self.state.users += fetchedUsers
            }
            self.state.currentQuery = query
            self.state.hasMoreUsers = !fetchedUsers.isEmpty
            self.state.currentPage = page
            self.state.loading = false
        }
    }
    
    private func updateLoading(_ isLoading: Bool) {
        DispatchQueue.main.async {
            self.state.loading = isLoading
        }
    }
    
    private func handleError(_ error: Error) {
        DispatchQueue.main.async {
            self.state.loading = false
            self.state.error = error.localizedDescription
        }
    }
}
