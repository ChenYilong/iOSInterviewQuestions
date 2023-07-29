//
//  Posts.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/29.
//

import Foundation

final class Posts<N: Networking>: Contents<N, Post, PostRequest> where N.R == PostRequest {

    override init(networking: N) {
        super.init(networking: networking)
    }

    override func loadEntity() async throws {
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

    override func filterContentForSearchText(_ searchText: String) {
        guard !searchText.isEmpty else {
            self.resetFilters()
            return
        }

        let filteredPosts = originalContents.filter { (content: Post) -> Bool in
            return content.title.lowercased().contains(searchText.lowercased())
        }
        contents.value = filteredPosts
    }

}
