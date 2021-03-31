//
//  ContentView.swift
//  NetflixClone
//
//  Created by Abhijeet  on 08/01/21.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var showPreviewFullScreen : Bool = false
    @State private var previewStaringIndex : Int = 0
    
    @State private var previewCurrentPosition: CGFloat = 1000
    @State private var previewNewPosition: CGFloat = 1000
    
    @State private var previewHorizontalDragActive : Bool = false
    
    let screen = UIScreen.main.bounds
    init(){
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
        
        let previewDragGetsure = DragGesture(minimumDistance: 20)
            .onChanged { value in
                if previewHorizontalDragActive{
                    return
                }
                
                if previewCurrentPosition == .zero{
                    if abs(value.translation.width) > abs(value.translation.height){
                        previewHorizontalDragActive = true
                        return
                    }
                }
                
                //vertical
                let shouldBePosition = value.translation.height + self.previewNewPosition
                
                if shouldBePosition < 0{
                    return
                }else{
                    self.previewCurrentPosition = shouldBePosition
                }
            }
            .onEnded { value in
                if previewHorizontalDragActive {
                    previewHorizontalDragActive = false
                    return
                }
                
                let shouldBePosition = value.translation.height + self.previewNewPosition
                
                if shouldBePosition < 0{
                    self.previewCurrentPosition = .zero
                    self.previewNewPosition = .zero
                }else{
                    let closePoint = screen.height * 0.2
                    if shouldBePosition > closePoint{
                        withAnimation {
                            self.showPreviewFullScreen = false
                            self.previewNewPosition = screen.height + 20
                            self.previewCurrentPosition = screen.height + 20
                        }
                    }else{
                        withAnimation{
                            self.previewNewPosition = .zero
                            self.previewCurrentPosition = .zero
                        }
                    }
                }
                
                previewHorizontalDragActive = false
            }
        
        ZStack {
            TabView(){
                HomeView(showPreviewFullScreen: $showPreviewFullScreen, previewStaringIndex: $previewStaringIndex)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }.tag(0)
                
                SearchView(viewModel: SearchViewModel(), movieDetailToShow: nil)
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }.tag(1)
                
                
                
                DownloadsView()
                    .tabItem {
                        Image(systemName: "arrow.down.to.line.alt")
                        Text("Downloads")
                    }.tag(3)
                
                ComingSoonView()
                    .tabItem {
                        Image(systemName: "play.rectangle")
                        Text("Coming Soon")
                    }.tag(2)
                
                MoreView()
                    .tabItem {
                        //Image(systemName: "play.rectangle")
                        Text("More")
                    }.tag(4)
                
            }
            .accentColor(.white)
            
            
            PreviewList(movies: exampleMovies, currentSelection: $previewStaringIndex, isVisible: $showPreviewFullScreen, externalDragGesture: previewDragGetsure)
                .offset(y: previewCurrentPosition)
                .isHidden(!showPreviewFullScreen)
                .animation(.easeIn)
                .transition(.move(edge: .bottom))
        }
        .onChange(of: showPreviewFullScreen, perform: { value in
            if value{
                withAnimation{
                    previewCurrentPosition = .zero
                    previewNewPosition = .zero
                }
            }else{
                self.previewCurrentPosition = screen.height + 20
                self.previewNewPosition = screen.height + 20
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
