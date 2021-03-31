//
//  MovieDetail.swift
//  NetflixClone
//
//  Created by Abhijeet on 25/01/21.
//

import SwiftUI

struct MovieDetail: View {
    var movie: Movie
    
    var screen = UIScreen.main.bounds
    
    @State private var showSeasonPicker = false
    @State private var selectedSeason = 1
    
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                VStack{
                    HStack{
                        Spacer()
                        Button(action: {
                            movieDetailToShow = nil
                        }, label: {
                            Image(systemName: "xmark.circle")
                                .font(.system(size: 28))
                        })
                    }.padding(.trailing, 20)
                    
                    ScrollView(.vertical, showsIndicators: false){
                        VStack {
                            StandardMovieView(movie: movie)
                                .scaledToFill()
                                .frame(width: screen.width / 2.5)
                            Spacer()
                            
                            MovieInfoSubHeadlineView(movie: movie)
                            
                            Text(movie.promotionalHeadLine ?? "")
                                .font(.headline)
                                .bold()
                            
                            HorizontalButton(title: "Play", imageName: "play.fill", size: CGSize(width: screen.width - 30, height: 40), bgColor: .red) {
                                
                            }
                            
                            CrrentEpisodeInfoView(movie: movie)
                            
                            
                            CastAndCreatorInfoView(movie: movie)
                            
                            HStack(spacing: 60){
                                VerticalButton(text: "My List", onImageName: "checkmark", offImageName: "plus", isOn: false) {
                                    
                                }
                                
                                VerticalButton(text: "Rate", onImageName: "hand.thumbsup.fill", offImageName: "hand.thumbsup", isOn: true) {
                                    
                                }
                                
                                VerticalButton(text: "Share", onImageName: "square.and.arrow.up", offImageName: "square.and.arrow.up", isOn: true) {
                                    
                                }
                                Spacer()
                            }.padding(.leading, 20)
                            .padding(.top, 10)
                            
                            CustomTabView(tabs: [.episodes,.tarilers,.more], movie: movie, showPicker: $showSeasonPicker, selectedSeason: $selectedSeason)
                            
                        }
                    }
                    
                    Spacer()
                }.foregroundColor(.white)
                
                
                //Overlay
                if showSeasonPicker{
                    Group{
                        Color.black.opacity(0.90)
                        
                        VStack(spacing: 40){
                            
                            Spacer()
                            
                            ForEach(0..<(movie.numberOfSeasons ?? 0)){ season in
                                
                                Button(action: {
                                    selectedSeason = season + 1
                                    showSeasonPicker = false
                                }, label: {
                                    Text("Season \(season + 1)")
                                        .foregroundColor(selectedSeason == season + 1 ? .white : .gray)
                                        .bold()
                                        .font(selectedSeason == season + 1 ? .title : .title2)
                                })
                                
                            }
                            
                            
                            
                            Spacer()
                            
                            
                            Button(action: {
                                showSeasonPicker = false
                            }, label: {
                                Image(systemName: "x.circle.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(.white)
                                    .scaleEffect(x: 1.1)
                            }).padding(.bottom, 30)
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
                    
                }
            }
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: exampleMovie1, movieDetailToShow: .constant(nil))
    }
}

struct MovieInfoSubHeadlineView: View {
    var movie: Movie
    var body: some View {
        HStack(spacing:15){
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            Text(String(movie.year))
            RatingView(rating: movie.rating)
            Text(movie.displayNumberOfSeasons)
        }.foregroundColor(.gray)
    }
}

struct RatingView: View {
    var rating: String
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(.gray)
                .cornerRadius(3.0)
            Text(rating)
                .foregroundColor(.white)
                .font(.system(size: 13))
                .bold()
        }.frame(width: 50, height: 20)
    }
}

struct CastAndCreatorInfoView: View {
    var movie: Movie
    var body: some View {
        VStack(){
            HStack {
                Text("Cast: \(movie.cast)")
                Spacer()
            }.padding(.leading, 15)
            HStack {
                Text("Cast: \(movie.creators)")
                Spacer()
            }.padding(.leading, 15)
        }.padding(.top, 5)
        .font(.system(size: 15))
        .foregroundColor(.gray)
    }
}

struct CrrentEpisodeInfoView: View {
    var movie: Movie
    var body: some View {
        Group{
            HStack {
                Text(movie.episodeInfoDisplay)
                    .bold()
                Spacer()
            }.padding(.leading, 15)
            
            HStack {
                Text(movie.episodeDescriptionoDisplay)
                    .font(.subheadline)
            }.padding(.leading, 15)
        }
    }
}
