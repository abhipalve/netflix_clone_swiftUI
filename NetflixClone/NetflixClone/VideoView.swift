//
//  Video.swift
//  NetflixClone
//
//  Created by Abhijeet on 28/01/21.
//

import SwiftUI
import AVKit

struct VideoView: View {
    
    var url: URL
    
    private var avPlayer: AVPlayer{
        AVPlayer(url: url)
    }
    
    var body: some View {
        VideoPlayer(player: avPlayer)
    }
}

struct Video_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(url: videoURL1!)
    }
}
