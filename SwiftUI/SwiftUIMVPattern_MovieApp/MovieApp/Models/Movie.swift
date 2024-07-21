//
//  Movie.swift
//  MovieApp
//
//  Created by Yilong Chen on 8/8/24.
//

import Foundation

struct Movie: Decodable, Identifiable, Hashable {
    
    let imdbId: String
    let title: String
    let poster: URL
    
    var id: String {
        imdbId
    }
    
    private enum CodingKeys: String, CodingKey {
        case imdbId = "imdbID"
        case title = "Title"
        case poster = "Poster"
    }
}

extension Movie {
    static var preview: Movie {
        Movie(imdbId: "tt3896198", title: "Guardians of the Galaxy Vol. 2", poster: URL(string: "https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg")!)
    }
}
