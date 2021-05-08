//
//  File.swift
//  test
//
//  Created by Darren Hurst on 2021-05-07.
//

import Foundation
import SwiftUI

struct OnboardPage1: View {
    @Binding var presented: Bool
    var Action: () -> Void
    
    var image: Image =  Image(systemName: "arrow.right.circle")
    var body: some View {
        ZStack {
            VStack {
                image.resizable().icon().onTapGesture {
                    self.presented = false;
                    Action()
                }
            }.standard()
        }
    }
}

struct OnboardPage1Preview: PreviewProvider {
    static var previews: some View{
        OnboardPage1(presented: .constant(true)){}
    }
}
