# GitHub User Search App

A simple iOS application built with **Swift** and **SwiftUI** that allows users to search for GitHub users and display them in a table-like UI with their profile picture and username.

## Features
- Search for GitHub users in real-time
- Display search results in a table format
- Show user profile pictures and usernames
- Navigate to user details (if applicable)

## Technologies Used
- **Swift**: Primary language for iOS development
- **SwiftUI**: Modern UI framework for building declarative interfaces
- **Combine**: Framework for handling asynchronous operations and data binding
- **URLSession**: For making network requests to the GitHub API
- **Codable**: For decoding JSON responses
- **AsyncImage**: For loading and displaying user avatars
- **NavigationStack**: For handling navigation between views
- **List & LazyVStack**: For efficiently displaying user data
- **ProgressView**: For showing loading indicators
- **MVVM Architecture**: For better separation of concerns
- **XCTest**: For unit testing

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/your-username/github-user-search-app.git
   ```
2. Open the project in **Xcode** (latest stable version recommended)
3. Build and run the project on a simulator or physical device

## API Integration
This app fetches user data from the **GitHub API**. Make sure you have a valid GitHub API key (if needed for rate limits) and update it in the appropriate API client file:
```swift
let githubAPIBaseURL = "https://api.github.com/"
let githubAPIToken = "your_personal_access_token"
```

## Future Enhancements
- Add user detail screen with additional information
- Implement pagination for better performance
- Improve UI/UX with animations and better styling
