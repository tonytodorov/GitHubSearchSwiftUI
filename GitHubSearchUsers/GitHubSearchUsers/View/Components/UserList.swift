//
//  UserList.swift
//  GitHubSearchUsers
//
//  Created by Aurora on 22.08.24.
//

import SwiftUI

struct UserList: View {
    let users: [UserInfo]
    let loadMoreUsers: () -> Void
    let onSelectUser: (UserInfo) -> Void
    
    var body: some View {
        List(users) { user in
            UserCard(user: user)
                .onTapGesture {
                    onSelectUser(user)
                }
                .onAppear {
                    if users.lastIndex(of: user) == users.count - 5 {
                        loadMoreUsers()
                    }
                }
                .listRowBackground(
                    Rectangle()
                        .stroke(Color.gray, lineWidth: 1))
        }
        .listStyle(PlainListStyle())
    }
}


