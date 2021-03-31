//
//  CustomTabView.swift
//  NetflixClone
//
//  Created by Abhijeet on 25/01/21.
//

import SwiftUI
import UIKit

struct CustomTabView: View {
    
    @State private var currentTab: CustomTab = .episodes
    
    var tabs: [CustomTab]
    var movie: Movie
    
    func widthForTab(_ tab: CustomTab) -> CGFloat{
        let string = tab.rawValue
        return string.widthOfString(using: UIFont.boldSystemFont(ofSize: 17))
    }
    
    @Binding var showPicker: Bool
    @Binding var selectedSeason: Int
    
    var body: some View {
        
        VStack{
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 20){
                    ForEach(tabs, id: \.self){ tab in
                        VStack{
                            
                            Rectangle()
                                .frame(width: widthForTab(tab), height: 6)
                                .foregroundColor(tab == currentTab ? .red : .clear)
                            
                            Button(action: {
                                currentTab = tab
                            }, label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(tab == currentTab ? .white : .gray)
                            })
                            .frame(width: widthForTab(tab), height: 30)
                            
                        }
                    }
                }
            }
            
            switch currentTab{
            case .episodes:
                EpisodesView(episodes: movie.episodes ?? [], showSeasonPicker: $showPicker, selectedSeason: $selectedSeason)
            case .tarilers:
                TrailerListView(trailers: movie.trailers)
            case .more:
                MoreLikeThisView(movies: movie.moreLikeThisMovies)
            }
            Spacer()
            
        }.foregroundColor(.white)
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            CustomTabView(tabs: [.episodes, .tarilers, .more], movie: exampleMovie1, showPicker: .constant(false), selectedSeason: .constant(1))
        }
    }
}

enum CustomTab: String {
    case episodes = "EPISODES"
    case tarilers = "TRAILERS & MORE"
    case more = "MORE LIKE THIS"
}
