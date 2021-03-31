//
//  MoviePreviewCell.swift
//  NetflixClone
//
//  Created by Abhijeet on 10/03/21.
//

import SwiftUI
import KingfisherSwiftUI

struct MoviePreviewCell: View {
    
    var movie: Movie
    let colors: [Color] = [.blue, .orange,.gray,.green,.red,.yellow, .pink]
    var body: some View {
        ZStack(alignment:.bottom) {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(lineWidth: 3.0)
                        .foregroundColor(colors.randomElement())
            )
            
            Image(movie.previewImageName)
                .resizable()
                .scaledToFit()
                .offset(y:-20)
                .frame(height: 65)
        }
    }
}

struct MoviePreviewCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            MoviePreviewCell(movie: exampleMovie1)
                .frame(width: 200, height: 50)
        }
    }
}
