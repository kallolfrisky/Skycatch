//
//  Synchronizer.swift
//  Movie-ShowTime
//
//  Created by Najmul Hasan on 12/28/17.
//  Copyright © 2017 Najmul Hasan. All rights reserved.
//

import Foundation

typealias SynchronizerCallback = ([Movie]) -> Void

class Synchronizer {
    
    func sync(callback: @escaping SynchronizerCallback){
        
        RemoteService().fetchRemoteMovies { movies in
            
            let localMovieIds = LocalService().fetchLocalMovies().map{ $0.sid}
            let newMovies = movies?.filter {
                
                !localMovieIds.contains( Int32($0.sid) )
            }
            
            newMovies?.forEach {
                _ = Movie(context: CoreDataStack.context, movieObject: $0)
            }
            
            try! CoreDataStack.context.save()
            let movies = LocalService().fetchLocalMovies()
            
            callback(movies)
        }
    }
}
