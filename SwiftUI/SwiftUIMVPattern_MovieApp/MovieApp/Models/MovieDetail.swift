//
//  MovieDetail.swift
//  MovieApp
//
//  Created by Yilong Chen on 8/8/24.
//

import Foundation

struct MovieDetail: Decodable, Identifiable {
    
    let imdbId: String
    let title: String
    let poster: URL
    let director: String
    
    var id: String {
        imdbId
    }
    
    private enum CodingKeys: String, CodingKey {
        case imdbId = "imdbID"
        case title = "Title"
        case poster = "Poster"
        case director = "Director"
    }
    
}
