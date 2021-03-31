//
//  PopularMovieView.swift
//  NetflixClone
//
//  Created by Abhijeet on 24/02/21.
//

import SwiftUI
import KingfisherSwiftUI

struct PopularMovieView: View {
    
    var movie: Movie
    
    @Binding var movieDetailToShow :Movie?
    
    var body: some View {
        GeometryReader { geometry in
            HStack{
                KFImage(movie.thumbnailURL)
                    .resizable()
                    .frame(width: geometry.size.width / 3)
                    .padding(.leading, 5)
                Text(movie.name)
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "play.fill")
                }).padding(.trailing,20)
            }.foregroundColor(.white)
            .onTapGesture(perform: {
                self.movieDetailToShow = movie
            })
        }
    }
}

struct PopularMovieView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            PopularMovieView(movie: exampleMovie2, movieDetailToShow: .constant(nil))
                .frame(height: 75)
        }
    }
}
