//
//  Posts.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/29.
//

import Foundation

final class Posts<N: Networking>: Contents where N.R == PostRequest {
    typealias Content = Post
    
    var contents = Observable<[Content]>(value: [])
    var originalContents: [Content] = []  // this would hold all your contents
    
    private var networking: N
    
    init(networking: N = DefaultNetworking<PostRequest>()) {
        self.networking = networking
    }

    func setupAllContents() {
        contents.value = originalContents
    }
    
    func loadEntity() async throws {
        do {
            let request = PostRequest()
            let response: PostResponse = try await networking.request(request: request)
            let contents = response.posts
            if contents.isEmpty {
            } else {
                self.originalContents = contents
                setupAllContents()
            }
        } catch {
            // handle error
            throw error
        }
    }
    
    func updateEntity(_ newContents: [Content]) {
        contents.value = newContents
    }
    
    func filterContentForSearchText(_ searchText: String) {
        guard !searchText.isEmpty else {
            self.resetFilters()
            return
        }
        
        let filteredPosts = originalContents.filter { (content: Post) -> Bool in
            return content.title.lowercased().contains(searchText.lowercased())
        }
        contents.value = filteredPosts
    }
    
    func resetFilters() {
        setupAllContents()
    }
    
    deinit {
        contents.removeObserver()
    }
}
