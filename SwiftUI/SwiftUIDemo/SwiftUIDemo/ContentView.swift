//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by chenyilong on 2023/7/17.
//

import SwiftUI

struct ContentView: View {
    @State var posts: [Post] = [
        Post(id: 1, userId: 1, title: "First Post", body: "This is the body of the first post"),
        Post(id: 2, userId: 1, title: "Second Post", body: "This is the body of the second post"),
        // more posts...
    ]

    var body: some View {
        NavigationView {
            List(posts) { post in
                NavigationLink(destination: PostDetailView(post: post)) {
                    PostRow(post: post)
                }
            }
            .navigationTitle("Posts")
        }
    }
}

struct PostRow: View {
    var post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(post.title)
                .font(.headline)
            Text(post.body)
                .font(.subheadline)
        }
        .onTapGesture {
            print("Post \(post.id) tapped!")
        }
    }
}

struct PostDetailView: View {
    var post: Post

    var body: some View {
        VStack {
            Text(post.title)
                .font(.title)
            Text(post.body)
                .font(.body)
        }
        .padding()
        .navigationTitle("Post Detail")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
