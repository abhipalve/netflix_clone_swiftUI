//
//  Movie.swift
//  NetflixClone
//
//  Created by Abhijeet  on 22/01/21.
//

import Foundation
import SwiftUI

struct Movie : Identifiable{
    var id: String
    var name: String
    var thumbnailURL: URL
    
    var genre: [String]
    var stdGenre: HomeGenre = .AllGenres
    
    var year: Int
    var rating: String
    var numberOfSeasons: Int?
    var cast: String
    var creators: String
    
    var accentColor: Color? = .white
    
    var currentEpisodeInfo: CurrentEpisodeInfo?
    
    var defaultEpisodeInfo: CurrentEpisodeInfo
    
    var episodes: [Episode]?
    
    var movieType: MovieType{
        return episodes == nil ? .movie : .tvShow
    }
    
    var promotionalHeadLine: String?
    
    var moreLikeThisMovies: [Movie]
    
    var trailers: [Trailer]
    
    var previewImageName: String
    var previewVideoURL: URL?
    
    var displayNumberOfSeasons: String{
        if numberOfSeasons != nil {
            if numberOfSeasons == 1 {
                return "1 Season"
            }else{
                return "\(numberOfSeasons!) Seasons"
            }
        }
        return ""
    }
    
    var episodeInfoDisplay: String{
        if let current = currentEpisodeInfo{
            return "S\(current.season):E\(current.episode) \(current.episodeName)"
        }else{
            return "S\(defaultEpisodeInfo.season):E\(defaultEpisodeInfo.episode) \(defaultEpisodeInfo.episodeName)"
        }
    }
    
    var episodeDescriptionoDisplay: String{
        if let current = currentEpisodeInfo{
            return current.description
        }else{
            return defaultEpisodeInfo.description
        }
    }
}


struct CurrentEpisodeInfo: Hashable, Equatable {
    var episodeName: String
    var description: String
    var season: Int
    var episode: Int
}

enum MovieType {
    case movie
    case tvShow
}
