//
//  Comments.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/29.
//

import Foundation

final class Comments<N: Networking>: Contents<N, Comment, CommentRequest> where N.R == CommentRequest {
    
    var post: Post
    init(post:Post, networking: N) {
        self.post = post
        super.init(networking: networking)
    }
    
    override func loadEntity() async throws {
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
    
    override func filterEntityForSearchText(_ searchText: String) {
        if searchText.isEmpty {
            self.resetFilters()
            return
        }
        let filteredcontents = originalContents.filter { (content: Entity) -> Bool in
            return content.body.lowercased().contains(searchText.lowercased())
        }
        updateEntity(filteredcontents)
    }
    
    deinit {
        entity.removeObserver()
    }
}

