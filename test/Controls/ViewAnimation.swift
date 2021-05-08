//
//  LottieAnimation.swift
//  test
//
//  Created by Darren Hurst on 2021-05-06.
//

import Foundation
import SwiftUI
struct ViewAnimation : View {
    @Binding var run : Bool
    @State var rotate : Bool = false
    @State var scale: Bool = false
    @State var move: Bool = false
    @State var image: Image = Image(systemName: "info.circle")
    var Action: () -> Void
    
    var runAnimation: Animation {
        Animation.linear(duration: 0.3)
          .repeatForever()
      }
    var stopAnimation: Animation {
        Animation.linear(duration: 0.3)
      }

    var body: some View {
        ZStack{
            Circle().frame(width:55, height: 55).foregroundColor(Color.DarkGray)
                .offset(y: run ? 10 : 0)
                .scaleEffect(run ? CGSize(width: 1.43, height: 1.23) : CGSize(width: 1, height: 1))
                .animation(run ? runAnimation : stopAnimation)
                
            
            image.resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .scaledToFill().foregroundColor(.black).opacity(0.8).background(Color.blue)
           
            .clipShape(Circle())
                .onTapGesture(perform: {
                    self.run = !self.run ? true : false
                    Action()
                })
                .frame(width: 50, height: 50, alignment: .center)
                
                .scaleEffect(run ? CGSize(width: 1.43, height: 1.23) : CGSize(width: 1, height: 1))
                .rotationEffect(Angle(radians: run ? 0 : 0.05))
                .offset(y: run ? -10 : 0)
                .animation(run ? runAnimation : stopAnimation)

        }
    }
    
   
    
}

struct ViewAnimationPreview : PreviewProvider {
    static var previews: some View {
        Group {
            ViewAnimation(run: .constant(true), Action: {
           
            })
          
        }
    }
}
