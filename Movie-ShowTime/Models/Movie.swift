//
//  Movie.swift
//  Movie-ShowTime
//
//  Created by Najmul Hasan on 12/25/17.
//  Copyright © 2017 Najmul Hasan. All rights reserved.
//

import Foundation

struct Movie {
    
    public var createdDate: Int
    public var updatedDate: Int
    public var title: String
    public var releaseYear: Int
    public var locations: String
    public var funFacts : String
    public var productionCompany: String
    public var distributor: String
    public var director: String
    public var writer: String
    public var actor1: String
    public var actor2: String
    public var actor3: String
    
    
    public init(jsonData: [AnyObject]){
        
        createdDate = jsonData[3] as! Int
        updatedDate = jsonData[5] as! Int
        title = jsonData[8] as? String ?? " "
        releaseYear = Int (jsonData[9] as! String)!
        locations = jsonData[10] as? String ?? " "
        funFacts = jsonData[11] as? String ?? " "
        productionCompany = jsonData[12] as? String ?? " "
        distributor = jsonData[13] as? String ?? " "
        director = jsonData[14] as? String ?? " "
        writer = jsonData[15] as? String ?? " "
        actor1 = jsonData[16] as? String ?? " "
        actor2 = jsonData[17] as? String ?? " "
        actor3 = jsonData[18] as? String ?? " "
    }
}

