//
//  MoviePreviewRow.swift
//  NetflixClone
//
//  Created by Abhijeet on 11/03/21.
//

import SwiftUI

struct MoviePreviewRow: View {
    
    var movies: [Movie]
    
    @Binding  var showPreviewFullScreen : Bool
    @Binding  var previewStaringIndex : Int
    
    var body: some View {
        VStack(alignment:.leading){
            Text("Previews")
                .font(.title3)
                .bold()
                .foregroundColor(.white)
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false){
            
                LazyHStack{
                    ForEach(0..<movies.count){movieIndex in
                        let movie = movies[movieIndex]
                        MoviePreviewCell(movie: movie)
                            .frame(width: 120, height: 120)
                            .padding(.trailing, 5)
                            .padding(.leading, 5)
                            .onTapGesture {
                                previewStaringIndex = movieIndex
                                showPreviewFullScreen = true
                            }
                    }
                }
            }
        }
        .frame(height:190)
    }
}

struct MoviePreviewRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            MoviePreviewRow(movies: exampleMovies,showPreviewFullScreen: .constant(false), previewStaringIndex: .constant(0))
        }
    }
}
