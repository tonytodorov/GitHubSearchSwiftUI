//
//  HomeScreen.swift
//  GitHubSearchUsers
//
//  Created by Aurora on 21.08.24.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject private var viewModel: MainViewModel
    @State private var searchQuery = ""
    @State private var selectedUser: UserInfo?
    @State private var showDetails = false
    
    init(viewModel: MainViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            content
        }
        .navigationTitle("GitHub Users")
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchQuery, prompt: "Enter name")
        .autocorrectionDisabled()
        .onSubmit(of: .search) {
            viewModel.handleIntent(.getUsers(query: searchQuery, page: 1))
        }
        .sheet(isPresented: $showDetails) {
            if let userDetails = viewModel.state.selectedUserDetails {
                DetailsScreen(user: userDetails)
            }
        }
    }
    
    @ViewBuilder
    private var content: some View {
        if viewModel.state.loading && viewModel.state.users.isEmpty {
            ProgressView()
        } else if let error = viewModel.state.error {
            Text("Error: \(error)")
                .foregroundColor(.red)
                .padding()
        } else {
            UserList(
                users: viewModel.state.users,
                loadMoreUsers: {
                    viewModel.handleIntent(.loadMoreUsers)
                },
                onSelectUser: { user in
                    selectedUser = user
                    viewModel.handleIntent(.getUserDetails(username: user.login))
                    showDetails = true
                }
            )
        }
    }
}
