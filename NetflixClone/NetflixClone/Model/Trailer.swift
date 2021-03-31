//
//  Trailer.swift
//  NetflixClone
//
//  Created by Abhijeet on 28/01/21.
//

import Foundation

struct Trailer: Identifiable, Hashable {
    
    var id: String = UUID().uuidString
    var name: String
    var videoURL: URL
    var thumbnailURL: URL
}
