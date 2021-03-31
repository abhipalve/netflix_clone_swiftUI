//
//  SearchBar.swift
//  NetflixClone
//
//  Created by Abhijeet on 17/02/21.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    
    @State private var isEditing = true
    
    @Binding var isLoading: Bool
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            Color.graySearchBackground
                .frame(width: isEditing ? 300 : (screen.width - 20) , height:36)
                .cornerRadius(8)
            
            HStack{
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.graySearchText)
                    .padding(.leading, 10)
                
                TextField("Search", text: $text)
                    .background(Color.graySearchBackground)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .padding(7)
                    .padding(.leading, -7)
                    .onTapGesture(perform: {
                        isEditing = true
                    }).animation(.default)
                
                if !text.isEmpty{
                    if isLoading{
                        ActivityIndicator(style: .medium, animate: .constant(true))
                            .configure{
                                $0.color = .white
                            }
                            .frame(width: 35, height: 35)
                            .padding(.trailing, 18)
                        
                        /*
                        ProgressView()
                            .foregroundColor(Color.graySearchText)
                            .frame(width: 35, height: 35)
                            .padding(.trailing, 18)
                            .progressViewStyle(CircularProgressViewStyle(tint: Color.graySearchText))*/
                            
                    }else{
                        Button(action: {
                            text = ""
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(Color.graySearchText)
                                .frame(width: 35, height: 35)
                        })
                        .padding(.trailing, 18)
                    }
                }
                
                if isEditing{
                    Button(action: {
                        text = ""
                        isEditing = false
                        hideKeyboard()
                    }, label: {
                        Text("Cancel")
                            .foregroundColor(.white)
                            .padding(.trailing, 15)
                    })
                    .animation(.default)
                    .transition(.move(edge: .trailing))
                }
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            SearchBar(text: .constant(""), isLoading: .constant(false))
                .padding()
        }
    }
}
