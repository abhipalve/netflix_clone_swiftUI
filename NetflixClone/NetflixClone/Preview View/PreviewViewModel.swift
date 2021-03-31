//
//  PreviewViewModel.swift
//  NetflixClone
//
//  Created by Abhijeet on 27/03/21.
//

import Foundation

class PreviewViewModel: ObservableObject {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
