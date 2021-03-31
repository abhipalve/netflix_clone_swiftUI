//
//  TrailerPlayerView.swift
//  NetflixClone
//
//  Created by Abhijeet on 27/03/21.
//

import SwiftUI
import VideoPlayer

struct TrailerPlayerView: View {
    
    var videoURL: URL?
    @Binding var playVideo: Bool
    
    var body: some View {
        if videoURL != nil{
            VideoPlayer(url: videoURL!, play: $playVideo)
        }else{
            Text("Could not load video.")
                .font(.system(size: 25))
                .bold()
        }
    }
}

struct TrailerPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerPlayerView(videoURL: nil, playVideo: .constant(true))
    }
}
