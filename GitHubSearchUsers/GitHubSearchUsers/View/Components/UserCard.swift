//
//  UserCard.swift
//  GitHubSearchUsers
//
//  Created by Aurora on 22.08.24.
//

import SwiftUI

struct UserCard: View {
    let user: UserInfo
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: user.avatarURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
                    .frame(width: 80, height: 80)
            }
            Text(user.login)
                .padding(.leading, 10)
        }
        .padding(4)
    }
}
