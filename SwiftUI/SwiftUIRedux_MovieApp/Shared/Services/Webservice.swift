//
//  Webservice.swift
//  ReduxAsync
//
//  Created by Yilong Chen on 9/21/24.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case decodingError
    case noData
}

class Webservice {
    
    func getMoviesBySearch(search: String, completion: @escaping (Result<[Movie]?, NetworkError>) -> Void) {
        
        let search = search.replacingOccurrences(of: " ", with: "+")
        let url = URL(string: Constants.Url.urlBySearch(search))
        
        guard let moviesUrl = url else {
            completion(.failure(.badUrl))
            return
        }
        
        URLSession.shared.dataTask(with: moviesUrl) { data, _, error in
            
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            guard let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
                  else {
                completion(.failure(.decodingError))
                    return
            }
            
            completion(.success(movieResponse.movies))
            
        }.resume()
    }
    
    func getAllMovies(url: String, completion: @escaping (Result<[Movie], NetworkError>) -> Void) {
        
        guard let moviesUrl = URL(string: url) else {
            completion(.failure(.badUrl))
            return
        }
        
        URLSession.shared.dataTask(with: moviesUrl) { data, _, error in
            
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            guard let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
                  else {
                completion(.failure(.decodingError))
                    return
            }
            
            completion(.success(movieResponse.movies))
            
        }.resume()
        
    }
    
}
