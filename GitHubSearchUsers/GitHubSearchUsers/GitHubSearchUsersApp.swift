//
//  GitHubSearchUsersApp.swift
//  GitHubSearchUsers
//
//  Created by Aurora on 21.08.24.
//

import SwiftUI

@main
struct GitHubSearchUsersApp: App {
    @StateObject private var viewModel = MainViewModel(repository: MainRepository())
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeScreen(viewModel: viewModel)
            }
        }
    }
}
