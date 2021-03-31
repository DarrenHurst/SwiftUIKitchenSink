//
//  CircleImage.swift
//  test
//
//  Created by Darren Hurst on 2021-03-29.
//

import SwiftUI

struct CircleImage: View {
    var image: String = "me"
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .mask(Circle.init())
            .frame(width:200.0, height: 200.0, alignment: .leading)
            .fixedSize(horizontal: true, vertical: true)
            .shadow(radius: 10)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))

    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: "me")
    }
}
