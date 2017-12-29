//
//  Movie+CoreDataClass.swift
//  Movie-ShowTime
//
//  Created by Najmul Hasan on 12/28/17.
//  Copyright © 2017 Najmul Hasan. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Movie)
public class Movie: NSManagedObject {

    convenience init(context: NSManagedObjectContext, movieObject: MovieModel) {
        
        self.init(context: context)
        
        sid = Int32(movieObject.sid)
        createdDate = Int32(movieObject.createdDate)
        updatedDate = Int32(movieObject.updatedDate)
        title = movieObject.title
        releaseYear = Int16(movieObject.releaseYear)
        locations = movieObject.locations
        funFacts = movieObject.funFacts
        productionCompany = movieObject.productionCompany
        distributor = movieObject.distributor
        director = movieObject.director
        writer = movieObject.writer
        actor1 = movieObject.actor1
        actor2 = movieObject.actor2
        actor3 = movieObject.actor3
    }
}
