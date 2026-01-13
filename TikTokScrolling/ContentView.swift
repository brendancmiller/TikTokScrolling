//
//  ContentView.swift
//  TiktokScrolling
//
//  Created by Brendan Miller on 2025-11-05.
//

import SwiftUI

struct ContentView: View {
    //@State private var posts: [Post]
    var body: some View {
        TabView{
            FeedView(posts: PostsLoader.loadPosts())
            
        }
    }
    

}


#Preview {
    FeedView(posts: PostsLoader.loadPosts())
}
