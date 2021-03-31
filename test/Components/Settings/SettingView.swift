//
//  SettingView.swift
//  test
//
//  Created by Darren Hurst on 2021-03-27.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Rectangle().offset(y: -57)
                .frame(width: 300, height: 200, alignment: .leading).foregroundColor(.green)
               
        CircleImage(image: "me")
            .offset(y: -180)
            .padding(.bottom, -180)
            
        VStack(alignment: .leading) {
            
          
              Text("Darren Hurst")
            .font(.title)
            .bold()
            .foregroundColor(Color.black)
        
        Text("TD iOS Banking Mobile Team Lead")
                .font(.subheadline)
                .foregroundColor(Color.black)
        }
            
        }
    }
}
    
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

