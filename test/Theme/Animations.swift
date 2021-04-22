//
//  Animations.swift
//  test
//
//  Created by Darren Hurst on 2021-04-20.
//
import Foundation
import SwiftUI


struct Animations {
  
    var drag = DragGesture()
                .onEnded {
                    if $0.translation.width < -100 {
                        withAnimation {
                            
                        }
                    }
                }
}
