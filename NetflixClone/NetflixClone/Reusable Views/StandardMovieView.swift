//
//  StandardMovieView.swift
//  NetflixClone
//
//  Created by Abhijeet  on 22/01/21.
//

import SwiftUI
import KingfisherSwiftUI

struct StandardMovieView: View {
    
    var movie: Movie
    var body: some View {
        KFImage(movie.thumbnailURL)
             .resizable()
            //.scaledToFill()
    }
}

struct StandardMovieView_Previews: PreviewProvider {
    static var previews: some View {
        StandardMovieView(movie: exampleMovie1)
            .frame(width: 200, height: 300)
    }
}
