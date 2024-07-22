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
    case networkError(Error)
}

class Webservice {
    func getMovieDetailsById(id: String, completion: @escaping (Result<MovieDetail?, NetworkError>) -> Void) {
        
        let url = URL(string: Constants.Url.urlForMovieDetailsByImdbId(id))
        
        guard let movieUrl = url else {
            completion(.failure(.badUrl))
            return
        }
        
        URLSession.shared.dataTask(with: movieUrl) { data, _, error in
            
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let movieDetail = try JSONDecoder().decode(MovieDetail.self, from: data)
                completion(.success(movieDetail))
            } catch {
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
    
    func getMoviesBySearch(search: String, completion: @escaping (Result<[Movie]?, NetworkError>) -> Void) {
        
        let search = search.replacingOccurrences(of: " ", with: "+")
        let url = URL(string: Constants.Url.urlBySearch(search))
        
        guard let moviesUrl = url else {
            completion(.failure(.badUrl))
            return
        }
        
        URLSession.shared.dataTask(with: moviesUrl) { data, _, error in
            
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(movieResponse.movies))
            } catch {
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
    
    func getAllMovies(url: String, completion: @escaping (Result<[Movie], NetworkError>) -> Void) {
        
        guard let moviesUrl = URL(string: url) else {
            completion(.failure(.badUrl))
            return
        }
        
        URLSession.shared.dataTask(with: moviesUrl) { data, _, error in
            
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(movieResponse.movies))
            } catch {
                completion(.failure(.decodingError))
            }
            
        }.resume()
        
    }
}
