//
//  Post.swift
//  TiktokScrolling
//
//  Created by Brendan Miller on 2025-11-05.
//

import Foundation

struct Post: Codable, Identifiable {
    let id: String
    let videoFileName: String
    let title: String
}

struct PostsData: Codable {
    let posts: [Post]
}

class PostsLoader {
    static func loadPosts() -> [Post] {
        guard let url = Bundle.main.url(forResource: "posts", withExtension: "json") else {
            print("posts.json not found")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let postsData = try JSONDecoder().decode(PostsData.self, from: data)
            return postsData.posts
        } catch {
            print("Error loading posts: \(error)")
            return []
        }
    }
}
