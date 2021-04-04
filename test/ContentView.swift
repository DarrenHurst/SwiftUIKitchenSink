//
//  ContentView.swift
//  test
//
//  Created by Darren Hurst on 2021-03-17.
//

import SwiftUI
import Combine


struct ContentView: View {

    @ObservedObject var formModel: FormModel
    var body: some View {
        NavigationView {
              HomeView()
            }.navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
         HomeView().navigationBarTitle("")
            .navigationBarHidden(true)
       }
}


