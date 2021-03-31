//
//  SearchResultsGrid.swift
//  NetflixClone
//
//  Created by Abhijeet on 28/02/21.
//

import SwiftUI

struct SearchResultsGrid: View {
    
    var movies: [Movie]
    
    @Binding var movieDetailToShow: Movie?
    
    var screen = UIScreen.main.bounds;
    
    var body: some View {
        
        let columns: [GridItem] = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        LazyVGrid(columns: columns,spacing: 10){
            
            ForEach(movies, id: \.id){movie in
                StandardMovieView(movie: movie)
                    .frame(height: 160)
                    .onTapGesture(perform: {
                        movieDetailToShow = movie
                    })
            }
        }
    }
}

struct SearchResultsGrid_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsGrid(movies: generateMovies(20), movieDetailToShow: .constant(nil))
    }
}
