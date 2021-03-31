//
//  HomeViewModel.swift
//  NetflixClone
//
//  Created by Abhijeet  on 23/01/21.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var movies: [String: [Movie]] = [:]
    
    public var allCategories: [String] {
        movies.keys.map({String($0)})
    }
    
    public func getMovies(with category: String, andHomeTopMenu topMenu: HomeTopMenu, andGenre genre: HomeGenre) -> [Movie]{
        
        switch topMenu {
        case .home:
            return movies[category] ?? []
        case .movies:
            return (movies[category] ?? []).filter({$0.movieType == .movie})
        case .tvShows:
            return (movies[category] ?? []).filter({$0.movieType == .tvShow})
        case .myList:
            return movies[category] ?? []
        }
    }
    
    init() {
        setupMovies()
    }
    
    func setupMovies() {
        movies["Trending Now"] = exampleMovies
        movies["Rom Com"] = exampleMovies.shuffled()
        movies["Thrillers"] = exampleMovies.shuffled()
        movies["Watch it again"] = exampleMovies.shuffled()
        movies["Sci Fi"] = exampleMovies.shuffled()
    }
}
