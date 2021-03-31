//
//  PagerView.swift
//  NetflixClone
//
//  Created by Abhijeet on 17/03/21.
//

import SwiftUI

struct PagerView<Content: View>: View {
    
    let pageCount: Int
    @Binding var currentIndex: Int
    @Binding var translation: CGFloat
    
    @State var verticalDragIsActive: Bool = false
    
    let externalDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>
    
    let content: Content
    
    init(pageCount: Int, currentIndex: Binding<Int>, translation: Binding<CGFloat>,
         externalDragGesture:  _EndedGesture<_ChangedGesture<DragGesture>>, @ViewBuilder content: () -> Content) {
        
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self._translation = translation
        self.externalDragGesture = externalDragGesture
        self.content = content()
    }
    
    
    var body: some View {
        GeometryReader{geometry in
            HStack(spacing: 0){
                self.content
                    .frame(width: geometry.size.width)
            }
            .frame(width:geometry.size.width, alignment: .leading)
            .offset(x: -CGFloat(self.currentIndex) * geometry.size.width)
            .offset(x: self.translation)
            .animation(.interactiveSpring())
            .gesture(
                externalDragGesture.simultaneously(
                    with:
                        DragGesture(minimumDistance: 20)
                        .onChanged({ value in
                            
                            if verticalDragIsActive{
                                return
                            }
                            
                            if abs(value.translation.width) < abs(value.translation.height){
                                if abs(value.translation.width) < 30{
                                    verticalDragIsActive = true
                                    return
                                }
                            }
                            
                            translation = value.translation.width
                        })
                        .onEnded({ value in
                            
                            if verticalDragIsActive{
                                verticalDragIsActive = false
                                return
                            }
                            
                            let offset = value.translation.width / geometry.size.width
                            let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                            currentIndex = min(max(Int(newIndex),0 ), self.pageCount - 1)
                            translation = 0
                        })
                )
            )
        }
    }
}

//struct PagerDummy: View {
//
//    @State var currentIndex: Int = 0
//    @State var translation: CGFloat = .zero
//
//    var body: some View{
//        PagerView(pageCount: 3, currentIndex: $currentIndex, translation: $translation, externalDragGesture: externalDragGesture) {
//            Color.red
//            Color.blue
//            Color.black
//        }
//    }
//}
//
//struct PagerView_Previews: PreviewProvider {
//    static var previews: some View {
//        PagerDummy()
//    }
//}
