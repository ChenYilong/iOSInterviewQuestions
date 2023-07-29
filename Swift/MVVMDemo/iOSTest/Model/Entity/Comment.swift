//
//  Post.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/2.
//

import Foundation

struct Comment: Codable, Identifiable {
    let postId: Int
    let id: Int
    let name: String
    let body: String
    let email: String
}

extension Comment: ContentModel {
    var title: String {
        return name // we'll use 'name' as 'title' for Comment
    }
    // no additional implementation needed
}
