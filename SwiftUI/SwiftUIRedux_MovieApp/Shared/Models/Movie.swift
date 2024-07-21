//
//  Movie.swift
//  ReduxAsync
//
//  Created by Yilong Chen on 9/18/24.
//

import Foundation

struct MovieResponse: Codable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}


struct Movie: Codable {
    
    let title: String
    let imdbId: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case imdbId = "imdbID"
        case poster = "Poster"
    }
    
}
