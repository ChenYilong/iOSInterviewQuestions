//
//  Webservice.swift
//  MovieApp
//
//  Created by Yilong Chen on 8/8/24.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case invalidRequest
}

class Webservice {
    
    func loadMovies() async throws -> [Movie] {
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=Batman&page=2&apikey=564727fa") else {
            throw NetworkError.badUrl
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
        return movieResponse?.search ?? []
    }
    
    func loadMovieBy(_ movieId: String) async throws -> MovieDetail {
        
        guard let url = URL(string: "http://www.omdbapi.com/?i=\(movieId)&apikey=564727fa") else {
            throw NetworkError.badUrl
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let movieDetail = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
            throw NetworkError.invalidRequest
        }
        
        return movieDetail
    }
    
    func loadNewsArticleBy(_ keyword: String) async throws -> [NewsArticle] {
        
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=\(keyword)&apiKey=0cf790498275413a9247f8b94b3843fd&pageSize=10") else {
            throw NetworkError.badUrl
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let newsArticleResponse = try? JSONDecoder().decode(NewsArticleResponse.self, from: data) else {
            throw NetworkError.invalidRequest
        }
        
        return newsArticleResponse.articles
    }
    
}
