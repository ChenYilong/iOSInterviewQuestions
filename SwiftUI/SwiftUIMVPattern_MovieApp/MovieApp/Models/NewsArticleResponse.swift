//
//  NewsArticleResponse.swift
//  MovieApp
//
//  Created by Yilong Chen on 8/8/24.
//

import Foundation

struct NewsArticleResponse: Decodable {
    let articles: [NewsArticle]
}
