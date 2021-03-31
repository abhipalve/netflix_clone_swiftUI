//
//  TopMoviewView.swift
//  NetflixClone
//
//  Created by Abhijeet on 24/01/21.
//

import SwiftUI
import KingfisherSwiftUI

struct TopMoviewView: View {
    var movie: Movie
    
    var body: some View {
        
        ZStack{
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipped()
            
            VStack(spacing:15){
                Spacer()
                HStack{
                    ForEach(movie.genre, id: \.self){genre in
                        
                        Text(genre)
                            .font(.footnote)
                        if genre != movie.genre.last{
                            Image(systemName: "circle.fill")
                                .foregroundColor(.green)
                                .font(.system(size: 3))
                        }
                    }
                }
                
                HStack(spacing: 50){
                    Spacer()
                    VerticalButton(text: "My List", onImageName: "checkmark", offImageName: "plus", isOn: false){
                        
                    }
                
                    HorizontalButton(title: "Play", imageName: "play.fill", size: CGSize(width: 100, height: 30)){
                        
                    }
                    
                    VerticalButton(text: "Info", onImageName: "info.circle", offImageName: "info.circle", isOn: true){}
                    Spacer()
                }
            }
            .background(LinearGradient.blackLinerGradient)
            .padding(.top,250)
        }
        .foregroundColor(.white)
    }
}

struct TopMoviewView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviewView(movie: exampleMovie4)
    }
}
