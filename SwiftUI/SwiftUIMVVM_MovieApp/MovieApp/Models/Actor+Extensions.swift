//
//  Actor+Extensions.swift
//  MovieApp
//
//  Created by Yilong Chen on 3/14/24.
//

import Foundation
import CoreData

extension Actor: BaseModel {
    
    static func getActorsByMovieId(movieId: NSManagedObjectID) -> [Actor] {
        guard let movie = Movie.byId(id: movieId) as? Movie,
              let actors = movie.actors
        else {
            return []
        }
        
        return (actors.allObjects as? [Actor]) ?? [] 
    }
    
}
