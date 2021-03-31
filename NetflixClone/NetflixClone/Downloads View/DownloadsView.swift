//
//  DownloadsView.swift
//  NetflixClone
//
//  Created by Abhijeet on 06/03/21.
//

import SwiftUI

struct DownloadsView: View {
    
    var body: some View {
    
        let screen = UIScreen.main.bounds
        
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center){
                HStack(){
                    Image(systemName: "info.circle")
                        .font(.system(size: 22))
                    Text("Smart Downloads")
                        .bold()
                        .font(.subheadline)
                    Button(action: {
                        
                    }, label: {
                        Text("ON")
                            .bold()
                            .foregroundColor(.blue)
                    })
                    Spacer()
                        
                }.padding()
                
                Spacer()
                
                VStack{
                    Image(systemName: "arrow.down.to.line.alt")
                        .frame(width: 150, height: 150)
                        .font(.system(size: 55, weight: .bold))
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(75)
                        .foregroundColor(.gray)
                        .padding(.bottom, 30)
                    
                    Text("Never be without Netflix")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)
                    
                    Text("Download shows and movies so you'll never be without something to watch -- even when you're offline.")
                        .font(.headline)
                        .padding(.bottom, 15)
                        
                
                        ZStack(){
                            Color.white
                            Button(action: {}, label: {
                                Text("See what you can download")
                                    .foregroundColor(.black)
                                    .bold()
                            })
                            
                        }
                        .frame(width:screen.size.width - 100, height: 50 )
                    
                }.padding(.bottom, 100)
                
                
                
                Spacer()
                
                
            }
            .padding()
            .foregroundColor(.white)
        }
    }
}

struct DownloadsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            DownloadsView()
        }
    }
}
