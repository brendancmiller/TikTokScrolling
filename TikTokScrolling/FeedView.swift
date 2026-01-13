//
//  FeedView.swift
//  TiktokScrolling
//
//  Created by Brendan Miller on 2025-11-05.
//

import SwiftUI

struct FeedView: View {
    let posts: [Post]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(posts) { post in
                    PostView(
                        videoFileName: post.videoFileName,
                        title: post.title
                    )
                    .id(post.id)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
    }
}

#Preview {
    FeedView(posts: PostsLoader.loadPosts())
}
