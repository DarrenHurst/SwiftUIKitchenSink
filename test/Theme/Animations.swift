//
//  Animations.swift
//  test
//
//  Created by Darren Hurst on 2021-04-20.
//
import Foundation
import SwiftUI




extension View {
    func runAnimation() -> Animation {
        Animation.linear(duration: 0.3).repeatCount(3)
    }
    func stopAnimation() -> Animation {
        Animation.linear(duration: 0.3)
    }
}

struct Animations {
  
    var drag = DragGesture()
                .onEnded {
                    if $0.translation.width < -100 {
                        withAnimation {
        
                        }
                    }
                }
    
         // View Modifier for returning this  TODO
        //animation(.interpolatingSpring(stiffness: 50, damping: 1))
}
