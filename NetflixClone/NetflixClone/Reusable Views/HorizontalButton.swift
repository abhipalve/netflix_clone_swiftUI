//
//  HorizontalButton.swift
//  NetflixClone
//
//  Created by Abhijeet on 24/01/21.
//

import SwiftUI

struct HorizontalButton: View {
    
    var title: String
    var imageName: String
    var size: CGSize
    var bgColor: Color = Color.white
    
    var action: () -> Void
    
    var body: some View {
        
        Button(action:action, label: {
            ZStack {
                bgColor
                
                HStack{
                    Image(systemName: imageName)
                        .font(.headline)
                    Text(title)
                        .font(.system(size: 16))
                        .bold()
                }.foregroundColor(bgColor == .white ? .black : .white)
            }.frame(width: size.width, height: size.height, alignment: .center)
        }).cornerRadius(3.0)
    }
}

struct HorizontalButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            HorizontalButton(title: "Play", imageName: "play.fill", size: CGSize(width: 100, height: 30)){
                
            }
        }
    }
}
