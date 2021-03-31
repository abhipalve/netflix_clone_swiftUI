//
//  PreviewView.swift
//  NetflixClone
//
//  Created by Abhijeet on 27/03/21.
//

import SwiftUI

struct PreviewView: View {
    
    @ObservedObject var viewModel : PreviewViewModel
    
    var playVideo: Bool
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            
            TrailerPlayerView(videoURL: viewModel.movie.previewVideoURL, playVideo: .constant(playVideo))
            
            VStack{
                HStack{
                    VStack(alignment: .leading, spacing: 0, content: {
                        Text(viewModel.movie.name)
                            .foregroundColor(viewModel.movie.accentColor)
                            .bold()
                            .font(.largeTitle)
                    })
                    
                    Spacer()
                    
                }
                .padding(.leading)
                .padding(.top, 50)
                
                Spacer()
                
                HStack{
                    ForEach(0..<viewModel.movie.genre.count){ index in
                        
                        let category = viewModel.movie.genre[index]
                        HStack{
                            
                            Text(category)
                                .font(.footnote)
                            
                            if index != viewModel.movie.genre.count - 1 {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 3))
                            }
                        }
                    }
                    
                }
                
                HStack{
                    Spacer()
                    VerticalButton(text: "My List", onImageName: "checkmark", offImageName: "plus", color: viewModel.movie.accentColor!, isOn: true) {
                    
                    }
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        HStack{
                            Image(systemName: "arrowtriangle.right.fill")
                            Text("PLAY")
                                .fontWeight(.heavy)
                        }
                        .padding(.horizontal, 25)
                        .padding(.vertical, 12)
                        .border(viewModel.movie.accentColor!, width: 2)
                    })
                    
                    Spacer()
                    
                    VerticalButton(text: "Info", onImageName: "info.circle", offImageName: "plus",color: viewModel.movie.accentColor!, isOn: true) {
                    
                    }
                    
                    Spacer()
                }
                .padding(.top)
            }
            .foregroundColor(viewModel.movie.accentColor)
            .padding(.bottom, 48)
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView(viewModel: PreviewViewModel(movie: exampleMovie2), playVideo: true)
    }
}
