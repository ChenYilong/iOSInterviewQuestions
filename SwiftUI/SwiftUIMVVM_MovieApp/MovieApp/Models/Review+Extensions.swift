//
//  Review+Extensions.swift
//  MovieApp
//
//  Created by Yilong Chen on 3/3/24.
//

import Foundation
import CoreData

extension Review: BaseModel {
    
    static func getReviewsByMovieId(movieId: NSManagedObjectID) -> [Review] {
        
        let request: NSFetchRequest<Review> = Review.fetchRequest()
        request.predicate = NSPredicate(format: "movie = %@", movieId)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return [] 
        }
        
    }
    
}
