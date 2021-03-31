//
//  TrailerListView.swift
//  NetflixClone
//
//  Created by Abhijeet on 28/01/21.
//

import SwiftUI

struct TrailerListView: View {
    
    var trailers: [Trailer]
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        
        VStack{
            
                ForEach(trailers){trailer in
                    VStack(alignment:.leading){
                        VideoPreviewView(imageURL: trailer.thumbnailURL, videoURL: trailer.videoURL)
                            .frame(width: screen.width)
                        Text(trailer.name)
                            .font(.headline)
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
                }
            
        }
    }
}

struct TrailerListView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            TrailerListView(trailers: exampleTrailers)
        }
    }
}
