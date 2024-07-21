//
//  Movie.swift
//  HelloRedux
//
//  Created by Yilong Chen on 9/9/24.
//  Copyright © 2024 Yilong Chen. All rights reserved.
//

import Foundation

struct MovieResponse: Decodable {
    
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
    
}

struct Movie: Decodable {
    
    let title: String
    let imdbId: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case imdbId = "imdbID"
    }
    
}
