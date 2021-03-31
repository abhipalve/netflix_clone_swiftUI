//
//  HomeView.swift
//  NetflixClone
//
//  Created by Abhijeet  on 08/01/21.
//

import SwiftUI

struct HomeView: View {
    var homeViewModel = HomeViewModel()
    
    var screen = UIScreen.main.bounds
    
    @State var movieDetailToShow: Movie? = nil
    
    @State var selectedHomeMenu: HomeTopMenu = .home
    @State var selectedGenre: HomeGenre = .AllGenres
    
    @State private var showGenereSelection = false
    @State private var showMenuSelection = false
    
    @Binding  var showPreviewFullScreen : Bool
    @Binding  var previewStaringIndex : Int
    
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack{
                    
                    TopRowButtons(selectedHomeMenu: $selectedHomeMenu, selectedGenre: $selectedGenre, showGenereSelection: $showGenereSelection, showMenuSelection: $showMenuSelection)
                    
                    TopMoviewView(movie: exampleMovie2)
                        .frame(width:screen.width)
                        .padding(.top, -110)
                        .zIndex(-1)
                    
                    MoviePreviewRow(movies: exampleMovies, showPreviewFullScreen: $showPreviewFullScreen, previewStaringIndex: $previewStaringIndex)
                    
                    HomeStack(homeViewModel: homeViewModel, selectedGenre: selectedGenre, topMenuSelection: selectedHomeMenu, movieDetailToShow: $movieDetailToShow,
                              showPreviewFullScreen: $showPreviewFullScreen, previewStaringIndex: $previewStaringIndex)
                }
            }
            
            if movieDetailToShow != nil{
                MovieDetail(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
                    .animation(.easeIn)
                    .transition(.opacity)
                
            }
            
            if showMenuSelection{
                Group{
                    Color.black.opacity(0.9)
                    
                    
                    
                    VStack(spacing: 40){
                        
                        Spacer()
                        
                        ForEach(HomeTopMenu.allCases, id:\.self){topMenu in
                            
                            Button(action: {
                                selectedHomeMenu = topMenu
                                showMenuSelection = false
                            }, label: {
                                if (topMenu == selectedHomeMenu){
                                    Text(topMenu.rawValue)
                                        .bold()
                                }else{
                                    Text(topMenu.rawValue)
                                        .foregroundColor(.gray)
                                }
                                
                            })
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            showMenuSelection = false
                        }, label: {
                            Image(systemName: "x.circle.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                                .scaleEffect(x: 1.1)
                        }).padding(.bottom, 30)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
            }
            
            if showGenereSelection{
                Group{
                    Color.black.opacity(0.9)
                    
                    
                    
                    VStack(spacing: 40){
                        
                        Spacer()
                        
                        ScrollView{
                            ForEach(HomeGenre.allCases, id:\.self){genre in
                                
                                Button(action: {
                                    selectedGenre = genre
                                    showGenereSelection = false
                                }, label: {
                                    if (genre == selectedGenre){
                                        Text(genre.rawValue)
                                            .bold()
                                    }else{
                                        Text(genre.rawValue)
                                            .foregroundColor(.gray)
                                    }
                                    
                                })
                                .padding(.bottom, 40)
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            showGenereSelection = false
                        }, label: {
                            Image(systemName: "x.circle.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                                .scaleEffect(x: 1.1)
                        }).padding(.bottom, 30)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
            }
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showPreviewFullScreen: .constant(false), previewStaringIndex: .constant(0))
    }
}

struct TopRowButtons: View {
    
    @Binding var selectedHomeMenu: HomeTopMenu
    @Binding var selectedGenre: HomeGenre
    
    @Binding  var showGenereSelection: Bool
    @Binding  var showMenuSelection: Bool
    
    var body: some View {
        
        switch selectedHomeMenu {
        case .home:
            HStack {
                Button(action: {
                    selectedHomeMenu = .home
                }, label: {
                    Image("Netflix_logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40)
                })
                Spacer()
                Button(action: {
                    selectedHomeMenu = .tvShows
                }, label: {
                    Text("TV Shows")
                })
                Spacer()
                Button(action: {
                    selectedHomeMenu = .movies
                }, label: {
                    Text("Movies")
                })
                Spacer()
                Button(action: {
                    selectedHomeMenu = .myList
                }, label: {
                    Text("My List")
                })
            }.padding(.leading, 10)
            .padding(.trailing, 30)
            
            
        case .tvShows, .movies, .myList:
            HStack {
                Button(action: {
                    selectedHomeMenu = .home
                }, label: {
                    Image("Netflix_logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40)
                })
                
                HStack(spacing: 30){
                    Button(action: {
                        showMenuSelection = true
                    }, label: {
                        HStack {
                            Text(selectedHomeMenu.rawValue)
                                .font(.system(size: 18))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 10))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                    })
                    
                    Button(action: {
                        showGenereSelection = true
                    }, label: {
                        HStack {
                            Text(selectedGenre.rawValue)
                                .font(.system(size: 14))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 6))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                    })
                }
                
                Spacer()
                
            }.padding(.leading, 10)
            .padding(.trailing, 30)
        }
        
        
    }
}

enum HomeTopMenu: String, CaseIterable {
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
}

enum HomeGenre: String, CaseIterable {
    case AllGenres
    case Action
    case Comdey
    case Thriller
    case Horror
    case Anime
    case Classics
    case Dark
    case Sports
    case StandupComedy
    case Romance
    case SciFi
}




