//
//  ComingSoonViewModel.swift
//  NetflixClone
//
//  Created by Abhijeet on 06/03/21.
//

import Foundation

class ComingSoonViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    
    init() {
        self.movies = generateMovies(20)
    }
    
}
