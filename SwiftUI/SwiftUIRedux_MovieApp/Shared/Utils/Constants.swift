//
//  Constants.swift
//  ReduxAsync
//
//  Created by Yilong Chen on 9/18/24.
//

import Foundation

struct Constants {
    struct api {
        static let key = "564727fa"
    }
    
    struct Url {
        static func urlBySearch(_ search: String) -> String {
            return "http://www.omdbapi.com/?s=\(search)&page=1&apikey=\(api.key)"
        }
        static func urlForMovieDetailsByImdbId(_ imdbId: String) -> String {
            return "http://www.omdbapi.com/?i=\(imdbId)&apikey=\(api.key)"
        }
        static let moviesURL = "http://www.omdbapi.com/?s=Batman&page=2&apikey=\(api.key)"
    }
    
}
