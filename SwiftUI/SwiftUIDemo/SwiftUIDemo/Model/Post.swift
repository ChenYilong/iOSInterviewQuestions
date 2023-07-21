//
//  Post.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/2.
//

import Foundation

struct Post: Codable, Identifiable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}

extension Post: ContentModel {
    // no additional implementation needed, as Post already conforms to ContentModel
}
