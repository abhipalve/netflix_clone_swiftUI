//
//  EpisodesView.swift
//  NetflixClone
//
//  Created by Abhijeet on 30/01/21.
//

import SwiftUI

struct EpisodesView: View {
    
    var episodes: [Episode]
    
    @Binding var showSeasonPicker : Bool
    @Binding var selectedSeason: Int
    
    func getEpisodes(forSeason season: Int ) -> [Episode] {
        return episodes.filter({
            $0.season == season
        })
    }
    
    var body: some View {
        VStack(spacing: 12){
            
            HStack{
                Button(action: {
                    showSeasonPicker = true
                }, label: {
                    Group{
                        Text("Season \(selectedSeason)")
                        Image(systemName: "chevron.down")
                    }.font(.system(size: 16))
                })
                Spacer()
            }
            
            
            ForEach(getEpisodes(forSeason: selectedSeason)){ episode in
                
                VStack(alignment: .leading){
                    HStack{
                        VideoPreviewView(imageURL: episode.thumbnailURL, videoURL: episode.videoURL)
                            .frame(width: 120, height: 70)
                        
                        
                        VStack(alignment: .leading){
                            Text("\(episode.episodeNumber). \(episode.name)")
                                .font(.system(size: 16))
                            Text("\(episode.lenght) m")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "arrow.down.to.line.alt")
//                        font(.system(size: 20))
//                            .padding(.trailing, 10)
//
                    }
                    
                    Text(episode.description)   
                        .font(.system(size: 14))
                        .lineLimit(3)
                }
                .padding(.bottom, 20)
            }
            
            Spacer()
            
        }
        .foregroundColor(.white)
        .padding(.horizontal, 15)
    }
    
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            EpisodesView(episodes: episodes, showSeasonPicker: .constant(false), selectedSeason: .constant(1))
        }
    }
}
