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
            NavigationView {
               Accounts().offset(y:24)// size of tabbar
         
            }
                   .navigationBarTitle("")
            .navigationBarHidden(true)
         
               
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
 
    static var previews: some View {
        ContentView().buttonStyle(BorderlessButtonStyle())
      //  HomeView(showMenu: .constant(false)).navigationBarTitle("")
        //    .navigationBarHidden(true)
       }
}


