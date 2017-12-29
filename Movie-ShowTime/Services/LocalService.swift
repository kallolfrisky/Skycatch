//
//  LocalService.swift
//  Movie-ShowTime
//
//  Created by Najmul Hasan on 12/28/17.
//  Copyright © 2017 Najmul Hasan. All rights reserved.
//

import Foundation
import CoreData

class LocalService {

    func fetchLocalMovies() -> [Movie]{
        
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        let movies = try! CoreDataStack.context.fetch(fetchRequest)
        
        return movies
    }
}
