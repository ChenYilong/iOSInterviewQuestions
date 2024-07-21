//
//  AddActorViewModel.swift
//  MovieApp
//
//  Created by Yilong Chen on 3/14/24.
//

import Foundation
import CoreData

class AddActorViewModel: ObservableObject {
    
    var name: String = ""
    
    func addActorToMovie(movieId: NSManagedObjectID) {
        
        let movie: Movie? = Movie.byId(id: movieId)
        
        if let movie = movie {
            let actor = Actor(context: Actor.viewContext)
            actor.name = name
            actor.addToMovies(movie)
            
            try? actor.save()
        }
        
    }
    
}
