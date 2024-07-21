//
//  NewsArticle.swift
//  MovieApp
//
//  Created by Yilong Chen on 8/8/24.
//

import Foundation

struct NewsArticle: Decodable, Identifiable {
    let title: String
    let description: String
    let id = UUID()
    
    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
    }
}
