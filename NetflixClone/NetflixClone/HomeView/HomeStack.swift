//
//  HomeStack.swift
//  NetflixClone
//
//  Created by Abhijeet on 16/02/21.
//

import SwiftUI

struct HomeStack: View {
    
    var homeViewModel: HomeViewModel
    var selectedGenre: HomeGenre
    
    var topMenuSelection: HomeTopMenu
    
    @Binding var movieDetailToShow: Movie?
    
    @Binding  var showPreviewFullScreen : Bool
    @Binding  var previewStaringIndex : Int
    
    var body: some View {
        ForEach(homeViewModel.allCategories, id: \.self){category in
            VStack{
                HStack(){
                    Text(category)
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHStack{
                        ForEach(homeViewModel.getMovies(with: category, andHomeTopMenu: topMenuSelection, andGenre: selectedGenre)){ movie in
                            StandardMovieView(movie: movie)
                                .scaledToFill()
                                .frame(width: 100, height: 200)
                                .padding(.horizontal, 20)
                                .onTapGesture {
                                    movieDetailToShow = movie
                                }
                        }
                    }
                }
            }.padding(.leading, 6)
        }
    }
}

struct HomeStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView{
                HomeStack(homeViewModel: HomeViewModel(), selectedGenre: .AllGenres, topMenuSelection: .home, movieDetailToShow: .constant(nil),
                          showPreviewFullScreen: .constant(false), previewStaringIndex: .constant(0))
            }
            .foregroundColor(.white)
        }
    }
}

