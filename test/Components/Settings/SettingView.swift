//
//  SettingView.swift
//  test
//
//  Created by Darren Hurst on 2021-03-27.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack.init(alignment: .center, spacing: nil, content: {
            Rectangle().offset(y: -57)
                .frame(width: UIScreen.screenWidth, height: 200, alignment: .leading).foregroundColor(.gray)
               
        CircleImage(image: "me")
            .offset(y: -180)
            .padding(.bottom, -180)
            
        VStack(alignment: .leading) {
              Text("Darren Hurst")
            .foregroundColor(Color.black)
            .font(Font.TDStandardFont)
            
        Text("Something")
                .foregroundColor(Color.black)
            .font(Font.TDTickerFont)
        }
            
        })
    }
}
    
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

