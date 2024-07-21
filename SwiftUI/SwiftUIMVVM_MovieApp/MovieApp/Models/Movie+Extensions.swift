//
//  Movie+Extensions.swift
//  MovieApp
//
//  Created by Yilong Chen on 3/11/24.
//

import Foundation
import CoreData

extension Movie: BaseModel {
    
    static func byActorName(name: String) -> [Movie] {
        
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.predicate = NSPredicate(format: "actors.name CONTAINS %@", name)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            print(error)
            return []
        }
        
    }
    
}
