//
//  SearchViewModel.swift
//  NetflixClone
//
//  Created by Abhijeet on 23/02/21.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    
    @Published var viewstate: ViewState = ViewState.ready
    
    @Published var popularMovies: [Movie] = []
    @Published var searchResults: [Movie] = []
    
    @Published var isShowingPopularMovies = true
    
    
    public func updateSearchText(with text: String) {
        setViewState(to: .loading)
        
        if text.count > 0{
            isShowingPopularMovies = false
            getSearchResults(forText: text)
        }else{
            isShowingPopularMovies = true
        }
        
    }
    
    private func getPopularMovies(){
        self.popularMovies = generateMovies(40)
    }
    
    func fetchPopularMovies() -> [Movie]{
        return generateMovies(40)
    }
    
    private func getSearchResults(forText text: String){
        
        let haveResult = Int.random(in: 0...3)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            
            if haveResult == 0{
                self.searchResults = []
                self.setViewState(to: .empty)
            }else{
                let movies = generateMovies(21)
                self.searchResults = movies
                self.setViewState(to: .ready)
            }
        }
    }
    
    private func setViewState(to state: ViewState){
        DispatchQueue.main.async {
            self.viewstate = state
            self.isLoading = state == .loading
        }
    }
}

enum ViewState {
    case empty
    case loading
    case ready
    case error
}
