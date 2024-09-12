//
//  DetailsScreen.swift
//  GitHubSearchUsers
//
//  Created by Aurora on 21.08.24.
//

import SwiftUI

struct DetailsScreen: View {
    private let userDetails: UserDetailsInfo
    
    init(user: UserDetailsInfo) {
        self.userDetails = user
    }
    
    var body: some View {
        NavigationView {
            List {
                profileImage
                detailRows
            }
            .listStyle(PlainListStyle())
            .listRowBackground(Rectangle().stroke(Color.gray, lineWidth: 1))
        }
        .navigationTitle(userDetails.login)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var profileImage: some View {
        AsyncImage(url: URL(string: userDetails.avatarURL)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .clipShape(Circle())
        } placeholder: {
            ProgressView()
                .frame(width: 120, height: 120)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    private var detailRows: some View {
        ForEach(detailRowsData, id: \.title) { detail in
            detailRow(title: detail.title, value: detail.value, isLink: detail.isLink)
        }
    }
    
    private var detailRowsData: [(title: String, value: String, isLink: Bool)] {
        [
            ("Login", userDetails.login, false),
            ("ID", "\(userDetails.id)", false),
            ("Node ID", userDetails.nodeID, false),
            ("Gravatar ID", userDetails.gravatarID, false),
            ("URL", userDetails.url, true),
            ("HTML URL", userDetails.htmlURL, true),
            ("Followers URL", userDetails.followersURL, true),
            ("Following URL", userDetails.followingURL, true),
            ("Gists URL", userDetails.gistsURL, true),
            ("Starred URL", userDetails.starredURL, true),
            ("Subscriptions URL", userDetails.subscriptionsURL, true),
            ("Organizations URL", userDetails.organizationsURL, true),
            ("Repos URL", userDetails.reposURL, true),
            ("Events URL", userDetails.eventsURL, true),
            ("Received Events URL", userDetails.receivedEventsURL, true),
            ("Type", userDetails.type, false),
            ("Site Admin", userDetails.siteAdmin ? "Yes" : "No", false),
            ("Name", userDetails.name ?? "N/A", false),
            ("Company", userDetails.company ?? "N/A", false),
            ("Blog", userDetails.blog.isEmpty ? "N/A" : userDetails.blog, true),
            ("Location", userDetails.location ?? "N/A", false),
            ("Email", userDetails.email ?? "N/A", false),
            ("Hireable", userDetails.hireable == nil ? "N/A" : (userDetails.hireable! ? "Yes" : "No"), false),
            ("Bio", userDetails.bio ?? "N/A", false),
            ("Twitter Username", userDetails.twitterUsername ?? "N/A", false),
            ("Public Repos", "\(userDetails.publicRepos)", false),
            ("Public Gists", "\(userDetails.publicGists)", false),
            ("Followers", "\(userDetails.followers)", false),
            ("Following", "\(userDetails.following)", false),
            ("Created At", userDetails.createdAt, false),
            ("Updated At", userDetails.updatedAt, false)
        ]
    }

    
    private func detailRow(title: String, value: String, isLink: Bool = false) -> some View {
        HStack {
            Text(title)
                .fontWeight(.bold)
            Spacer()
            if isLink, let url = URL(string: value) {
                Link(destination: url) {
                    HStack {
                        Image(systemName: "arrow.right")
                            .foregroundColor(.blue)
                            .imageScale(.large)
                    }
                }
                .buttonStyle(PlainButtonStyle())
            } else {
                Text(value)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.trailing)
            }
        }
        .padding(.vertical, 4)
    }
}
