//
//  ContentView.swift
//  test
//
//  Created by Darren Hurst on 2021-03-17.
//

import SwiftUI
import Combine


struct ContentView: View {
    
    var body: some View {
        VStack {
            HomeView().frame(height: UIScreen.screenHeight - 50) // size of tabbar
            TDtabBar().frame(width: UIScreen.screenWidth, height: 44, alignment:.top)
                .background(Color.white).offset(y:-44)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
 
    static var previews: some View {
        ContentView()
      //  HomeView(showMenu: .constant(false)).navigationBarTitle("")
        //    .navigationBarHidden(true)
       }
}


