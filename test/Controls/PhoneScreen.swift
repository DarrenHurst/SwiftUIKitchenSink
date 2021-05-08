//
//  loading.swift
//  test
//
//  Created by Darren Hurst on 2021-04-23.
//

import Foundation
import SwiftUI

struct PhoneScreen: View {
    
    @State var move: Bool = false
    @State private var animationAmount: CGFloat = 1
    @State var opacity: Double = 0.0
    @State var rotation: Double = 44.0 // 360.0

    var body: some View {
        GeometryReader { g in
        ZStack {
                VStack {
                Image("me")
                .resizable()
                .clipShape(Circle())
                .rotationEffect(Angle.degrees(move ? 361 : 0))
                .scaledToFit()
                .frame(width: 100, height:100, alignment: .center)
            
                .onTapGesture {
                
                self.animationAmount = self.animationAmount == 1 ? 3:1
                    self.move = self.move ? false:true
                    self.opacity = self.move ? 1.0: 0.0
                
                }
                 
                  .scaleEffect(animationAmount)
                .offset(x: move ? 0 : -8, y: move ? g.size.height / 1.15 - UIScreen.screenHeight   : 0)// geometry here to place at top center if clicked anywhere TODO
                .animation(Animation.easeIn(duration: 0.55))
                }.padding()
                VStack {
                    Text("Darren Hurst").font(.TickerFont)
                    Text("p: 6479632400").font(.Medium)
                }.padding(.trailing, 24).foregroundColor(.DarkGray)
                .offset(x: move ? 9: 5, y: move ? 100 : 80).animation(.easeIn)
            
            HStack{
                
                VStack {
                    Image(systemName: "phone").resizable().frame(width: 50, height: 50, alignment: .center).font(.LargeBoldFont).foregroundColor(.green)
                }.padding(.trailing, 190)
                .padding(.leading, 60)
                
                VStack {
                    Image(systemName: "phone.down").resizable().frame(width: 60, height: 30, alignment:.center).font(.LargeBoldFont).foregroundColor(.red)
                }.padding(.trailing, 160)
                       
            }
            .offset(x: move ? 50 : 0, y: move ? 210 : 0)
            .opacity(self.opacity).animation(.easeIn)
            .animation(Animation.easeIn(duration: 44.0))
            .rotationEffect(.radians(rotation), anchor: .center)
        }.frame(width: g.size.width, height: UIScreen.screenHeight, alignment: .top).padding(.top, 300)
            
         
        }
        .standard().padding(.leading, 33)
        .background(Color.clear)
    }
}

struct ImagePopPreview : PreviewProvider {
    static var previews: some View {
        Group {
            PhoneScreen()
        }
    }
}
