//
//  SettingView.swift
//  test
//
//  Created by Darren Hurst on 2021-03-27.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack (alignment: .leading) {
                  
            Rectangle()
                .fill(Color.gray)
             .frame(width:UIScreen.screenWidth, height: UIScreen.screenHeight-350.0)
                .shadow(color: .black, radius: 0, x: 1, y: 1).padding(15.0)
        VStack.init(alignment: .leading, spacing: 1.0, content: {
            Image("me")
                .resizable()
                .scaledToFit()
                .mask(Circle.init())
                .frame(width:100.0, height: 100.0, alignment: .leading)
                .fixedSize(horizontal: true, vertical: true)
                //.padding(20.0)
                //.shadow(color: .white, radius: 2, x: 4, y: 4).padding(15.0)
             
        

            Text("Darren Hurst").font(.headline).bold().padding(2.0)
            Text("TD iOS Banking Mobile Team Lead").font(.subheadline).foregroundColor(Color.white).padding(2.0)
            Divider().foregroundColor(Color.white).background(Color.white)
        
        }).padding(20.0)
        .frame(height:250.0)
            
        }
    }
}
