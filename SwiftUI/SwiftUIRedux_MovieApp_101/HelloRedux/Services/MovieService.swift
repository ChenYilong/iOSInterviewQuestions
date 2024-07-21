//
//  MovieService.swift
//  HelloRedux
//
//  Created by Yilong Chen on 9/9/24.
//  Copyright © 2024 Yilong Chen. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case decodingError
    case noData
}

class MovieService {
    
    func getMovies(url: String, completion: @escaping (Result<[Movie],NetworkError>) -> Void) {
        
        guard let moviesURL = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: moviesURL) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
            if let movieResponse = movieResponse {
                completion(.success(movieResponse.movies))
            } else {
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
    
}

