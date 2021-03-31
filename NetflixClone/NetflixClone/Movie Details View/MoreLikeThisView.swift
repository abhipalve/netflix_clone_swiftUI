//
//  MoreLikeThisView.swift
//  NetflixClone
//
//  Created by Abhijeet on 27/01/21.
//

import SwiftUI

struct MoreLikeThisView: View {
    var movies: [Movie]
    var body: some View {
        
        
        let columns = [GridItem(.flexible()),
                       GridItem(.flexible()),
                       GridItem(.flexible()),
        ]
        
        LazyVGrid(columns: columns, content: {
            
            ForEach(0..<movies.count){index in
                StandardMovieView(movie: movies[index])
            }
        })
        
    }
}

struct MoreLikeThisView_Previews: PreviewProvider {
    static var previews: some View {
        MoreLikeThisView(movies: exampleMovies)
    }
}
