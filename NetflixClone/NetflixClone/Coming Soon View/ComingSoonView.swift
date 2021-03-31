//
//  ComingSoonView.swift
//  NetflixClone
//
//  Created by Abhijeet on 06/03/21.
//

import SwiftUI

struct ComingSoonView: View {
    
    @State private var showNotificationList = false
    @State private var movieDetailsToShow: Movie? = nil
    @State private var navBarHidden = true
    
    @State private var scrollViewOffset: CGFloat = 0.0
    @State private var activeIndex = 0
    
    @ObservedObject var csViewModel = ComingSoonViewModel()
    
    func updateActiveIndex(fromScroll scroll: CGFloat) {
        if scroll < 105 {
            activeIndex = 0
        }else{
            let temp = scroll - 105
            let active = Int(temp / 410) + 1
            activeIndex = Int(active)
        }
    }
    
    var body: some View {
        
        let movies = csViewModel.movies.enumerated().map({$0})
        
        let scrollTrackingBinding = Binding{
            return scrollViewOffset
        } set: { newVal in
            scrollViewOffset = newVal
            updateActiveIndex(fromScroll: newVal)
        }
        
        //NavigationView {
            Group {
                ZStack {
                    Color.black.edgesIgnoringSafeArea(.all)
                    
                    TrackableScrollView(.vertical, showIndicators: false, contentOffset:scrollTrackingBinding) {
                        
                        LazyVStack{
                            NotificationBar(showNotificationList: $showNotificationList)
                            
                            ForEach(Array(movies),id:\.offset){index, movie in
                                ComingSoonRow(movie: movie, movieDetailsToShow: $movieDetailsToShow)
                                    .frame(height:400)
                                    .overlay(
                                        Group{
                                            index == activeIndex ? Color.clear : Color.black.opacity(0.8)
                                        }
                                        .animation(.easeInOut)
                                    )
                            }
                        }
                        .foregroundColor(.white)
                    }
                }
            }
        
        
        NavigationLink(
            destination: Text("Notification List"),
            isActive: $showNotificationList,
            label: {
                EmptyView()
            })
            .navigationTitle("")
            .navigationBarHidden(navBarHidden)
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: { _ in
                self.navBarHidden = true
            })
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
                self.navBarHidden = false
            })
        //}
    }
}

struct ComingSoonView_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoonView()
    }
}
