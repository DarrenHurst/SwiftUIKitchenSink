//
//  IconWithBounce.swift
//  test
//
//  Created by Darren Hurst on 2021-05-06.
//

import Foundation
import SwiftUI

struct IconWithBounce: View {
    @State var image: Image = Image(systemName: "leaf.arrow.circlepath")
    @Binding var run: Bool 
    
    var Action : () -> Void
    
    @Environment(\.colorScheme) var colorScheme
    var speed : Double = 0.50
    
    var body: some View {
        ZStack {
            Circle().frame(width:75, height: 75).foregroundColor(Color.red)
                //.offset(y: run ? 1 : 1)
                .opacity(0.4)
                .scaleEffect(run ? CGSize(width: 1, height: 1) : CGSize(width: 1, height: -1))
                .animation(run ? runAnimation().speed(speed) : stopAnimation())
            
            image
                .resizable()
                .rotationEffect(Angle(radians: run ? 1 : -1))
                .padding(.all, 10)
                .clipShape(Circle())
                .frame(width: 60, height: 60, alignment: .center)
                .scaledToFill()
                .foregroundColor(colorScheme == .light ? Color.black : Color.white)
                .opacity(run ? 1.0 : 1.0)
             
                .onTapGesture(perform: {
                    DispatchQueue.main.async {
                        self.Action()
                    }
                })
               
              
                .scaleEffect(run ? CGSize(width: 1, height: 1) : CGSize(width: 1, height: 1))
                
                
                .animation(run ? runAnimation().speed(speed) : stopAnimation())
                .rotationEffect(Angle(radians: run ? 0 : 360))
                  
        }
        .accessibility(hidden: false)
    }
}

struct IconWithBouncePreview: PreviewProvider {
    static var previews: some View {
        IconWithBounce(run: .constant(true)){}
    }
}
