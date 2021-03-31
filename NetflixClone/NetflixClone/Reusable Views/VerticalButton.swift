//
//  VerticalButton.swift
//  NetflixClone
//
//  Created by Abhijeet on 24/01/21.
//

import SwiftUI

struct VerticalButton: View {
    
    var text: String
    
    var onImageName: String
    var offImageName: String
    var color: Color = Color.white
    
    @State var isOn: Bool
    
    var selectedImageName: String{
        isOn ? onImageName : offImageName
    }
    
    var action: () -> Void
    
    var body: some View {
        
        Button(action: {
            action()
            isOn = isOn == true ? false : true
        }, label: {
            VStack(spacing: 8){
                Image(systemName: selectedImageName)
            
                Text(text)
                    .font(.system(size: 15))
                    .bold()
                
            }.foregroundColor(color)
        })
        
        
    }
}

struct VerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VerticalButton(text: "My List", onImageName: "checkmark", offImageName: "plus", isOn: true){
                print("HEEYYY")
            }
        }
    }
}
