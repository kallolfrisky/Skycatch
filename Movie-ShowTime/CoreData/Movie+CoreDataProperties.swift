//
//  Movie+CoreDataProperties.swift
//  Movie-ShowTime
//
//  Created by Najmul Hasan on 12/28/17.
//  Copyright © 2017 Najmul Hasan. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var actor1: String?
    @NSManaged public var actor2: String?
    @NSManaged public var actor3: String?
    @NSManaged public var createdDate: Int32
    @NSManaged public var director: String?
    @NSManaged public var distributor: String?
    @NSManaged public var funFacts: String?
    @NSManaged public var locations: String?
    @NSManaged public var productionCompany: String?
    @NSManaged public var releaseYear: Int16
    @NSManaged public var title: String?
    @NSManaged public var updatedDate: Int32
    @NSManaged public var writer: String?
    @NSManaged public var sid: Int32

}
