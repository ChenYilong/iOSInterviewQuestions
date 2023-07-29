//
//  Comments.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/29.
//

import Foundation

final class Comments<N: Networking>: Contents where N.R == CommentRequest {
    typealias Content = Comment
    var contents = Observable<[Content]>(value: [])
    var originalContents: [Content] = []  // this would hold all your contents
    
    private var networking: N
    var post: Post
    init(post:Post, networking: N = DefaultNetworking<CommentRequest>()) {
        self.networking = networking
        self.post = post
    }

    func setupAllContents() {
        contents.value = originalContents
    }
    
    func loadEntity() async throws {
        do {
            let request = CommentRequest(id: post.id)
            let response: CommentResponse = try await networking.request(request: request)
            let contents = response.comments
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
        if searchText.isEmpty {
            self.resetFilters()
            return
        }
        let filteredcontents = originalContents.filter { (content: Content) -> Bool in
            return content.body.lowercased().contains(searchText.lowercased())
        }
        updateEntity(filteredcontents)
    }
    
    func resetFilters() {
        setupAllContents()
    }
    
    deinit {
        contents.removeObserver()
    }
}

