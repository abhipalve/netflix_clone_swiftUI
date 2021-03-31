//
//  SearchView.swift
//  NetflixClone
//
//  Created by Abhijeet on 23/02/21.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel = SearchViewModel()
    
    @State private var searchText = ""
    
    @State var movieDetailToShow: Movie? = nil
    
    var body: some View {
        
        let searchTextBinding = Binding{
            return searchText
        } set: {
            searchText = $0
            viewModel.updateSearchText(with: $0)
        }
        
        let popularMovies: [Movie] = viewModel.fetchPopularMovies()
        
        return ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                SearchBar(text: searchTextBinding, isLoading: $viewModel.isLoading)
                    .padding()
                
                ScrollView{
                    if viewModel.isShowingPopularMovies {
                        
                        PopularList(movies: popularMovies, movieDetailToShow: $movieDetailToShow)
                    }
                    
                    if viewModel.viewstate == .empty{
                        Text("No results found.")
                            .bold()
                            .padding(.top, 150)
                    }else if viewModel.viewstate == .ready && !viewModel.isShowingPopularMovies{
                        
                        VStack{
                            HStack{
                                Text("Movies & TV")
                                    .bold()
                                    .font(.title3)
                                    .padding(.leading, 12)
                                Spacer()
                            }
                            
                            SearchResultsGrid(movies: viewModel.searchResults, movieDetailToShow: $movieDetailToShow)
                        }
                        
                    }
                }.foregroundColor(.white)
                
                Spacer()
            }
            
            if movieDetailToShow != nil{
                MovieDetail(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct PopularList: View {
    
    var movies: [Movie]
    
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        VStack{
            HStack{
                Text("Popular Searches")
                    .bold()
                    .font(.title3)
                    .padding(.leading, 12)
                Spacer()
            }
            
            LazyVStack{
                ForEach(movies, id:\.id){movie in
                    PopularMovieView(movie: movie, movieDetailToShow: $movieDetailToShow)
                        .frame(height:75)
                }
            }
        }
    }
}
