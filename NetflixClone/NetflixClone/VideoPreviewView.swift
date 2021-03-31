//
//  VideoPreviewView.swift
//  NetflixClone
//
//  Created by Abhijeet on 28/01/21.
//

import SwiftUI
import KingfisherSwiftUI

struct VideoPreviewView: View {
    var imageURL: URL
    var videoURL: URL
    let screen = UIScreen.main.bounds
    
    @State var isVideoPlayed = false
    
    var body: some View {
        ZStack{
            KFImage(imageURL)
                .resizable()
                //.aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                //.frame(width: screen.width, height: 250)
            
            Button(action: {
                isVideoPlayed = true
            }, label: {
                Image(systemName: "play.circle")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
            })
            .sheet(isPresented: $isVideoPlayed, content: {
                VideoView(url: videoURL)
            })
            
        }
    }
}

struct VideoPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPreviewView(imageURL: imageURL1!, videoURL: videoURL1!)
    }
}
