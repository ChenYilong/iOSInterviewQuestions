//
//  MovieResponse.swift
//  MovieApp
//
//  Created by Yilong Chen on 8/8/24.
//

import Foundation

struct MovieResponse: Decodable {
    let search: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
}
