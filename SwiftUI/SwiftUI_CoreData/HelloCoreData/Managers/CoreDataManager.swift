//
//  CoreDataManager.swift
//  HelloCoreData
//
//  Created by Yilong Chen on 2/8/24.
//

import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "HelloCoreData")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data store failed to initialize \(error.localizedDescription)")
            }
        }
        
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print(dirPaths[0])
    }
    
    func getAllMovies() -> [Movie] {
        
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return [] 
        }
    }
    
    func saveMovie(name: String) {
        
        let movie = Movie(context: persistentContainer.viewContext)
    
        movie.title = name
        
        do {
            try persistentContainer.viewContext.save()
            print("Movie Saved Successfully")
        } catch {
            print("Failed to save movie \(error)")
        }
    }
    
}
