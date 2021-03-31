//
//  ComingSoonRow.swift
//  NetflixClone
//
//  Created by Abhijeet on 06/03/21.
//

import SwiftUI
import KingfisherSwiftUI
import AVKit

struct ComingSoonRow: View {
    
    var movie: Movie
    
    @Binding var movieDetailsToShow: Movie?
    
    let screen = UIScreen.main.bounds
    
    var player: AVPlayer{
        AVPlayer(url: URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4")!)
    }
    var body: some View {
        VStack{
            VideoPlayer(player: player)
                .frame(height:200)
            
            
            VStack{
                HStack{
                    KFImage(movie.thumbnailURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: screen.size.width / 3, height: 70)
                        .clipped()
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        VStack(spacing: 10){
                            Image(systemName: "bell")
                                .font(.title3)
                            Text("Remind Me")
                        }
                    })
                    .padding(.horizontal)
                    
                    Button(action: {
                        
                    }, label: {
                        VStack(spacing: 10){
                            Image(systemName: "info.circle")
                                .font(.title3)
                            Text("Info")
                        }
                    })
                    .padding(.trailing, 25)
                }
                .font(.caption)
                
                VStack(alignment:.leading){
                    Text(movie.name)
                        .font(.title2)
                        .bold()
                    Text(movie.episodeDescriptionoDisplay)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    
                }
                
            }
            .foregroundColor(.white)
            .padding(.horizontal)
        }
    }
}

struct ComingSoonRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ComingSoonRow(movie: exampleMovie3, movieDetailsToShow: .constant(nil))
        }
    }
}
