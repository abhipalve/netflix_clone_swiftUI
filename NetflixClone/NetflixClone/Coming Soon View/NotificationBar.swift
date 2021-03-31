//
//  NotificationBAr.swift
//  NetflixClone
//
//  Created by Abhijeet on 06/03/21.
//

import SwiftUI

struct NotificationBar: View {
    
    @Binding var showNotificationList: Bool
    var body: some View {
        
        Button(action: {
            showNotificationList = true
        }, label: {
            HStack{
                Image(systemName: "bell")
                Text("Notifications")
                Spacer()
                Image(systemName: "chevron.right")
            }.font(.system(size: 18, weight: .bold))
        })
        .foregroundColor(.white)
        .padding()
    }
}

struct NotificationBAr_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            NotificationBar(showNotificationList: .constant(false))
        }
    }
}
