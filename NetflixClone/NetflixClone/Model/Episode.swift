//
//  Episode.swift
//  NetflixClone
//
//  Created by Abhijeet on 25/01/21.
//

import Foundation

struct Episode: Identifiable {
    
    var id: String = UUID().uuidString
    
    var name: String
    var season: Int
    var thumbnailURLString: String
    var description: String
    var lenght: Int
    
    var videoURL: URL
    var episodeNumber: Int
    
    var thumbnailURL: URL{
        return URL(string: thumbnailURLString)!
    }
}
